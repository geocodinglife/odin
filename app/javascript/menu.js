document.addEventListener('DOMContentLoaded', () => {
  const menuIcon = document.getElementById('menu-icon');
  const header = document.querySelector('.header');
  const navbarMenu = document.getElementById('navbarMenu');

  menuIcon.addEventListener('click', () => {
    header.classList.toggle('is-open');
    navbarMenu.classList.toggle('show');
  });
});
