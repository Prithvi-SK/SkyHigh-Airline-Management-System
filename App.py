from flask import Flask, render_template, request, redirect, url_for, flash, session
import mysql.connector
from datetime import datetime

app = Flask(__name__)
app.secret_key = "your_secret_key"

# Database connection
db_config = {
    'host': 'localhost',
    'user': 'root',  # Update with your MySQL username
    'password': 'pritsql',  # Update with your MySQL password
    'database': 'airline_reservation'
}

# Route for login
@app.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form['email']
        password = request.form['password']

        try:
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor(dictionary=True)

            # Encrypt the input password using the database function
            cursor.execute("SELECT encrypt_password(%s) AS encrypted_password", (password,))
            encrypted_password = cursor.fetchone()['encrypted_password']

            # Verify email and encrypted password
            query = "SELECT * FROM PASSENGER WHERE Email = %s AND Password = %s"
            cursor.execute(query, (email, encrypted_password))
            user = cursor.fetchone()
            cursor.close()
            conn.close()

            if user:
                session['user_id'] = user['PassengerID']  # Store user ID in session
                flash("Login successful!", "success")
                return redirect(url_for("dashboard"))
            else:
                flash("Invalid email or password!", "danger")
        except mysql.connector.Error as err:
            flash(f"Database error: {err}", "danger")

    return render_template("login.html")

# Route for dashboard
@app.route("/dashboard")
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM FLIGHT")
        flights = cursor.fetchall()
        cursor.close()
        conn.close()
        return render_template("dashboard.html", flights=flights)
    except mysql.connector.Error as err:
        flash(f"Database error: {err}", "danger")
        return redirect(url_for('login'))

# Route to select seats for a chosen flight
@app.route("/select_seat/<flight_id>", methods=["GET", "POST"])
def select_seat(flight_id):
    if 'user_id' not in session:
        return redirect(url_for('login'))

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        # Get seat details for the selected flight
        cursor.execute("""
            SELECT * FROM SEAT
            WHERE FlightID = %s
        """, (flight_id,))
        seats = cursor.fetchall()

        # Get flight class and prices
        cursor.execute("SELECT AvailableClass FROM FLIGHT WHERE FlightID = %s", (flight_id,))
        flight_details = cursor.fetchone()
        class_price = {
            'ECONOMY': 3000,
            'BUSINESS': 7000,
            'FIRST': 10000
        }
        price = class_price.get(flight_details['AvailableClass'], 0)

        cursor.close()
        conn.close()

        if request.method == "POST":
            # Get the selected seat ID from the form
            selected_seat_id = request.form.get('seat')
            print(f"Selected Seat ID: {selected_seat_id}")
            
            if selected_seat_id:
                # Recheck seat availability in the SEAT table
                conn = mysql.connector.connect(**db_config)
                cursor = conn.cursor(dictionary=True)
                cursor.execute("SELECT Status FROM SEAT WHERE SeatID = %s", (selected_seat_id,))
                seat_status = cursor.fetchone()['Status']
                print(f"Seat Status: {seat_status}")

                cursor.close()
                conn.close()

                # If the seat is available, proceed with booking
                if seat_status == "AVAILABLE":
                    # Insert booking details into the booking table
                    conn = mysql.connector.connect(**db_config)
                    cursor = conn.cursor()

                    # Generate BookingID (you can use current timestamp for simplicity)
                    booking_id = f"BOOK{datetime.now().strftime('%Y%m%d%H%M%S')}"
                    cursor.execute("""
                        INSERT INTO BOOKING (BookingID, PassengerID, FlightID, SeatID, Amount, Status, PaymentStatus)
                        VALUES (%s, %s, %s, %s, %s, %s, %s)
                    """, (booking_id, session['user_id'], flight_id, selected_seat_id, price, 'CONFIRMED', 'PAID'))
                    conn.commit()
                    cursor.close()
                    conn.close()

                    flash("Booking successful!", "success")
                    return redirect(url_for("dashboard"))
                else:
                    flash("Selected seat is not available!", "danger")
            else:
                flash("Please select a seat!", "danger")

        return render_template("select_seat.html", seats=seats, flight_id=flight_id, price=price)

    except mysql.connector.Error as err:
        flash(f"Database error: {err}", "danger")
        return redirect(url_for('dashboard'))



# Route for logout
@app.route("/logout")
def logout():
    session.pop('user_id', None)
    flash("You have been logged out.", "info")
    return redirect(url_for("login"))

if __name__ == "__main__":
    app.run(debug=True)
