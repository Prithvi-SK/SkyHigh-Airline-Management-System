-- CREATE DATABASE airline_reservation;
-- USE airline_reservation;

-- CREATE TABLE FLIGHT (
--     FlightID VARCHAR(20) PRIMARY KEY,
--     DepartureTime DATETIME NOT NULL,
--     ArrivalTime DATETIME NOT NULL,
--     Source VARCHAR(50) NOT NULL,
--     Destination VARCHAR(50) NOT NULL,
--     AvailableClass ENUM('ECONOMY', 'BUSINESS', 'FIRST') NOT NULL,
--     TotalSeats INT NOT NULL,
--     AvailableSeats INT NOT NULL,
--     Status E NUM('ON_TIME', 'DELAYED', 'CANCELLED', 'BOARDING', 'DEPARTED', 'LANDED') NOT NULL
-- );


-- CREATE TABLE PASSENGER (
--     PassengerID INT  PRIMARY KEY AUTO_INCREMENT,
--     FirstName VARCHAR(50) NOT NULL,
--     LastName VARCHAR(50) NOT NULL,
--     Password VARCHAR(50) NOT NULL,
--     Email VARCHAR(100) NOT NULL,
--     Phone VARCHAR(20) NOT NULL,
--     SeatPreference ENUM('WINDOW', 'AISLE', 'NO_PREFERENCE') NOT NULL,
--     CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );

-- CREATE TABLE SEAT (
--     SeatID VARCHAR(20) PRIMARY KEY,
--     FlightID VARCHAR(20),
--     SeatNumber VARCHAR(10) NOT NULL,
--     SeatClass ENUM('ECONOMY', 'BUSINESS', 'FIRST') NOT NULL,
--     Status ENUM('AVAILABLE', 'BOOKED', 'BLOCKED') NOT NULL,
--     Position ENUM('WINDOW', 'MIDDLE', 'AISLE') NOT NULL,
--     FOREIGN KEY (FlightID) REFERENCES FLIGHT(FlightID)
-- );

-- CREATE TABLE BOOKING (
--     BookingID VARCHAR(20) PRIMARY KEY,
--     PassengerID INT ,
--     FlightID VARCHAR(20),
--     SeatID VARCHAR(20),
--     BookingDate DATETIME DEFAULT CURRENT_TIMESTAMP,
--     Status ENUM('CONFIRMED', 'CANCELLED', 'PENDING') NOT NULL,
--     Amount DECIMAL(10,2) NOT NULL,
--     PaymentStatus ENUM('PAID', 'PENDING', 'REFUNDED') NOT NULL,
--     CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
--     UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     FOREIGN KEY (PassengerID) REFERENCES PASSENGER(PassengerID),
--     FOREIGN KEY (FlightID) REFERENCES FLIGHT(FlightID),
--     FOREIGN KEY (SeatID) REFERENCES SEAT(SeatID)
-- );

-- CREATE TABLE LOYALTY_PROGRAM (
--     ProgramID VARCHAR(20) PRIMARY KEY,
--     PassengerID INT,
--     MilesAccumulated INT DEFAULT 0,
--     PointsBalance INT DEFAULT 0,
--     PointsRedeemed INT DEFAULT 0,
--     MembershipTier ENUM('BASIC', 'SILVER', 'GOLD', 'PLATINUM') NOT NULL,
--     JoinDate DATETIME DEFAULT CURRENT_TIMESTAMP,
--     LastActivityDate DATETIME,
--     FOREIGN KEY (PassengerID) REFERENCES PASSENGER(PassengerID)
-- );





