CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  category_id INT NOT NULL,
  vendor_id INT NOT NULL,
  picture VARCHAR(200) NOT NULL,
  active boolean DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS productoptions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  product_id INT NOT NULL,
  barcode VARCHAR(50), 
  current_stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS vendors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS channels (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS sales (
  id SERIAL PRIMARY KEY,
  docnumber VARCHAR(100) NOT NULL,
  docdate DATE NOT NULL,
  channel_id INT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS salesitems (
  id SERIAL PRIMARY KEY,
  sales_id INT NOT NULL,
  productoptions_id INT NOT NULL,
  qty  INT NOT NULL,
  amount NUMERIC(5,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS po (
  id SERIAL PRIMARY KEY,
  docnumber VARCHAR(100) NOT NULL,
  docdate DATE NOT NULL,
  vendor_id INT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS poitems (
  id SERIAL PRIMARY KEY,
  po_id INT NOT NULL,
  productoptions_id INT NOT NULL,
  qty  INT NOT NULL,
  amount NUMERIC(5,2)
);

CREATE TABLE IF NOT EXISTS pricelist (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  channel_id INT NOT NULL,
  active boolean DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS pricelistitems (
  id SERIAL PRIMARY KEY,
  pricelist_id INT NOT NUL,
  productoptions_id INT NOT NULL,
  price NUMERIC(5,2)
);

CREATE TABLE IF NOT EXISTS stockmovement (
  id SERIAL PRIMARY KEY,
  productoptions_id INT NOT NULL,
  doc_id INT NOT NULL,
  docnumber VARCHAR(100) NOT NULL,
  doctype VARCHAR(100) NOT NULL,
  qty INT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);