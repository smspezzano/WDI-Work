require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

def dbname
  "storeadminsite"
end

def with_db
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  yield c
  c.close
end

get '/' do
  erb :index
end

# The Products machinery:

# Get the index of products
get '/products' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")

  # Get all rows from the products table.
  @products = c.exec_params("SELECT * FROM products;")
  c.close
  erb :products
end

# Get the index of categories 
get '/categories' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")

  # Get all rows from the products table.
  @categories = c.exec_params("SELECT * FROM categories;")
  c.close
  erb :categories
end


# Get the form for creating a new product
get '/products/new' do
  erb :new_product
end

# Get the form for creating a new category
get '/categories/new' do
  erb :new_category
end

# POST to create a new product
post '/products' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")

  # Insert the new row into the products table.
  c.exec_params("INSERT INTO products (name, price, description) VALUES ($1,$2,$3)",
                  [params["name"], params["price"], params["description"]])

  # Assuming you created your products table with "id SERIAL PRIMARY KEY",
  # This will get the id of the product you just created.
  new_product_id = c.exec_params("SELECT currval('products_id_seq');").first["currval"]
  c.close
  redirect "/products/#{new_product_id}"
end

# POST to create a new categories
post '/categories' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")



  # Insert the new row into the categories table.
  c.exec_params("INSERT INTO categories (name) VALUES ($1)",
                  [params["name"]])

  # Assuming you created your categories table with "id SERIAL PRIMARY KEY",
  # This will get the id of the categories you just created.
  new_category_id = c.exec_params("SELECT currval('categories_id_seq');").first["currval"]
  c.close
  redirect "/categories/#{new_category_id}"
end

# Update a product
post '/products/:id' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")

  # Update the product.
  c.exec_params("UPDATE products SET (name, price, description) = ($2, $3, $4) WHERE products.id = $1 ",
                [params["id"], params["name"], params["price"], params["description"]])
  c.close
  redirect "/products/#{params["id"]}"
end

# Update a category
post '/categories/:id' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")

  # Update the product.
  c.exec_params("UPDATE categories SET (name ) WHERE categories.id = $1 ",
                [params["id"]])

  c.close
  redirect "/categories/#{params["id"]}"
end

get '/products/:id/edit' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  @product = c.exec_params("SELECT * FROM products WHERE products.id = $1", [params["id"]]).first
  c.close
  erb :edit_product
end

get '/categories/:id/edit' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  @category = c.exec_params("SELECT * FROM categories WHERE categories.id = $1", [params["id"]]).first
  c.close
  erb :edit_category
end

# DELETE to delete a product
post '/products/:id/destroy' do

  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec_params("DELETE FROM products WHERE products.id = $1", [params["id"]])
  c.close
  redirect '/products'
end

# DELETE to delete a category
post '/categories/:id/destroy' do

  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec_params("DELETE FROM categories WHERE categories.id = $1", [params["id"]])
  c.close
  redirect '/categories'
end


# GET the show page for a particular product
get '/products/:id' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  @product = c.exec_params("SELECT * FROM products WHERE products.id = $1;", [params[:id]]).first
  @catalog = c.exec_params("SELECT categories.name FROM categories INNER JOIN catalog ON
  categories.id = catalog.c_id INNER JOIN products.id = catalog.p_id") 
  c.close
  erb :product
end

# GET the show page for a particular category
get '/categories/:id' do
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  @category = c.exec_params("SELECT * FROM categories WHERE categories.id = $1;", [params[:id]]).first
  c.close
  erb :categories
end

def create_products_table
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec %q{
  CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name varchar(255),
    price decimal,
    description text
  );
  }
  c.close
end


def drop_products_table
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec "DROP TABLE products;"
  c.close
end


def seed_products_table
  products = [["Laser", "325", "Good for lasering."],
              ["Shoe", "23.4", "Just the left one."],
              ["Wicker Monkey", "78.99", "It has a little wicker monkey baby."],
              ["Whiteboard", "125", "Can be written on."],
              ["Chalkboard", "100", "Can be written on.  Smells like education."],
              ["Podium", "70", "All the pieces swivel separately."],
              ["Bike", "150", "Good for biking from place to place."],
              ["Kettle", "39.99", "Good for boiling."],
              ["Toaster", "20.00", "Toasts your enemies!"],
             ]

  c = PGconn.new(:host => "localhost", :dbname => "nike")
  products.each do |p|
    c.exec_params("INSERT INTO products (name, price, description) VALUES ($1, $2, $3);", p)
  end
  c.close
end

def create_categories_table
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec %q{
  CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name varchar(255)
  );
  }
  c.close
end

def drop_categories_table
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec "DROP TABLE categories;"
  c.close
end

def seed_categories_table
  categories = [["Toys"],
              ["Kitchenware"],
              ["Hardware"],
              ["Clothes"]
             ]

  c = PGconn.new(:host => "localhost", :dbname => "nike")
  categories.each do |c|
    c.exec_params("INSERT INTO categories (name) VALUES ($1);", c)
  end
  c.close
end


def create_catalog_table
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec %q{
  CREATE TABLE catalog (
    id SERIAL PRIMARY KEY,
    p_id INTEGER,
    c_id INTEGER
  );
  }
  c.close
end

def drop_catalog_table
  c = PGconn.new(:host => "localhost", :dbname => "nike")
  c.exec "DROP TABLE catalog;"
  c.close
end

def seed_catalog_table
  catalog = [[1,3]]

  c = PGconn.new(:host => "localhost", :dbname => "nike")
  catalog.each do |p|
    c.exec_params("INSERT INTO catalog (p_id,c_id) VALUES ($1,$2);", p)
  end
  c.close
end
