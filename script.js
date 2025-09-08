// Enhanced Portfolio JavaScript
function myskill() {
    let skillarray = [
        "an undergraduate CSE student at KUET",
        "a competitive programmer",
        "a problem solver",
        "passionate about technology"
    ];
    let index = 0;
    let currentText = '';
    let isDeleting = false;
    let typeSpeed = 100;

    function typeEffect() {
        const skillElement = document.getElementById("skills");
        if (!skillElement) return;

        const currentSkill = skillarray[index];

        if (isDeleting) {
            currentText = currentSkill.substring(0, currentText.length - 1);
            typeSpeed = 50;
        } else {
            currentText = currentSkill.substring(0, currentText.length + 1);
            typeSpeed = 100;
        }

        skillElement.innerHTML = currentText;

        if (!isDeleting && currentText === currentSkill) {
            setTimeout(() => { isDeleting = true; }, 1500);
        } else if (isDeleting && currentText === '') {
            isDeleting = false;
            index = (index + 1) % skillarray.length;
        }

        setTimeout(typeEffect, typeSpeed);
    }

    typeEffect();
}

// Smooth scrolling for navigation links
function initSmoothScrolling() {
    const navLinks = document.querySelectorAll('.navbar a');

    navLinks.forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetSection = document.getElementById(targetId);
            if (targetSection) {
                const offsetTop = targetSection.offsetTop - 80;
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });
}


// Header scroll effect
function initHeaderEffect() {
    const header = document.querySelector('.header');

    window.addEventListener('scroll', function () {
        if (window.scrollY > 100) {
            header.style.background = 'rgba(15, 15, 35, 0.95)';
            header.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.3)';
        } else {
            header.style.background = 'rgba(15, 15, 35, 0.9)';
            header.style.boxShadow = 'none';
        }
    });
}

// Intersection Observer for animations
function initScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Observe achievement cards
    const achievementCards = document.querySelectorAll('.achievement-card');
    achievementCards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(card);
    });

    // Observe about section
    const aboutElements = document.querySelectorAll('.about-img, .about-text');
    aboutElements.forEach((element, index) => {
        element.style.opacity = '0';
        element.style.transform = index === 0 ? 'translateX(-50px)' : 'translateX(50px)';
        element.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
        observer.observe(element);
    });
}

// Form enhancement
function initFormEnhancements() {
    const form = document.getElementById('contactForm');
    if (!form) return;

    const inputs = form.querySelectorAll('.form-control');

    inputs.forEach(input => {
        // Add focus effects
        input.addEventListener('focus', function () {
            this.parentElement.style.transform = 'scale(1.02)';
        });

        input.addEventListener('blur', function () {
            this.parentElement.style.transform = 'scale(1)';
        });

        // Add floating label effect
        input.addEventListener('input', function () {
            if (this.value) {
                this.style.borderColor = '#00d4ff';
            } else {
                this.style.borderColor = 'rgba(255, 255, 255, 0.2)';
            }
        });
    });
}

// Parallax effect for background
function initParallaxEffect() {
    window.addEventListener('scroll', function () {
        const scrolled = window.pageYOffset;
        const rate = scrolled * -0.5;

        const homeSection = document.querySelector('.home');
        if (homeSection) {
            homeSection.style.backgroundPosition = `center ${rate}px`;
        }
    });
}

// Initialize all functions when DOM is loaded
document.addEventListener('DOMContentLoaded', function () {
    console.log('Enhanced portfolio loaded successfully!');

    // Initialize all features
    initSmoothScrolling();
    initHeaderEffect();
    initScrollAnimations();
    initFormEnhancements();
    initParallaxEffect();

    // Add loading animation
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';

    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// Initialize typing effect when window loads
window.onload = function () {
    myskill();
};

// Add keyboard navigation support
document.addEventListener('keydown', function (e) {
    if (e.key === 'Tab') {
        document.body.classList.add('keyboard-navigation');
    }
});

document.addEventListener('mousedown', function () {
    document.body.classList.remove('keyboard-navigation');
});

// Performance optimization
if ('requestIdleCallback' in window) {
    requestIdleCallback(function () {
        console.log('Portfolio fully optimized and ready!');
    });
}
<script>
    document.addEventListener('keydown', function(e) {
            // Ctrl + L
            if (e.ctrlKey && e.key.toLowerCase() === 'l') {
        e.preventDefault(); // prevent default browser action
    const key = prompt("Enter the secret key to access admin page:");
    if (key === "mySecret123") {
        window.location.href = "Admin.aspx";
                } else {
        alert("Incorrect secret key!");
                }
            }
        });
</script>