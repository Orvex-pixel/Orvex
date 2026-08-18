-- Run this entire script in your Supabase SQL Editor

-- 1. Create Products Table
CREATE TABLE products (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  price NUMERIC NOT NULL,
  originalPrice NUMERIC,
  discountText TEXT,
  statusText TEXT,
  viewCount NUMERIC DEFAULT 0,
  category TEXT NOT NULL,
  description TEXT,
  images JSONB,
  sizes JSONB,
  colors JSONB,
  features JSONB,
  material TEXT,
  fit TEXT,
  isNewArrival BOOLEAN DEFAULT false,
  isBestSeller BOOLEAN DEFAULT false,
  reviews JSONB
);

-- 2. Create Categories Table
CREATE TABLE categories (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  image TEXT NOT NULL,
  itemCount NUMERIC DEFAULT 0
);

-- 3. Create Orders Table
CREATE TABLE orders (
  id TEXT PRIMARY KEY,
  customerName TEXT NOT NULL,
  customerPhone TEXT NOT NULL,
  customerAltPhone TEXT,
  customerAddress TEXT NOT NULL,
  customerDistrict TEXT,
  customerDivision TEXT,
  deliveryNotes TEXT,
  shippingCost NUMERIC,
  items JSONB NOT NULL,
  totalAmount NUMERIC NOT NULL,
  status TEXT NOT NULL,
  date TEXT NOT NULL
);

-- 4. Create Settings / Social Links Table
CREATE TABLE social_links (
  id TEXT PRIMARY KEY,
  announcement TEXT,
  storeAddress TEXT,
  storePhone TEXT,
  heroBanner TEXT,
  instagram TEXT,
  facebook TEXT,
  tiktok TEXT,
  whatsapp TEXT
);

-- 5. Create Support Staff Table
CREATE TABLE support_staff (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  icon TEXT NOT NULL,
  phone TEXT NOT NULL,
  role TEXT NOT NULL
);

-- Note: Because this is a quick client-side integration, we enable access to everyone (public usage).
-- For production apps, you should configure Row Level Security (RLS) properly.
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public can read products" ON products FOR SELECT USING (true);
CREATE POLICY "Public can insert products" ON products FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update products" ON products FOR UPDATE USING (true);

ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public can read categories" ON categories FOR SELECT USING (true);
CREATE POLICY "Public can insert categories" ON categories FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update categories" ON categories FOR UPDATE USING (true);

ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public can read orders" ON orders FOR SELECT USING (true);
CREATE POLICY "Public can insert orders" ON orders FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update orders" ON orders FOR UPDATE USING (true);

ALTER TABLE social_links ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public can read social_links" ON social_links FOR SELECT USING (true);
CREATE POLICY "Public can insert social_links" ON social_links FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update social_links" ON social_links FOR UPDATE USING (true);

ALTER TABLE support_staff ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public can read support_staff" ON support_staff FOR SELECT USING (true);
CREATE POLICY "Public can insert support_staff" ON support_staff FOR INSERT WITH CHECK (true);
CREATE POLICY "Public can update support_staff" ON support_staff FOR UPDATE USING (true);
CREATE POLICY "Public can delete support_staff" ON support_staff FOR DELETE USING (true);

