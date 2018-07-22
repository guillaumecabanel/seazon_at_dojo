function updateImageDisplay(input){
  const preview = document.querySelector('span.file-name');
  const image = document.querySelector('.meal-picture');
  const imageCard = document.querySelector('.photo');

  if (input.files.length > 0) {
    const new_image = document.createElement('img');
    new_image.src = window.URL.createObjectURL(input.files[0]);
    new_image.classList.add('meal-picture')
    new_image.width = '400'
    new_image.height = '200'
    imageCard.appendChild(new_image);
    image.remove();

    preview.innerText = input.files[0].name
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const input = document.querySelector('input#meal_photo');

  if (input){
    input.style.opacity = 0;
    input.addEventListener('change', (event) => {
      updateImageDisplay(event.currentTarget);
    });
  }
})
