-- 175
CREATE TABLE IF NOT EXISTS `Person`(
PersonID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Address`(
AddressID INT PRIMARY KEY AUTO_INCREMENT,
PersonID INT NOT NULL,
City VARCHAR(20) NOT NULL,
State VARCHAR(20) NOT NULL,
FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

INSERT INTO Person (FirstName, LastName) VALUES ("Lilei", "Han");
INSERT INTO Person (FirstName, LastName) VALUES ("Mary", "Kim");
INSERT INTO Person (FirstName, LastName) VALUES ("Dandy", "Dan");
INSERT INTO Person (FirstName, LastName) VALUES ("Sam", "Tony");
INSERT INTO Person (FirstName, LastName, Salary) VALUES ("Daniel", "Allen", 50000);
INSERT INTO Person (FirstName, LastName, Salary) VALUES ("Bob", "Bary",55000);

INSERT INTO Address (PersonID, City,State) VALUES (1, "Shanghai","Pudong");
INSERT INTO Address (PersonID, City,State) VALUES (2, "New York","Manhattan");
INSERT INTO Address (PersonID, City,State) VALUES (3, "Tokyo","Minato");

-- 176
ALTER TABLE Person
ADD COLUMN (
Salary DECIMAL NOT NULL
);

UPDATE Person SET Salary=100 WHERE PersonID=1;
UPDATE Person SET Salary=200 WHERE PersonID=2;
UPDATE Person SET Salary=300 WHERE PersonID=3;

-- 181
ALTER TABLE Person
ADD COLUMN (
ManagerID INT 
);

INSERT INTO Person (FirstName,LastName,Salary) VALUES ("Sam","Tony",90000);

UPDATE Person SET Salary=70000,ManagerID=3 WHERE PersonID=1;
UPDATE Person SET Salary=80000,ManagerID=4 WHERE PersonID=2;
UPDATE Person SET Salary=60000 WHERE PersonID=3;

-- 511
CREATE TABLE IF NOT EXISTS `Activity`(
  player_id INT NOT NULL ,
  device_id INT NOT NULL ,
  event_date DATE NOT NULL,
  game_played INT NOT NULL,
  PRIMARY KEY(player_id,event_date)
);

INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (1,2,'2016-03-01',5);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (1,2,'2016-05-02',6);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (2,3,'2017-06-25',1);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (3,1,'2016-03-01',0);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (3,4,'2018-07-03',5);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (3,5,'2016-07-03',5);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (1,2,'2016-03-02',6);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (1,2,'2016-03-03',2);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (1,2,'2016-03-04',1);
INSERT INTO Activity (player_id,device_id,event_date,game_played) VALUES (3,5,'2015-07-04',4);

-- 1355
CREATE TABLE IF NOT EXISTS `Event`(
  id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
  name VARCHAR(15) NOT NULL,
);
CREATE Table IF NOT EXISTS `Player_Event`(
  player_id INT NOT NULL,
  event_id INT NOT NULL,
  PRIMARY KEY(player_id,event_id),
  FOREIGN KEY (player_id) REFERENCES Person(PersonID),
  FOREIGN KEY (event_id) REFERENCES Event(id)
);

INSERT INTO Event (name) VALUES ('Fishing');
INSERT INTO Event (name) VALUES ('Dancing');
INSERT INTO Event (name) VALUES ('Running');

INSERT INTO player_event (player_id,event_id) VALUES (1,1);
INSERT INTO player_event (player_id,event_id) VALUES (2,2);
INSERT INTO player_event (player_id,event_id) VALUES (3,2);
INSERT INTO player_event (player_id,event_id) VALUES (4,1);
INSERT INTO player_event (player_id,event_id) VALUES (5,1);
INSERT INTO player_event (player_id,event_id) VALUES (6,3);