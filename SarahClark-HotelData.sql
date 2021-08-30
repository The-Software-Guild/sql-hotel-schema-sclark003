USE hotel;


INSERT INTO room (NUMBER, TYPE, ADA, standardOcc, maxOcc, basePrice, extraPerson) VALUES
	(201, 'Double', FALSE, 2, 4, 199.99, 10),
	(202, 'Double', TRUE, 2, 4, 174.99, 10),
	(203, 'Double', FALSE, 2, 4, 199.99, 10),
	(204, 'Double', TRUE, 2, 4, 174.99, 10),
	(205, 'Single', FALSE, 2, 2, 174.99, NULL),
	(206, 'Single', TRUE, 2, 2, 149.99, NULL),
	(207, 'Single', FALSE, 2, 2, 174.99, NULL),
	(208, 'Single', TRUE, 2, 2, 149.99, NULL),
	(301, 'Double', FALSE, 2, 4, 199.99, 10),
	(302, 'Double', TRUE, 2, 4, 174.99, 10),
	(303, 'Double', FALSE, 2, 4, 199.99, 10),
	(304, 'Double', TRUE, 2, 4, 174.99, 10),
	(305, 'Single', FALSE, 2, 2, 174.99, NULL),
	(306, 'Single', TRUE, 2, 2, 149.99, NULL),
	(307, 'Single', FALSE, 2, 2, 174.99, NULL),
	(308, 'Single', TRUE, 2, 2, 149.99, NULL),
	(401, 'Suite', TRUE, 3, 8, 399.99, 20),
	(402, 'Suite', TRUE, 3, 8, 399.99, 20);

	
INSERT INTO amenity (TYPE) VALUES
	('Microwave'),
	('Jacuzzi'),
	('Refrigerator'),
	('Oven');
	
	
INSERT INTO room_amenity (roomNo, amenityId) VALUES
	(201, 1),
	(203, 1),
	(205, 1),
	(206, 1),
	(207, 1),
	(208, 1),
	(301, 1),
	(303, 1),
	(305, 1),
	(306, 1),
	(307, 1),
	(308, 1),
	(401, 1),
	(402, 1),
	(201, 2),
	(203, 2),
	(205, 2),
	(207, 2),
	(301, 2),
	(303, 2),
	(305, 2),
	(307, 2),
	(202, 3),
	(204, 3),
	(205, 3),
	(206, 3),
	(207, 3),
	(208, 3),
	(302, 3),
	(304, 3),
	(305, 3),
	(306, 3),
	(307, 3),
	(308, 3),
	(401, 3),
	(402, 3),
	(401, 4),
	(402, 4);


INSERT INTO guest (firstName, lastName, address, city, state, zip, phone) VALUES
	('Sarah', 'Clark', '2 Roundheads End', 'Beaconsfield', 'BK', '33333', '(293)553-0508'),
	('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291)553-0508'),
	('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478)277-9632'),
	('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308)494-0198'),
	('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214)730-0298'),
	('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377)507-0974'),
	('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814)485-2615'),
	('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279)491-0960'),
	('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446)396-6785'),
	('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834)727-1001'),
	('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446)351-6860'),
	('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231)893-2755');


INSERT INTO reservation (guestId, roomNo, adults, children, START, END, cost) VALUES
	(2, 308, 1, 0, '2023-02-02', '2023-02-04', 299.98),
	(3, 203, 2, 1, '2023-02-05', '2023-02-10', 999.95),
	(4, 305, 2, 0, '2023-02-22', '2023-02-24', 349.98),
	(5, 201, 2, 2, '2023-03-06', '2023-03-07', 199.99),
	(1, 307, 1, 1, '2023-03-17', '2023-03-20', 524.97),
	(6, 302, 3, 0, '2023-03-18', '2023-03-23', 924.95),
	(7, 202, 2, 2, '2023-03-29', '2023-03-31', 349.98),
	(8, 304, 2, 0, '2023-03-31', '2023-04-05', 874.95),
	(9, 301, 1, 0, '2023-04-09', '2023-04-13', 799.96),
	(10, 207, 1, 1, '2023-04-23', '2023-04-24', 174.99),
	(11, 401, 2, 4, '2023-05-30', '2023-06-02', 1199.97),
	(12, 206, 2, 0, '2023-06-10', '2023-06-14', 599.96),
	(12, 208, 1, 0, '2023-06-10', '2023-06-14', 599.96),
	(6, 304, 3, 0, '2023-06-17', '2023-06-18', 184.99),
	(1, 205, 2, 0, '2023-06-28', '2023-07-02', 699.96),
	(9, 204, 3, 1, '2023-07-13', '2023-07-14', 184.99),
	(10, 401, 4, 2, '2023-07-18', '2023-07-21', 1259.97),
	(3, 303, 2, 1, '2023-07-28', '2023-07-29', 199.99),
	(3, 305, 1, 0, '2023-08-30', '2023-09-01', 349.98),
	(2, 208, 2, 0, '2023-09-16', '2023-09-17', 149.99),
	(5, 203, 2, 2, '2023-09-13', '2023-09-15', 399.98),
	(4, 401, 2, 2, '2023-11-22', '2023-11-25', 1199.97),
	(2, 206, 2, 0, '2023-11-22', '2023-11-25', 449.97),
	(2, 301, 2, 2, '2023-11-22', '2023-11-25', 599.97),
	(11, 302, 2, 0, '2023-12-24', '2023-12-28', 699.96);


DELETE FROM reservation
WHERE reservation.guestId IN (SELECT guest.id FROM guest WHERE lastName = 'Pendergrass');

DELETE FROM guest
WHERE lastName = 'Pendergrass';

SELECT * FROM room;
SELECT * FROM amenity;
SELECT * FROM room_amenity;
SELECT * FROM guest;
SELECT * FROM reservation;