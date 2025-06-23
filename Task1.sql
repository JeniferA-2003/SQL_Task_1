create database ecommerce;
show Databases;
create table USERS(
userID int Primary key auto_increment,
Name varchar(30),
Email varchar(30),
PasswordHash varchar(30),
Address text,
Phone varchar(30),
createAt DateTime default current_timestamp
);
describe USERS;
create table Products(
ProductID int primary key auto_increment,
Name varchar(30),
Description text,
Price Decimal (3,2),
StockQuantity int,
CategoryID  int,
size varchar(10),
color varchar(10),
ImageURL text,
CreatedAt dateTime default current_timestamp,
foreign key (categoryID) references categories (categoryID)
 );
 create table Categories (
 categoryID int primary key,
 categoryName varchar (30)
 );
 create table cart (
 cartID int Primary key,
 UserID int ,
 CreatedAt datetime default current_timestamp
 );
 drop table cart;
 create table cart (
 cartID int primary key,
 UserID int,
 createdAt dateTime default current_timestamp,
 foreign key (userID) references users(userID)
 );
 drop table CartItems;
 create table CartItems (
 cartItem int primary key,
 cartID int,
 productID int,
 Quantity int,
 foreign key (cartID) references cart (cartID),
 foreign key (productID) references products (productID)
 
 );
 create table Orders (
 OrderID int primary key,
 userID int,
 OrderDate datetime,
 status varchar(30),
 totalAmount decimal (3,2),
 foreign key (userID) references users(userID)
 );
 create table OrderItems(
 orderItemID int,
 orderID int,
 productID int,
 Quantity int,
 unitprice decimal(3,2),
 foreign key (orderId) references Orders(OrderID),
 foreign key (productID) references Products(ProductID)
 );
 create table Payments (
 paymentID int primary key,
 orderID int,
 paymentMethod varchar (30),
 PaymentStatus varchar(30),
 paidAt datetime default current_timestamp,
 foreign key (orderId) references orders(orderID)
 );
 create table Reviews (
 ReviewId int primary key,
 UserID int,
 ProductID int,
 Rating int,
 comment text,
 createdAt datetime default current_timestamp,
  foreign key (UserID) references Users(UserID),
  foreign key (ProductID) references Products(ProductID)
 );
 create table shipping (
 shippingID int primary key,
 orderID int,
 Address text,
 city varchar (30),
 state varchar (30),
 Zipcode varchar (20),
 shippedDate dateTime default current_timestamp,
 DeliveryStatus varchar(30),
foreign key (orderId) references orders(orderID)
 
 );
 describe shipping;