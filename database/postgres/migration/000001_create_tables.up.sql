CREATE TABLE IF NOT EXISTS public.city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(120) NOT NULL,
    city_population INT
);

CREATE TABLE IF NOT EXISTS public.place (
    place_id SERIAL PRIMARY KEY,
    city_id INT,
    place_name VARCHAR(120) NOT NULL,

    FOREIGN KEY (city_id) REFERENCES "city" (city_id)
);

CREATE TABLE IF NOT EXISTS public.product (
    product_id SERIAL PRIMARY KEY,
    place_id INT NOT NULL,
    product_name VARCHAR(120) NOT NULL,
    product_type VARCHAR(120),

    FOREIGN KEY (place_id) REFERENCES "place" (place_id),
    UNIQUE(product_name, product_type, place_id)
);

CREATE TABLE IF NOT EXISTS public.amount_type (
    amount_id SERIAL PRIMARY KEY,
    amount_type VARCHAR(10) NOT NULL,
);

CREATE TABLE IF NOT EXISTS public.price (
    price_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    amount_id INT NOT NULL,
    price_paid NUMERIC(4,2) CHECK (price_paid > 0) NOT NULL,
    price_amount NUMERIC(4,2) CHECK (price_amount > 0) NOT NULL,
    bought_at DATE NOT NULL,

    FOREIGN KEY (product_id) REFERENCES "product" (product_id),
    FOREIGN KEY (amount_id) REFERENCES "amount_type" (amount_id),
);