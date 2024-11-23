function toggleMenu() {
    const navLinks = document.querySelector('.nav-links');
    navLinks.classList.toggle('show');
}



document.addEventListener("DOMContentLoaded", function() {
    const cardContainer = document.querySelector('.card-container');
    const cards = Array.from(cardContainer.children); 

    const row1 = document.createElement('div');
    const row2 = document.createElement('div');

    row1.classList.add('pyramid-row');
    row2.classList.add('pyramid-row');
  
    for (let i = 0; i < cards.length; i++) {
        if (i < 3) {
            row1.appendChild(cards[i]); 
        } else {
            row2.appendChild(cards[i]);
        }
    }
    cardContainer.innerHTML = ''; 
    cardContainer.appendChild(row1); 
    cardContainer.appendChild(row2); 

});
