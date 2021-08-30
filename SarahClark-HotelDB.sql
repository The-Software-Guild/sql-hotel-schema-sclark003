#DROP DATABASE hotel;

CREATE DATABASE hotel;

USE hotel;

CREATE OR REPLACE TABLE room (
  number INT                              PRIMARY KEY,
  type ENUM('Double', 'Single', 'Suite')  NOT NULL,
  ADA BOOLEAN                             NOT NULL,
  standardOcc INT                         NOT NULL CHECK (standardOcc > 0),
  maxOcc INT                              NOT NULL CHECK (maxOcc > 0),
  basePrice FLOAT                         NOT NULL CHECK (basePrice > 0),
  extraPerson INT
);

CREATE OR REPLACE TABLE amenity (
  id INT     PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(20)
);

CREATE OR REPLACE TABLE room_amenity (
  roomNo int,
  amenityId int
);

CREATE OR REPLACE TABLE guest (
  id INT                  PRIMARY KEY AUTO_INCREMENT,
  firstName varchar(30)   NOT NULL CHECK (firstName != ""),
  lastName varchar(30)    NOT NULL CHECK (lastName != ""),
  address varchar(50)     NOT NULL CHECK (address != ""),
  city varchar(20)        NOT NULL CHECK (city != ""),
  state char(2)           NOT NULL CHECK (state != ""),
  zip char(5)             NOT NULL CHECK (zip != ""),
  phone char(13)          NOT NULL CHECK (phone != "")
);

CREATE OR REPLACE TABLE reservation (
  id INT          PRIMARY KEY AUTO_INCREMENT,
  guestId INT     NOT NULL,
  roomNo INT      NOT NULL,
  adults INT      NOT NULL CHECK (adults > 0),
  children INT,
  start DATE      NOT NULL,
  end DATE        NOT NULL,
  cost FLOAT      NOT NULL CHECK (cost > 0)
);


ALTER TABLE room_amenity ADD CONSTRAINT roomAmenity_room_fk FOREIGN KEY (roomNo) REFERENCES room (NUMBER);
ALTER TABLE room_amenity ADD CONSTRAINT roomAmenity_amenity_fk FOREIGN KEY (amenityId) REFERENCES amenity (id);

ALTER TABLE reservation ADD CONSTRAINT reservation_room_fk FOREIGN KEY (roomNo) REFERENCES room (number);
ALTER TABLE reservation ADD CONSTRAINT reservation_guest_fk FOREIGN KEY (guestId) REFERENCES guest (id) ON DELETE cascade;
