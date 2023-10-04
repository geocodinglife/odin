class WelcomeController < ApplicationController
  def index
    @icons = {
      "Mobiles" => "mobile.png",
      "Vehiculos" => "car.png",
      "Propiedades" => "property.png",
      "Alquileres" => "rental.png",
      "Electronica" => "electro.png",
      "Bicicletas" => "bikes.png",
      "Empresas" => "business.png",
      "Servicios" => "services.png",
      "Empleos" => "jobs.png",
      "Mascotas" => "pets.png",
      "Muebles" => "furniture.png",
      "Libros" => "books.png",
      "Niños" => "kids.png"
    }

    @products = Product.last(40)
  end
end
