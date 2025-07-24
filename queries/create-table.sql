CREATE TABLE nike(
    id int,
    gender VARCHAR(255),
    productline VARCHAR(255),
    productname VARCHAR(255),
    size VARCHAR(255),
    unitssold INT,
    mrp DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    revenue DECIMAL(10, 2),
    orderdate DATE,
    saleschannel VARCHAR(255),
    region VARCHAR(255),
    profit DECIMAL(10, 2),
    PRIMARY KEY (id)
)