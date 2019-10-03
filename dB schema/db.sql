DROP DATABASE IF EXISTS PlaidMe;

CREATE DATABASE PlaidMe;

USE PlaidMe;

-- PRODUCTS TABLE
CREATE TABLE Products (
    Products_Id INT NOT NULL AUTO_INCREMENT,
    Product_Name VARCHAR(32),
    Category VARCHAR(32),
    Sizes VARCHAR(32),
    Material VARCHAR(32),
    Color VARCHAR(32),
    Quantity INT,
	IMG_SRC VARCHAR(100),
    PRIMARY KEY (Products_Id)
);

INSERT INTO Products (Product_Name, Category, Sizes, Material, Color,  Quantity, IMG_SRC)
VALUES      ("The YelPurp Set", "Bottoms", "Medium", "Linen", "Purple/Yellow", 7, "/img/purp.jpg"),
            ("Naca Ripped Bottoms", "Bottoms", "Small", "Nylon", "Plaid", 18, "/img/rippednaca.jpg"),
            ("Love Me Coat", "Overlay", "Large", "Nylon", "Plaid", 9, "/img/lovemecoat.jpg"),
            ("Plaid Me Cardigan", "Overlay", "Small", "Boiled Wool", "Plaid", 62, "/img/plaidmec.jpg"),
            ("School Girl Jennifer", "Dresses", "Large", "Nylon", "Plaid", 37, "/img/schoolgirljen.jpg"),
            ("Tea Nice Sweet Dress", "Dresses", "Small", "Silk", "Plaid", 28, "/img/teanice.jpg"),
            ("Red Lipstick Plaid Pants", "Bottoms", "Small", "Brocade", "Red", 28, "/img/redlip.jpg"),
            ("New Blue Mix Pants", "Bottoms", "Medium", "Linen", "Blue", 60, "/img/bluemix.jpg"),
            ("Fancy Me Skirt", "Skirts", "Medium", "Nylon", "Dark Gray", 52, "/img/fancyme.jpeg"),
            ("My Mini Friend", "Skirts", "Large", "Satin", "Plaid", 12, "/img/minifriend.png"),
            ("Full Bowed Pleasure Flats", "Shoes", "4-6", "Velvet", "Red", 102, "/img/bowed.jpg"),
            ("Walk My Plaid", "Shoes", "5-7", "Velvet", "Plaid", 45, "/img/walkinmy.jpg");


-- PRICE TABLE

CREATE TABLE Prices (
    Prices_Id INT NOT NULL AUTO_INCREMENT,
    Price DECIMAL(6,2),
    Tax DECIMAL(6,2),
    PRIMARY KEY (Prices_Id),
	FOREIGN KEY (Prices_Id) REFERENCES Products(Products_Id)
);

INSERT INTO Prices (Price, Tax)
VALUES (999.89, 70.35),
       (275.99, 17.23),
       (529.99, 35.89),
       (177.99, 7.95),
       (348.98, 15.79),
       (289.99, 12.99),
       (345.98, 8.99),
       (243.99, 21.89),
       (600.89, 23.67),
       (699.98, 36.99),
       (150.89, 12.12),
       (399.50, 19.76);
            
-- CONTACTS TABLE

CREATE TABLE Contacts (
    Contact_Id INT AUTO_INCREMENT NOT NULL,
    Contact_Name VARCHAR(32),
    Contact_Address VARCHAR(32),
    City VARCHAR(32),
    Contact_State VARCHAR(32),
    Zip_Code VARCHAR(32),
    Email VARCHAR(32),
    Primary_Number VARCHAR(32),
    PRIMARY KEY (Contact_Id)
);


INSERT INTO Contacts (Contact_Name, Contact_Address, City, Contact_State, Zip_Code, Email, Primary_Number)
VALUES ("Elizze Pratt", "1236 Wilmington Ave", "Seattle", "WA", "98101", "ellie87@gmail.com", "206-178-9898"),
       ("Chris Bueno", "3738 W Wooden St", "Aberdeen", "SD", "57401", "chrisbue@yahoo.com", "605-228-8554"),
       ("Creile Juventud", "4537 Key Ln", "Owensboro", "KY", "42301", "cjuventud@gmail.com", "270-334-6760"),
       ("Charlie Santiago", "6788 Palm Mouth St, Apt.211", "Augusta", "ME", "04330", "santiagoc@outlook.com", "207-456-7678"),
       ("Federico Ulmio", "109 Blake Ford Ave", "Rochester", "NY", "14602", "federicoUl1@aol.com", "585-9878-1231"),
       ("Gregorio Hsense", "78 Martin Ln", "Malibu", "CA", "90263", "gregor21@gmail.com", "310-978-4555"),
       ("Santi Peralta", "9765 Cayen St, Apt.16", "Cincinnati", "OH", "41073", "santiperal78@aol.com", "513-277-5658"),
       ("Lupita Oshwuin", "2321 S Oakland Ave", "Dallas", "TX", "75001", "lupitaosh@outlook.com", "469-342-9118"),
       ("Keyn Yokaia", "3576 35 SW", "Miami", "FL", "33101", "kyokaia@gmail.com", "786-456-8976"),
       ("Jipe Contreras", "7889 Piedmont St, Apt.315", "Stillwater", "OK", "74074", "jipecontreras@yahoo.com", "405-187-3874");


-- ORDERS TABLE

CREATE TABLE Orders (
    Orders_Id INT AUTO_INCREMENT NOT NULL,
    Shipping_Costs DECIMAL (3,2),
    Quantity_Ordered INT,
    PRIMARY KEY(Orders_Id),
    FOREIGN KEY (Orders_Id) REFERENCES Products(Products_Id),
    FOREIGN KEY (Orders_Id) REFERENCES Contacts(Contact_Id)
);


INSERT INTO Orders (Shipping_Costs, Quantity_Ordered)
VALUES (7.99, 2),
       (7.99, 1),
       (7.99, 2),
       (7.99, 9),
       (7.99, 1),
       (7.99, 1),
       (7.99, 2),
       (7.99, 5),
       (7.99, 3),
       (7.99, 2);
        