User.delete_all
Product.delete_all
Category.delete_all

user_one = User.create!(
  first_name: "John",
  last_name: "Doe",
  phone: "1234567893",
  email: "john@example.com",
  password: "password"
)

user_two = User.create!(
  first_name: "Jane",
  last_name: "Doe",
  phone: "9876543211",
  email: "jane@example.com",
  password: "password"
)

user_three = User.create!(
  first_name: "geo",
  last_name: "test",
  phone: "9876543212",
  email: "test@test.com",
  password: "password"
)

first_category = Category.create!(name: "Electronics")
second_category = Category.create!(name: "Clothing")
Category.create!(name: "Books")

Product.create!(
  name: "Smartphone",
  price: 499.99,
  user_id: user_three.id,
  category_id: first_category.id
)

Product.create!(
  name: "T-shirt",
  price: 19.99,
  user_id: user_three.id,
  category_id: second_category.id
)
