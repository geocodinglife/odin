class WelcomeController < ApplicationController
  def index
    @icons = {
      "vehículos" => "Contenido/Odin/Vehículos.svg",
      "inmuebles" => "Contenido/Odin/Inmuebles.svg",
      "alquiler" => "Contenido/Odin/Alquiler.svg",
      "servicios" => "Contenido/Odin/Servicios.svg",
      "Electrónica" => "Contenido/Odin/Electrónica.svg",
      "tecnología" => "Contenido/Odin/Tecnología.svg",
      "muebles" => "Contenido/Odin/Muebles.svg",
      "deportes" => "Contenido/Odin/Deportes.svg",
      "belleza" => "Contenido/Odin/Belleza.svg",
      "niños" => "Contenido/Odin/Niños.svg",
      "libros" => "Contenido/Odin/Libros.svg",
      "mascotas" => "Contenido/Odin/Mascotas.svg",
      "empleos" => "Contenido/Odin/Empleos.svg"
    }

    @products = Product.last(40)
  end
end