-- INSERT INTO SEAT (SeatID, FlightID, SeatNumber, SeatClass, Status, Position) VALUES
-- -- Seats for Flight FL001
-- ('S006', 'FL001', 'A2', 'ECONOMY', 'AVAILABLE', 'WINDOW'),
-- ('S007', 'FL001', 'B2', 'ECONOMY', 'BOOKED', 'MIDDLE'),
-- ('S008', 'FL001', 'C2', 'ECONOMY', 'AVAILABLE', 'AISLE'),
-- ('S009', 'FL001', 'D2', 'ECONOMY', 'AVAILABLE', 'WINDOW'),
-- ('S010', 'FL001', 'E2', 'ECONOMY', 'BOOKED', 'AISLE'),
-- ('S011', 'FL001', 'A3', 'ECONOMY', 'AVAILABLE', 'MIDDLE'),
-- ('S012', 'FL001', 'B3', 'ECONOMY', 'AVAILABLE', 'WINDOW'),
-- ('S013', 'FL001', 'C3', 'ECONOMY', 'BOOKED', 'AISLE'),
-- ('S014', 'FL001', 'D3', 'ECONOMY', 'AVAILABLE', 'MIDDLE'),
-- ('S015', 'FL001', 'E3', 'ECONOMY', 'AVAILABLE', 'AISLE'),

-- -- Seats for Flight FL002
-- ('S016', 'FL002', 'A4', 'BUSINESS', 'AVAILABLE', 'WINDOW'),
-- ('S017', 'FL002', 'B4', 'BUSINESS', 'BOOKED', 'MIDDLE'),
-- ('S018', 'FL002', 'C4', 'BUSINESS', 'AVAILABLE', 'AISLE'),
-- ('S019', 'FL002', 'D4', 'BUSINESS', 'BOOKED', 'WINDOW'),
-- ('S020', 'FL002', 'E4', 'BUSINESS', 'AVAILABLE', 'AISLE'),
-- ('S021', 'FL002', 'A5', 'BUSINESS', 'AVAILABLE', 'MIDDLE'),
-- ('S022', 'FL002', 'B5', 'BUSINESS', 'AVAILABLE', 'WINDOW'),
-- ('S023', 'FL002', 'C5', 'BUSINESS', 'BOOKED', 'AISLE'),
-- ('S024', 'FL002', 'D5', 'BUSINESS', 'AVAILABLE', 'MIDDLE'),
-- ('S025', 'FL002', 'E5', 'BUSINESS', 'AVAILABLE', 'AISLE'),

-- -- Seats for Flight FL003
-- ('S026', 'FL003', 'A6', 'FIRST', 'AVAILABLE', 'WINDOW'),
-- ('S027', 'FL003', 'B6', 'FIRST', 'BOOKED', 'MIDDLE'),
-- ('S028', 'FL003', 'C6', 'FIRST', 'AVAILABLE', 'AISLE'),
-- ('S029', 'FL003', 'D6', 'FIRST', 'BOOKED', 'WINDOW'),
-- ('S030', 'FL003', 'E6', 'FIRST', 'AVAILABLE', 'AISLE'),
-- ('S031', 'FL003', 'A7', 'FIRST', 'AVAILABLE', 'MIDDLE'),
-- ('S032', 'FL003', 'B7', 'FIRST', 'AVAILABLE', 'WINDOW'),
-- ('S033', 'FL003', 'C7', 'FIRST', 'BOOKED', 'AISLE'),
-- ('S034', 'FL003', 'D7', 'FIRST', 'AVAILABLE', 'MIDDLE'),
-- ('S035', 'FL003', 'E7', 'FIRST', 'AVAILABLE', 'AISLE'),

-- -- Seats for Flight FL004
-- ('S036', 'FL004', 'A8', 'ECONOMY', 'AVAILABLE', 'WINDOW'),
-- ('S037', 'FL004', 'B8', 'ECONOMY', 'BOOKED', 'MIDDLE'),
-- ('S038', 'FL004', 'C8', 'ECONOMY', 'AVAILABLE', 'AISLE'),
-- ('S039', 'FL004', 'D8', 'ECONOMY', 'BOOKED', 'WINDOW'),
-- ('S040', 'FL004', 'E8', 'ECONOMY', 'AVAILABLE', 'AISLE'),
-- ('S041', 'FL004', 'A9', 'ECONOMY', 'AVAILABLE', 'MIDDLE'),
-- ('S042', 'FL004', 'B9', 'ECONOMY', 'AVAILABLE', 'WINDOW'),
-- ('S043', 'FL004', 'C9', 'ECONOMY', 'BOOKED', 'AISLE'),
-- ('S044', 'FL004', 'D9', 'ECONOMY', 'AVAILABLE', 'MIDDLE'),
-- ('S045', 'FL004', 'E9', 'ECONOMY', 'AVAILABLE', 'AISLE');











