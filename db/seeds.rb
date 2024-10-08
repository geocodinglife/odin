# frozen_string_literal: true

User.delete_all
Product.delete_all
Category.delete_all

user_one = User.create!(
  first_name: "jonatan",
  last_name: "Doe",
  auth_secret: ROTP::Base32.random(16),
  phone: "3004443348",
  email: "jonatan@jonatan.com"
)

user_two = User.create!(
  first_name: "fabi",
  last_name: "Doe",
  auth_secret: ROTP::Base32.random(16),
  phone: "3165759724",
  email: "fabi@fabi.com"
)

user_three = User.create!(
  first_name: "geo",
  last_name: "test",
  auth_secret: ROTP::Base32.random(16),
  phone: "3203850750",
  email: "geo@geo.com"
)

categories = %w[
  vehículos inmuebles alquiler servicios Electrónica
  tecnología muebles deportes belleza niños libros
  mascotas empleos
]

category_objects = categories.map { |name| Category.create!(name:) }

# Define related product names, description, and image
category_product_data = {
  "vehículos" => ["Coche", "Este coche es ideal para tus aventuras diarias."],
  "inmuebles" => ["Casa", "Acogedora casa con todas las comodidades."],
  "alquiler" => ["Piso en alquiler", "Amplio piso disponible para alquiler a largo plazo."],
  "servicios" => ["Servicios de limpieza", "Ofrecemos servicios de limpieza de alta calidad."],
  "Electrónica" => ["Teléfono inteligente", "El último modelo de teléfono con funciones avanzadas."],
  "tecnología" => ["Dispositivo IoT", "Innovador dispositivo IoT para automatizar tu hogar."],
  "muebles" => ["Sofá", "Sofá cómodo y elegante para tu sala de estar."],
  "deportes" => ["Bicicleta de montaña", "Bicicleta resistente para tus aventuras al aire libre."],
  "belleza" => ["Secador de pelo", "Potente secador de pelo para un secado rápido y eficiente."],
  "niños" => ["Juguetes educativos", "Juguetes educativos para el aprendizaje divertido de tus hijos."],
  "libros" => ["Novela", "Emocionante novela que te atrapará desde la primera página."],
  "mascotas" => ["Collar para perros", "Collar cómodo y elegante para tu mejor amigo peludo."],
  "empleos" => ["Oferta laboral", "Oportunidad emocionante para un nuevo empleo."]
}

10.times do
  random_category = category_objects.sample
  product_data = category_product_data[random_category.name]

  Product.create!(
    name: product_data[0],
    description: product_data[1],
    price: rand(50.0..500.0).round(2),
    user_id: user_one.id,
    category_id: random_category.id
  )
end

10.times do
  random_category = category_objects.sample
  product_data = category_product_data[random_category.name]

  Product.create!(
    name: product_data[0],
    description: product_data[1],
    price: rand(50.0..500.0).round(2),
    user_id: user_two.id,
    category_id: random_category.id
  )
end

10.times do
  random_category = category_objects.sample
  product_data = category_product_data[random_category.name]

  Product.create!(
    name: product_data[0],
    description: product_data[1],
    price: rand(50.0..500.0).round(2),
    user_id: user_three.id,
    category_id: random_category.id
  )
end