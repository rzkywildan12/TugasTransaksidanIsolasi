--Membuat beberapa table
--1. Table booking
CREATE TABLE booking (
    booking_id int primary key,
    user_id int,
    room_id int,
    check_in varchar(50),
    check_out varchar(50),
    total_price varchar(50),
    booking_status varchar(50)
);
--Memasukan data kedalam table "booking"
insert into booking VALUES
('1001', '1', '11', '01-05-2025', '05-05-2025', 'Rp. 2.400.000', 'Booked'),
('1002', '2', '12', '04-04-2025', '05-04-2025', 'Rp .900.000', 'Booked'),
('1003', '3', '13', '04-04-2025', '08-04-2025', 'Rp. 4.000.000', 'Booked'),
('1004', '4', '14', '03-02-2025', '04-02-2025', 'Rp. 1.000.000', 'Booked'),
('1005', '5', '15', '17-01-2025', '19-01-2025', 'Rp. 1.550.000', 'Booked');

--2. Table hotel
CREATE TABLE hotel (
    hotel_id int(11),
    hotel_name varchar(50),
    addres varchar(50),
    city varchar(50),
    rating varchar(50)
);
--Memasukan data kedalam table "hotel"
insert into hotel VALUES
('101', 'trambesi', ' jl. bsd raya', 'bsd', ' 4.9'),
('102', 'amaris', 'jl. jakarta no 50', 'jakarta', '4.8'),
('103', 'grand zuri', ' jl.medan merdeka', 'medan', '4.9'),
('104', 'grand hyatt', 'jl.jakarta no.100', 'jakarta', '5.0'),
('105', 'borobudur', 'jl.bundaran HI', 'jl.bundaran HI', 'jakarta', '5,0');

--3. Table payment
create table payment (
    payment_id int primary key,
    booking_id int,
    payment_method varchar (50),
    payment_date varchar (50),
    amount_paid varchar (50),
    payment_status varchar (50)
);
--Memasukan data kedalam table "payment"
insert into payment VALUES
('111', '1001', 'cash', '28-04-2025', 'Rp.2.400.000', 'paid'),
('112', '1002', 'debit', '02-04-2025', 'Rp.900.000', 'paid'),
('113', '1003', 'cash', '03-04-2025', 'Rp.4.000.000', 'paid'),
('114', '1004', 'debit', '30-01-2025', 'Rp.1.000.000', 'paid'),
('115', '1005', 'debit', '15-01-2025', 'Rp.1.550.000', 'paid');

--4. Table room
CREATE TABLE room (
    room_id int(11),
    hotel_id int(11),
    room_type varchar(50),
    availability varchar(50),
    price varchar(50)
);
----Memasukan data kedalam table "room"
insert into room VALUES
('11', '101', 'deluxe room', 'available', 'Rp.600.000'),
('12', '102', 'superior room', 'available', 'Rp.900.000'),
('13', '103', 'suite room', 'available', 'Rp.1.000.000'),
('14', '104', 'twin room', 'available', 'Rp.1.000.000'),
('15', '105', 'single room', 'available', 'Rp.775.000');

--5. Table user
CREATE TABLE user (
    user_id int(11),
    username varchar(50),
    email varchar(50),
    password varchar(50),
    phone_number varchar(50),
    created_dated varchar(50)
);
----Memasukan data kedalam table "user"
INSERT INTO user (user_id, username, email, password, phone_number, created_dated) VALUES
('1', 'rafli', 'rafli@gmail.com', '1234', '08976543', '2023-05-01'),
('2', 'ramadhan', 'ramadhan@gmail.com', '5678', '08987654', '2023-04-04'),
('3', 'dika', 'dika@gmail.com', '9098', '08765432', '2023-04-04'),
('4', 'valya', 'valya@gmail.com', '7654', '08987676', '2023-02-03'),
('5', 'dira', 'dira@gmail.com', '3212', '08987652', '2023-01-17');

--TAHAP PEMBUATAN USER
--1. Membuat user
CREATE USER 'rafli'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'ramadhan'@'localhost' IDENTIFIED BY '5678';
CREATE USER 'dika'@'localhost' IDENTIFIED BY '9098';

-- 2. Berikan Hak Akses
-- rafli sebagai admin (akses penuh)
GRANT ALL PRIVILEGES ON reddoorz.* TO 'rafli'@'localhost';

-- ramadhan sebagai staff (boleh SELECT, INSERT, dan UPDATE)
GRANT SELECT, INSERT, UPDATE ON reddoorz.* TO 'ramadhan'@'localhost';

-- dika sebagai viewer (hanya boleh SELECT)
GRANT SELECT ON reddoorz.* TO 'dika'@'localhost';

-- Terapkan perubahan
FLUSH PRIVILEGES;


--3. Uji Akses
mysql -u rafli -p
mysql -u ramadhan -p
mysql -u dika -p
