USE hotel;

# 1) Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT concat(guest.firstname, ' ', guest.lastname) as 'full name', reservation.roomNo, reservation.start, reservation.end
FROM (reservation
INNER JOIN guest ON reservation.guestId = guest.id)
WHERE reservation.end >= '2023-07-01' AND reservation.end <= '2023-07-31'
ORDER BY reservation.start;

# --------OUTPUT:----------------------------
# full name; roomNo; start; end
# Sarah Clark;    205; 2023-06-28; 2023-07-02
# Walter Holaway; 204; 2023-07-13; 2023-07-14
# Wilfred Vise;   401; 2023-07-18; 2023-07-21
# Bettyann Seery; 303; 2023-07-28; 2023-07-29
#--------------------------------------------



# 2) Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT concat(guest.firstname, ' ', guest.lastname) as 'full name', reservation.roomNo, reservation.start, reservation.end
FROM (reservation
INNER JOIN guest ON reservation.guestId = guest.id)
WHERE reservation.roomNo = (SELECT roomNo
	FROM room_amenity
		WHERE amenityId = 2
		AND roomNo = reservation.roomNo)
ORDER BY reservation.start;

# --------OUTPUT:----------------------------
# full name; roomNo; start; end
# Bettyann Seery;  203; 2023-02-05; 2023-02-10
# Duane Cullison;  305; 2023-02-22; 2023-02-24
# Karie Yang;      201; 2023-03-06; 2023-03-07
# Sarah Clark;     307; 2023-03-17; 2023-03-20
# Walter Holaway;  301; 2023-04-09; 2023-04-13
# Wilfred Vise;    207; 2023-04-23; 2023-04-24
# Sarah Clark;     205; 2023-06-28; 2023-07-02
# Bettyann Seery;  303; 2023-07-28; 2023-07-29
# Bettyann Seery;  305; 2023-08-30; 2023-09-01
# Karie Yang;      203; 2023-09-13; 2023-09-15
# Mack Simmer;     301; 2023-11-22; 2023-11-25
#--------------------------------------------



# 3) Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
#    the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT concat(guest.firstname, ' ', guest.lastname) as 'full name', reservation.roomNo, reservation.start, reservation.adults+reservation.children AS 'number of people'
FROM (reservation
INNER JOIN guest ON reservation.guestId = guest.id)
WHERE guest.lastName = 'Simmer'
ORDER BY reservation.start;

# --------OUTPUT:----------------------------
# full name; roomNo; start; number of people
# Mack Simmer; 308; 2023-02-02; 1
# Mack Simmer; 208; 2023-09-16; 2
# Mack Simmer; 206; 2023-11-22; 2
# Mack Simmer; 301; 2023-11-22; 4
#--------------------------------------------



# 4) Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
#    The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT room.number AS 'Room Number', reservation.Id AS 'Reservation ID', reservation.cost AS 'Per-room Cost'
FROM (reservation
RIGHT JOIN room ON reservation.roomNo = room.number)
ORDER BY room.number;

# --------OUTPUT:----------------------------
# Room Number;Reservation ID;Per-room Cost
# 201; 4;  199.99
# 202; 7;  349.98
# 203; 2;  999.95
# 203; 21; 399.98
# 204; 16; 184.99
# 205; 15; 699.96
# 206; 12; 599.96
# 206; 23; 449.97
# 207; 10; 174.99
# 208; 13; 599.96
# 208; 20; 149.99
# 301; 9;  799.96
# 301; 24; 599.97
# 302; 6;  924.95
# 302; 25; 699.96
# 303; 18; 199.99
# 304; 14; 184.99
# 305; 3;  349.98
# 305; 19; 349.98
# 306; \N; \N
# 307; 5;  524.97
# 308; 1;  299.98
# 401; 11; 1199.97
# 401; 17; 1259.97
# 401; 22; 1199.97
# 402; \N;\N
#--------------------------------------------



# 5) Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.
SELECT room.number AS 'Room Number', room.maxOcc AS 'Capacity', reservation.start, reservation.end
FROM (reservation
INNER JOIN room ON reservation.roomNo = room.number)
WHERE ((reservation.start >= '2023-04-01' AND reservation.start <= '2023-04-31') OR (reservation.end >= '2023-04-01' AND reservation.end <= '2023-04-31')) AND (room.maxOcc > 2)
ORDER BY reservation.start;

# --------OUTPUT:----------------------------
# Room Number;Capacity;start;end
# 301; 4; 2023-04-09; 2023-04-13
#--------------------------------------------



# 6) Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest 
#    with the most reservations and then by the guest's last name.
SELECT DISTINCT concat(guest.firstname, ' ', guest.lastname) as 'Full Name', COUNT(reservation.guestId) AS 'Number of Reservations'
FROM (reservation
RIGHT JOIN guest ON reservation.guestId = guest.id)
GROUP BY guest.id;

# --------OUTPUT:----------------------------
# Full Name; Number of Reservations
# Sarah Clark;         2
# Mack Simmer;         4
# Bettyann Seery;      3
# Duane Cullison;      2
# Karie Yang;          2
# Aurore Lipton;       2
# Zachery Luechtefeld; 1
# Walter Holaway;      2
# Wilfred Vise;        2
# Maritza Tilton;      2
# Joleen Tison;        2
#--------------------------------------------



# 7) Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT CONCAT(firstname, ' ', lastname) as 'Full Name', CONCAT(address, ', ', city, ', ', state, ', ', zip) AS 'Address', phone AS 'Phone No.'
FROM guest
WHERE phone = '(834)727-1001';

# --------OUTPUT:----------------------------
# Full Name; Address; Phone No.
# Wilfred Vise; 77 West Surrey Street, Oswego, NY, 13126; (834)727-1001
#--------------------------------------------
