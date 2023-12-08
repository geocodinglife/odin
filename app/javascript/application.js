// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"


document.addEventListener("turbo:load", () => {
  const hamburger = document.querySelector(".hamburger");
  const navMenu = document.querySelector(".nav-menu");

  hamburger.addEventListener("click", () => {
    hamburger.classList.toggle("active");
    navMenu.classList.toggle("active");
  });

  document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
    hamburger.classList.remove("active");
    navMenu.classList.remove("active");
  }));

  // const showModalButtons = document.querySelectorAll('.showModalButton');
  // const modal = document.getElementById('modal');
  // const closeModal = document.getElementById('closeModal');
  // const productInput = document.getElementById('product');

  // showModalButtons.forEach(function (button) {
  //   button.addEventListener('click', function () {
  //     modal.style.display = 'block';

  //     const productId = button.getAttribute('data-product-id');
  //     productInput.value = productId;
  //   });
  // });

  // closeModal.addEventListener('click', function () {
  //   modal.style.display = 'none';
  // });

  // window.addEventListener('click', function (event) {
  //   if (event.target === modal) {
  //     modal.style.display = 'none';
  //   }
  // });
});
