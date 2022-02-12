
drop table if exists product_dim cascade ;
CREATE TABLE product_dim
(
 product_id  varchar(50) NOT NULL,
 name        varchar(255) NOT NULL,
 category    varchar(50) NOT NULL,
 subcategory varchar(50) NOT NULL
);

drop table if exists calendar_dim cascade ;
CREATE TABLE calendar_dim
(
 date date NOT NULL,
 year       int NOT NULL,
 quarter    int NOT NULL,
 month      int NOT NULL,
 week       int NOT NULL,
 week_day   int NOT NULL
);

drop table if exists customers_dim cascade ;
CREATE TABLE customers_dim
(
 customer_id varchar(50) PRIMARY KEY,
 name        varchar(50) NOT NULL,
 segment     varchar(50) NOT NULL
);

drop table if exists geography_dim cascade ;
CREATE TABLE geography_dim
(
 geography_id SERIAL PRIMARY KEY,
 postal_code  integer,
 city         varchar(17) NOT NULL,
 "state"        varchar(20) NOT NULL,
 country      varchar(13) NOT NULL,
 region       varchar(7) NOT NULL
);


drop table if exists shipping_dim cascade ;
CREATE TABLE shipping_dim
(
 ship_id   SERIAL PRIMARY KEY,
 shipping_mode varchar(50) NOT NULL
);




drop table if exists sales_fact cascade ;
CREATE TABLE sales_fact
(
 row_id        SERIAL PRIMARY KEY,
 order_id     varchar(14) NOT NULL,
 ship_id   integer    NOT NULL,
 order_date   date NOT NULL,
 geography_id bigint NOT NULL,
 product_id   varchar(50) NOT NULL,
 customer_id  varchar(50) NOT NULL,
 sales_amount double precision NOT NULL,
 profit       double precision NOT NULL,
 quantity     bigint NOT NULL,
 discount     double precision NOT NULL,
 postal_code  bigint NOT NULL,
 ship_date    date NOT NULL,
 CONSTRAINT FK_54 FOREIGN KEY ( customer_id ) REFERENCES customers_dim ( customer_id ),
--  CONSTRAINT FK_69 FOREIGN KEY ( product_id ) REFERENCES product_dim ( product_id ),
 CONSTRAINT FK_75 FOREIGN KEY ( geography_id ) REFERENCES geography_dim ( geography_id ),
--  CONSTRAINT FK_78 FOREIGN KEY ( order_date ) REFERENCES calendar_dim ( order_date),
 CONSTRAINT FK_92 FOREIGN KEY ( ship_id ) REFERENCES shipping_dim ( ship_id )
);


CREATE INDEX FK_56 ON sales_fact
(
 customer_id
);

CREATE INDEX FK_71 ON sales_fact
(
 product_id
);

CREATE INDEX FK_77 ON sales_fact
(
 geography_id
);

CREATE INDEX FK_80 ON sales_fact
(
 order_date,
 ship_date
);

CREATE INDEX FK_94 ON sales_fact
(
 ship_id
);

