document.addEventListener('DOMContentLoaded', function () {
    const cursor = document.querySelector('.cursor');

    document.addEventListener('mousemove', function (e) {
        cursor.style.left = e.pageX + 'px';
        cursor.style.top = e.pageY + 'px';
    });

    document.querySelectorAll('nav ul li a').forEach(link => {
        link.addEventListener('mouseenter', () => {
            cursor.style.width = '40px';
            cursor.style.height = '40px';
            cursor.style.background = '#f39c12';
        });
        link.addEventListener('mouseleave', () => {
            cursor.style.width = '20px';
            cursor.style.height = '20px';
            cursor.style.background = '#fff';
        });
    });

    const sections = document.querySelectorAll('section');
    const options = {
        threshold: 0.7
    };

    let observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                document.querySelectorAll('nav ul li a').forEach(link => {
                    link.classList.remove('active');
                });
                const activeLink = document.querySelector(`nav ul li a[href="#${entry.target.id}"]`);
                activeLink.classList.add('active');
            }
        });
    }, options);

    sections.forEach(section => {
        observer.observe(section);
    });
});
