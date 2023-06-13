 

 
     
// Slider 
const imgPosition = document.querySelectorAll('.aspect-ratio-169 img');
const imgContainer = document.querySelector('.aspect-ratio-169');
const prevBtn = document.querySelector('.prev');
const nextBtn = document.querySelector('.next');

let index = 0;
let imgNumber = imgPosition.length;
imgPosition.forEach(function (image, index) {
    image.style.left = index * 100 + '%';
})
 function imgSlide() {
     index++;
     if (index >= imgNumber) {
         index = 0;
     }
     imgContainer.style.left = '-' + index * 100 + '%';
 }

function prevSlide() {
    index--;
    if (index < 0) {
        index = imgNumber - 1;
    }
    imgContainer.style.left = '-' + index * 100 + '%';
}
prevBtn.addEventListener('click', prevSlide);

function nextSlide() {
    index++;
    if (index >= imgNumber) {
        index = 0;
    }
    imgContainer.style.left = '-' + index * 100 + '%';
}
nextBtn.addEventListener('click', nextSlide);

setInterval(imgSlide, 5000)
const links = document.querySelectorAll('.catefory-list a');
  links.forEach(function(link) {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const h1 = document.querySelector('.container-vegetables h1');
      const breadLink = document.querySelector('.bread-wrapper a:last-child');
      h1.textContent = this.textContent;
      breadLink.textContent = this.textContent;
    });
  });





