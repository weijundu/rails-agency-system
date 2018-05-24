function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  const banner = document.querySelector(".banner")
  window.addEventListener('scroll', () => {
    if (window.scrollY) {
      navbar.classList.add('navbar-wagon-solid')
    } else {
      navbar.classList.remove('navbar-wagon-solid');
    }
  });
}

export { initUpdateNavbarOnScroll };
