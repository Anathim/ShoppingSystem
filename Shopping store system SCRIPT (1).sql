CREATE DATABASE IF NOT EXISTS ShoppingSystem;
USE ShoppingSystem;

CREATE TABLE IF NOT EXISTS Customer (
	CustomerID INT AUTO_INCREMENT NOT NULL,
    CustomerFirstName VARCHAR(50),
    CustomerLastName VARCHAR(50),
    CustomerPhoneNumber VARCHAR(10),
    CustomerEmail VARCHAR(50),
    PRIMARY KEY (CustomerID)
);

INSERT INTO Customer (CustomerFirstName, CustomerLastName, CustomerPhoneNumber, CustomerEmail)
VALUES
('John','Doe', '1235556789','john.doe@email.com'),
('Alice', 'Smith', '4567891234', 'alice.smith@email.com'),
('Bob', 'Johnson', '7891234567', 'bob.johnson@email.com'),
('Emily', 'Davis', '2345678901', 'emily.davis@email.com'),
('Michael', 'Wilson', '5678901234', 'michael.wilson@email.com'),
('Sarah', 'Brown', '8901234567', 'sarah.brown@email.com'),
('David', 'Lee', '3456789012', 'david.lee@email.com'),
('Olivia', 'White', '6789012345', 'olivia.white@email.com'),
('Daniel', 'Clark', '9012345678', 'daniel.clark@email.com'),
('Emma', 'Turner', '4323456789', 'emma.turner@email.com');

