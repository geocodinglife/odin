class WelcomeController < ApplicationController
  def index
    @icons = {
      "Vehículos" => "Contenido/Odin/Vehículos.svg",
      "Inmuebles" => "Contenido/Odin/Inmuebles.svg",
      "Alquiler" => "Contenido/Odin/Alquiler.svg",
      "Servicios" => "Contenido/Odin/Servicios.svg",
      "Electrónica" => "Contenido/Odin/Electrónica.svg",
      "Tecnología" => "Contenido/Odin/Tecnología.svg",
      "Muebles" => "Contenido/Odin/Muebles.svg",
      "Deportes" => "Contenido/Odin/Deportes.svg",
      "Belleza" => "Contenido/Odin/Belleza.svg",
      "Niños" => "Contenido/Odin/Niños.svg",
      "Libros" => "Contenido/Odin/Libros.svg",
      "Mascotas" => "Contenido/Odin/Mascotas.svg",
      "Empleos" => "Contenido/Odin/Empleos.svg"
    }

    @products = Product.last(40)
  end
end
