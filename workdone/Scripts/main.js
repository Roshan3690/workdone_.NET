document.addEventListener("DOMContentLoaded", function () {
    // Add shadow to navbar on scroll
    const navbar = document.querySelector('.navbar');
    
    if (navbar) {
        window.addEventListener('scroll', function () {
            if (window.scrollY > 50) {
                navbar.classList.add('shadow');
                navbar.classList.remove('shadow-sm');
            } else {
                navbar.classList.remove('shadow');
                navbar.classList.add('shadow-sm');
            }
        });
    }

    // Close mobile menu when a nav link is clicked
    const navLinks = document.querySelectorAll('.nav-link');
    const menuToggle = document.getElementById('navbarContent');
    
    if (menuToggle) {
        const bsCollapse = new bootstrap.Collapse(menuToggle, {toggle: false});
        
        navLinks.forEach(function (l) {
            l.addEventListener('click', function () {
                if (menuToggle.classList.contains('show')) {
                    bsCollapse.toggle();
                }
            });
        });
    }
});
