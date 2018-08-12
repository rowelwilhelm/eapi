CREATE TABLE eapi.migrations
(
    id int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    migration varchar(191) NOT NULL,
    batch int(11) NOT NULL
);
INSERT INTO eapi.migrations (id, migration, batch) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO eapi.migrations (id, migration, batch) VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO eapi.migrations (id, migration, batch) VALUES (3, '2018_08_12_072133_create_products_table', 1);
INSERT INTO eapi.migrations (id, migration, batch) VALUES (4, '2018_08_12_072207_create_reviews_table', 1);
CREATE TABLE eapi.password_resets
(
    email varchar(191) NOT NULL,
    token varchar(191) NOT NULL,
    created_at timestamp
);
CREATE INDEX password_resets_email_index ON eapi.password_resets (email);
CREATE TABLE eapi.products
(
    id int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(191) NOT NULL,
    detail text NOT NULL,
    price int(11) NOT NULL,
    stock int(11) NOT NULL,
    discount int(11) NOT NULL,
    created_at timestamp,
    updated_at timestamp
);
CREATE TABLE eapi.reviews
(
    id int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    product_id int(10) unsigned NOT NULL,
    customer varchar(191) NOT NULL,
    review text NOT NULL,
    star int(11) NOT NULL,
    created_at timestamp,
    updated_at timestamp,
    CONSTRAINT reviews_product_id_foreign FOREIGN KEY (product_id) REFERENCES eapi.products (id) ON DELETE CASCADE
);
CREATE INDEX reviews_product_id_index ON eapi.reviews (product_id);
CREATE TABLE eapi.users
(
    id int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(191) NOT NULL,
    email varchar(191) NOT NULL,
    password varchar(191) NOT NULL,
    remember_token varchar(100),
    created_at timestamp,
    updated_at timestamp
);
CREATE UNIQUE INDEX users_email_unique ON eapi.users (email);