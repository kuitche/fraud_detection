-- Drop tables
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- Create a table of card holder
CREATE TABLE card_holder (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Create a table of credit card
CREATE TABLE credit_card (
  	card VARCHAR(20) NOT NULL PRIMARY KEY,
	cardholder_id INT NOT NULL,
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

-- Create a table of merchant category
CREATE TABLE merchant_category (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Create a table of merchant
CREATE TABLE merchant (
	id INT PRIMARY KEY,
  	name VARCHAR(50) NOT NULL,
	id_merchant_category INT NOT NULL,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

-- Create a transaction table.
CREATE TABLE transaction (
  	id INT PRIMARY KEY,
	date TIMESTAMP NOT NULL,
	amount FLOAT NOT NULL,
	card VARCHAR(20) NOT NULL,
	id_merchant INT NOT NULL,
  	FOREIGN KEY (card) REFERENCES credit_card(card),
  	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);