-- DELIMITER $$

-- CREATE FUNCTION encrypt_password(pwd VARCHAR(255)) RETURNS VARCHAR(255)
-- DETERMINISTIC
-- BEGIN
--     DECLARE encrypted_pwd VARCHAR(255) DEFAULT '';
--     DECLARE i INT DEFAULT 1;
--     DECLARE current_char CHAR(1);

--     WHILE i <= CHAR_LENGTH(pwd) DO
--         SET current_char = SUBSTRING(pwd, i, 1);
--         IF current_char BETWEEN 'a' AND 'z' THEN
--             SET encrypted_pwd = CONCAT(encrypted_pwd, CHAR(((ASCII(current_char) - 97 + 3) MOD 26) + 97));
--         ELSEIF current_char BETWEEN 'A' AND 'Z' THEN
--             SET encrypted_pwd = CONCAT(encrypted_pwd, CHAR(((ASCII(current_char) - 65 + 3) MOD 26) + 65));
--         ELSE
--             SET encrypted_pwd = CONCAT(encrypted_pwd, current_char);
--         END IF;
--         SET i = i + 1;
--     END WHILE;
--     RETURN encrypted_pwd;
-- END$$

-- DELIMITER ;










-- Trigger
-- DELIMITER $$

-- CREATE TRIGGER update_seat_status AFTER INSERT ON BOOKING
-- FOR EACH ROW
-- BEGIN
--     UPDATE SEAT
--     SET Status = 'BOOKED'
--     WHERE SeatID = NEW.SeatID;
-- END$$

-- DELIMITER ;



-- -- Calling it
-- DELIMITER $$

-- CREATE PROCEDURE book_flight(
--     IN p_passenger_id INT,
--     IN p_flight_id VARCHAR(20),
--     IN p_class ENUM('ECONOMY', 'BUSINESS', 'FIRST'),
--     IN p_type ENUM('WINDOW', 'MIDDLE', 'AISLE'),
--     OUT p_status_message VARCHAR(255)
-- )
-- BEGIN
--     DECLARE v_seat_id VARCHAR(20);
--     DECLARE v_available INT;

--     -- Check if there are available seats
--     SELECT SeatID
--     INTO v_seat_id
--     FROM SEAT
--     WHERE FlightID = p_flight_id
--       AND SeatClass = p_class
--       AND Position = p_type
--       AND Status = 'AVAILABLE'
--     LIMIT 1;

--     IF v_seat_id IS NOT NULL THEN
--         -- Insert booking
--         INSERT INTO BOOKING (BookingID, PassengerID, FlightID, SeatID, Status, Amount, PaymentStatus)
--         VALUES (UUID(), p_passenger_id, p_flight_id, v_seat_id, 'CONFIRMED', 100.00, 'PAID'); -- Example price
--         SET p_status_message = 'Booking successful!';
--     ELSE
--         SET p_status_message = 'No seats available for the selected criteria.';
--     END IF;
-- END$$

-- DELIMITER ;


    

DELIMITER //

CREATE TRIGGER after_booking_insert
AFTER INSERT ON BOOKING
FOR EACH ROW
BEGIN
    -- Update the status of the seat to 'BOOKED'
    UPDATE SEAT
    SET Status = 'BOOKED'
    WHERE SeatID = NEW.SeatID;
END //

DELIMITER ;
