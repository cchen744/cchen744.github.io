// Reveal sections on scroll — staggered within each group
document.addEventListener('DOMContentLoaded', () => {
  const groups = [
    document.querySelectorAll('.about'),
    document.querySelectorAll('.projects > .card, .project-grid > .card'),
    document.querySelectorAll('.skills-grid .skill-group'),
    document.querySelectorAll('.contact')
  ];

  const all = [];
  groups.forEach(group => {
    group.forEach((el, i) => {
      el.classList.add('reveal');
      el.style.transitionDelay = (i * 70) + 'ms';
      all.push(el);
    });
  });

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -8% 0px' });

  all.forEach(el => observer.observe(el));
});
