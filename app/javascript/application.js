// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import "@fortawesome/fontawesome-free"

// new Code.

// import './components/alert/alerta-registro.js';
// import './components/alert/alerta-inicio-sesion.js';
// import './components/alert/alerta-vender.js';
// import './components/alert/alerta-vender-dos.js';
// import './components/alert/creado-exitosamente.js';
// import './components/alert/menu-nav-opciones.js';
// import './components/info/footer-component.js';
// import './components/info/productos-para-ti.js'
// import './components/alert/alerta-notificara-vendedor.js';
// import './components/alert/nuevo-cliente.js';
// import './components/alert/nuevo-cliente-dos.js';
// import './components/alert/nueva-tarjeta.js';
// import './components/alert/evita-robos.js';
// import './components/alert/alerta-pin.js';
// import './components/alert/card-producto.js';
const hamburger = document.querySelector(".hamburger");
const navMenu = document.querySelector(".nav-menu");

hamburger.addEventListener("click", () => {
  hamburger.classList.toggle("active");
  navMenu.classList.toggle("active");
})

document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
  hamburger.classList.remove("active");
  navMenu.classList.remove("active");
}))