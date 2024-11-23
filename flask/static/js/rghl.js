document.querySelectorAll('.rule').forEach(rule => {
    rule.addEventListener('click', () => {
        const content = rule.querySelector('.rule-content');
        content.style.display = content.style.display === 'block' ? 'none' : 'block';
    });
});