CREATE TABLE IF NOT EXISTS DeliveryOrder (
	OrderID INT AUTO_INCREMENT NOT NULL,
    CustomerID INT,
    OrderDate DATE,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Deliveryorder (CustomerID, OrderDate) 
VALUES
(1, '2023-01-01'),
(2, '2023-01-15'),  
(3, '2023-02-05'),
(4, '2023-02-12'),
(5, '2023-02-22'),
(6, '2023-03-01'),
(7, '2023-03-12'),
(8, '2023-03-25'),  
(9, '2023-04-04'),
(10, '2023-04-20');

CREATE TABLE IF NOT EXISTS Delivery (
    ID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    Country VARCHAR(255),
    PostalCode INT(4),
    Type VARCHAR(50),
    DeliveryBy VARCHAR(255),
    Date DATETIME,
    OrderID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES DeliveryOrder(OrderID)
);

INSERT INTO Delivery (CustomerID, Address, City, Province, Country, PostalCode, Type, DeliveryBy, Date, OrderID)
VALUES (10, '10 Mason Road', 'Cape Town', 'Western Cape', 'South Africa', 8001, 'Express', 'Tyson', '2023-09-04 17:00:00', 1),
(1, '89 Strand Drive', 'Durban', 'KwaZulu Natal', 'South Africa', 5698, 'Standard', 'Mike', '2023-09-05 17:00:00', 2),
(5, '15 Crove Road', 'Cape Town', 'Western Cape', 'South Africa', 7795, 'Standard', 'Tyson', '2023-09-04 17:00:00', 3),
(9, '10 Starlight Crescent', 'Cape Town', 'Western Cape', 'South Africa', 7785, 'Standard', 'Oliver', '2023-09-05 17:00:00', 4),
(4, '135 Sleeze Avenue', 'Pretoria', 'Gauteng', 'South Africa', 2005, 'Express', 'Kenneth', '2023-09-05 17:00:00', 5),
(2, '25 Apple Close', 'Cape Town', 'Western Cape', 'South Africa', 8001, 'Same-day', 'Success', '2023-09-03 17:00:00', 6),
(8, '17 Pink Street', 'Queenstown', 'Eastern Cape', 'South Africa', 5894, 'Express', 'Mziwoxolo', '2023-09-05 17:00:00', 7),
(3, '2 November Road', 'Cape Town', 'Western Cape', 'South Africa', 7750, 'Standard', 'Tyson', '2023-09-04 17:00:00', 8),
(7, '40 Glover Street', 'Johannesburg', 'Gauteng', 'South Africa', 1505, 'Standard', 'Siyabonga', '2023-09-08 17:00:00', 9),
(6, '87 Grant Paradise', 'Cape Town', 'Western Cape', 'South Africa', 8000, 'Same-day', 'Mihle', '2023-09-03 17:00:00', 10);

CREATE TABLE IF NOT EXISTS Supplier (
  SupplierID INT NOT NULL AUTO_INCREMENT,
  Supplier_Name varchar(50),
  Supplier_Email varchar(50),
  Supplier_Phone varchar(50),
  Supplier_City varchar(50),
  Supplier_Province varchar(50),
  PRIMARY KEY (SupplierID));

INSERT INTO Supplier (Supplier_Name, Supplier_Email, Supplier_Phone, Supplier_City, Supplier_Province)
VALUES
('Supersport Co.', 'Susan@Supersport.org.za', '0213459959', 'Mossel bay', 'Western Cape'),
('FashionStyle Co.', 'sarah@fashionstyle.com', '0112732783', 'Johannesburg', 'Gauteng'),
('HomeAppliances Ltd.', 'david@homeappliances.com', '0815475879', 'Durban', 'KwaZulu Natal'),
('Foodsupplies Inc.', 'emily@foodsupplies.com', '0114546356', 'Johannersburg', 'Gauteng'),
('SportsGear Co.', 'michael@sportsgear.com', '0315487788', 'Pretoria', 'Gauteng'),
('BeautyEssentials Ltd.', 'laura@beautyessentials.com', '0214579652', 'Cape Town', 'Western Cape'), 
('BooksRUs Wholesale', 'james@booksrus.com', '0662738293', 'East London', 'Eastern Cape'),
('OutdoorSupplies Co.', 'anna@outdoorsupplies.com', '0678457879', 'Gqeberha', 'Eastern Cape'),
('ElectronicsPlus Co.', 'kevin@electronicsplus.com', '0113849027', 'Bloemfontein', 'Free State'),
('CraftyCreations Ltd.', 'jesssica@craftycreations.com', '0317265389', 'Durban', 'KwaZulu Natal');

CREATE TABLE IF NOT EXISTS Product (
	ProductID INT NOT NULL AUTO_INCREMENT,
	Product_Name varchar(100) NOT NULL,
	Product_Description text NOT NULL,
	Stock_Quantity INT NOT NULL,
	Product_Price double NOT NULL,
    SupplierID INT,
	PRIMARY KEY (ProductID),
	FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

INSERT INTO Product (Product_Name, Product_Description, Stock_Quantity, Product_Price, SupplierID) 
VALUES
('Laptop', 'High-perfomance laptop', 50, 999.99, 9),
('Smartphone', 'Latest smartphone model', 100, 699.99, 1),  
('T-Shirt', 'Premium cotton t-shirt', 300, 49.99, 5),
('Running shoes', 'Light weight running shoes', 75, 89.99, 10),
('Coffee maker', 'Programmable coffee maker', 30, 59.99, 8),
('Jeans', 'Classic blue jeans', 200, 159.99, 2),
('Backpack', 'Waterproof hiking backpack', 40, 99.99, 4),
('Watch', 'Stylish wrist watch', 25, 169.99, 7),  
('Sneakers', 'Casual sneakers with unique design', 50, 599.99, 3),
('Blender', 'High-speed blender for smoothies', 20, 129.99, 6);

CREATE TABLE IF NOT EXISTS Transaction (
    ID INT NOT NULL AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    TotalCost DECIMAL(10, 2),
    PRIMARY KEY (ID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Transaction (CustomerID, ProductID, Quantity, Price, TotalCost)
VALUES (5, 1, 5, 999.99, 4999.95),
(1, 2, 10, 699.99, 6999.99),
(10, 3, 5, 49.99, 249.95),
(3, 4, 15, 89.99, 1349.85),
(8, 5, 12, 59.99, 719.88),
(2, 6, 3, 159.99, 479.97),
(6, 1, 8, 999.99, 7999.92),
(9, 8, 5, 169.99, 849.95),
(7, 9, 14, 599.99, 8399.86),
(4, 10, 20, 129.99, 2599.80);

CREATE TABLE IF NOT EXISTS StoreLocation (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    Province VARCHAR(255),
    Country VARCHAR(255),
    PostalCode INT(4),
    PhoneNumber INT(10),
    Email VARCHAR(255),
    PRIMARY KEY (ID)
);

INSERT INTO StoreLocation (Name, Address, City, Province, Country, PostalCode, PhoneNumber, Email)
VALUES('Fruit & Veg', '25 Washington Drive', 'Cape Town', 'Western Cape', 'South Africa', 8002, 0215893215, 'info@fruitandveg.co.za'),
('Shopalot', '105 Windvogel Close', 'Cape Town', 'Western Cape', 'South Africa', 7789, 0212325647, 'info@shopalot.com'),
('Itty Bitty Clothing', '36 Small Street', 'Johannesburg', 'Gauteng', 'South Africa', 0180, 0682597453, 'ittybittyclothing@gmail.com'),
('Nuka Kamnandi', 'Shop 25 Bellville Road', 'Cape Town', 'Western Cape', 'South Africa', 7725, 0735697412,  'store@nukakamnandi.co.za'),
('Umgalelo', '47 Durban Road', 'Durban', 'KwaZulu Natal', 'South Africa', 5578, 0218971235, 'info@umgaleloafrica.com'),
('Beacon', '57 Garlendale Street', 'Cape Town', 'Western Cape', 'South Africa', 7456, 0836547120, 'contact@beacon.com'),
('Homegrown Sweets', '12 Pear Close', 'Cape Town', 'Western Cape', 'South Africa', 7784, 0810259745, 'homegrown@gmail.com'),
('Uncle Doughnuts', '77 Waffle Road', 'Johannesburg', 'Gauteng', 'South Africa', 2003, 0210189532, 'order@uncledoughnuts.co.za'),
('Best Prices', '5 Good Road', 'Cape Town', 'Western Cape', 'South Africa', 8000, 0216894100, 'bestprices@telkomsa.net'),
('ShopnPay', 'Shop 7 Keniloworth Centre', 'Cape Town', 'Western Cape', 'South Africa', 7745, 0213020001, 'info@shopnpay.co.za');

CREATE TABLE IF NOT EXISTS Category (
  ID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255),
  Description TEXT,
  ParentId INT(10),
  Status ENUM('active', 'inactive'),
  CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  DeletedAt DATETIME,
  ProductID INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Category (Name, Description, ParentID, Status, CreatedAt, ProductID)
VALUES ('Books', 'Fiction and non-fiction books in various genres and languages', 0, 'active', '2023-08-31 12:49:05', 1),
('Electronics', 'Devices, accessories and components for entertainment, communication and work', 0, 'active', '2023-08-31 12:49:30', 2),
('Clothing', 'Apparel, footwear and accessories for men, women and children', 0, 'active', '2023-08-31 12:49:50', 3),
('Home & Garden', 'Furniture, appliances, tools and decor for indoor and outdoor living', 0, 'inactive', '2023-08-31 12:50:39', 4),
('Sports & Outdoors', 'Equipment, clothing and accessories for fitness, recreation and adventure', 0, 'active', '2023-08-31 12:51:20', 5),
('Health & Beauty', 'Products and services for personal care, wellness and grooming', 0, 'active', '2023-08-31 12:53:05', 6),
('Toys & Games', 'Items for fun, learning and development for kids of all ages', 0, 'active', '2023-08-31 12:55:50', 7),
('Food & Drink', 'Groceries, beverages, snacks and specialty items from local and international cuisines', 0, 'active', '2023-08-31 12:57:22', 8),
('Arts & Crafts', 'Materials, tools and kits for creative hobbies and projects', 0, 'inactive', '2023-08-31 12:59:08', 9),
('Pets', 'Food, supplies, toys and services for your furry, feathered or scaly friends', 0, 'active', '2023-08-31 13:02:10', 10);

CREATE TABLE IF NOT EXISTS Cart (
	CartID INT AUTO_INCREMENT NOT NULL,
    Quantity INT,
    ProductID INT,
    CustomerID INT,
    PRIMARY KEY (CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Cart (Quantity, ProductID, CustomerID)
VALUES 
(3, 1, 1),
(1, 2, 2),
(5, 3, 3),
(2, 4, 10),
(4, 5, 4),  
(3, 6, 5),
(1, 7, 7),
(2, 8, 3),
(5, 9, 8),
(4, 10, 5);

CREATE TABLE IF NOT EXISTS PaymentMethod (
	PaymentMethodID INT AUTO_INCREMENT NOT NULL,
    PaymentType VARCHAR(50),
    OrderId INT,
    CustomerId INT,
    PRIMARY KEY (PaymentMethodID),
    FOREIGN KEY (OrderID) REFERENCES DeliveryOrder(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO PaymentMethod (PaymentType, OrderID, CustomerID)
VALUES
('Credit Card', 1, 1),
('Payflex', 2, 10),
('Debit Card', 3, 3),
('EFT', 4, 4),
('Credit Card', 5, 7),
('EFT', 6, 2), 
('Debit Card', 7, 8),
('Mobicred', 8, 4),
('Credit Card', 9, 1),
('Debit Card', 10, 2);

CREATE TABLE IF NOT EXISTS Employee (
  EmployeeID int NOT NULL,
  Employee_FName varchar(100) NOT NULL,
  Employee_LName varchar(100) NOT NULL,
  Employee_Position varchar(100) NOT NULL,
  Employee_Address varchar(100) NOT NULL,
  Employee_Email varchar(100) NOT NULL,
  Employee_Salary double DEFAULT NULL,
  PRIMARY KEY (EmployeeID));

INSERT INTO Employee (EmployeeID, Employee_FName, Employee_LName,Employee_Position, 
Employee_Address,Employee_Email, Employee_Salary)
VALUES
(1, 'John', 'Smith', 'Store Manager', '123 Main St, City', 'john.smith@gmail.com', '60000'),
(2, 'Emily', 'Johnson', 'Sales Associate', '456 Elm Rd, Town', 'emily.johnson@gmail.com', '35000'),
(3, 'Michael', 'Williams', 'Cashier', '789 Oak Ave, Village', 'michael@gmail.com', '20000'),
(4, 'Sarah ', 'Brown', 'Hiring Manager', '890 Pine Ln, City', 'sarah.brown@gmail.com', '45000'),
(5, 'David', 'Davis', 'Sales Representative', '567 Maple Rd, Town', 'david.davis@gmail.com', '25000'),
(6, 'Laura', 'Miller', 'Cashier', '234 Birch Ave. Village', 'laura.miller@gmail.com', '21000'),
(7, 'James', 'Wilson', 'Sales Associate', '678 Oak Rd, City', 'james@gmail.com', '34000'),
(8, 'Anna ', 'Anderson', 'Store Manager', '345 Elm St, Town', 'anna@gmail.com', '61000'),
(9, 'Kevin', 'Martinez', 'Cashier', '789 Pine Ave, Village', 'kevin@gmail.com', '30500'),
(10, 'Jessica', 'Taylor', 'Sales Associate', '123 Oak Ln, City', 'jessica@gmail.com', '40000');

CREATE TABLE IF NOT EXISTS Payment (
  PaymentID int NOT NULL,
  Payment_Date date NOT NULL,
  Payment_Amount double NOT NULL,
  Payment_Method varchar(50) NOT NULL,
  Payment_Status varchar(50) NOT NULL,
  OrderID INT,
  PRIMARY KEY (PaymentID),
  FOREIGN KEY (OrderID) REFERENCES Deliveryorder(OrderID)
);

INSERT INTO Payment (PaymentID, Payment_Date, Payment_Amount, Payment_Method, Payment_Status, OrderID)
VALUES 
(1, '2023-08-10', '249.99', 'Credit card', 'Paid', 1),
(2, '2023-08-11', '69.99', 'Credit card', 'Paid', 2),
(3, '2023-08-12', '85.99', 'PayPal', 'Pending', 3),
(4, '2023-08-13', '159.99', 'Cash', 'Paid', 4),
(5, '2023-08-14', '299.99', 'Credit card', 'Refunded', 5),  
(6, '2023-08-15', '59.99', 'PayPal', 'Paid', 6),
(7, '2023-08-22', '359.99', 'Cash', 'Pending', 7),
(8, '2023-07-21', '199.99', 'Credit card', 'Paid', 8),
(9, '2023-07-17', '200', 'PayPal', 'Refunded', 9),
(10, '2023-07-16', '170', 'Credit card', 'Paid', 10);