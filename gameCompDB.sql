Create DATABASE if not exists GameCompDB;
use GameCompDB;

create table if not exists Customer(
	# All information om kunden
    customerID int auto_increment,
    personID int,
    productID int,
    orderID int,
    adressID int,
    primary key(customerID),
    foreign key(personID) references Person(personID),
    foreign key(productID) references Product(productID),
    foreign key(orderID) references Orders(orderID),
    foreign key(adressID) references AdressInfo(adressID)
);

create table if not exists Person(
	/* I denna tabell kommer personlig information anges. För en person så måste den ha en unik email från andra kunder men för- och efternamn
     samt ålder måste anges för att verifiera identitet. Adressen är i sin egna tabell då flera personer kan t.ex bo i samma hus. 
     Sist så har varje person en digital plånbok där betalningsmetoden anges (inte obligatorisk då alla inte köper).
	*/
    personID int auto_increment,
	walletID int, 
    firstName varchar(200) not null, 
    lasatName varchar(200) not null,
    email varchar(200) unique not null, 
    pass varchar(200) not null,
    birth date not null,
	primary key(personID),
	foreign key(walletID) references Wallet(walletID) 
);

create table if not exists Wallet(
	# Digitala plånboken för personen, inte obligatorisk information 
	walletID int auto_increment,
    bankInfo varchar(200),
    creditInfo varchar(200),
    primary key(walletID)
);

create table if not exists AdresssInfo(
	# När ett konto skapas måste det anges vilket land man är från för att skapa möjligheten att ge mer relevant information, resten är inte obligatoriskt 
	adressID int auto_increment,
    country varchar(200) not null,
    city varchar(200),
    streetName varchar(200),
    streetNr varchar(200),
    postalCode int,
    primary key(adressID)
);

create table if not exists Product(
	# obligatoriskt för produkt att ha pris och namn, kategori är extra information
	productID int auto_increment,
    productPrice int not null,
    productName int not null,
    productCategory varchar(200),
    primary key(productID)
);

create table if not exists Orders(
	# vilken produkt som köptes och vilken kund som köpte den
    orderID int auto_increment,
    productID int,
    customerID int,
    primary key(orderID),
    foreign key(productID) references Product(productID),
    foreign key(customerID) references Customer(customerID)
);