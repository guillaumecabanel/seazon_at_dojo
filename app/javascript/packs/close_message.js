document.addEventListener('DOMContentLoaded', function () {
  const deleteButtons = document.querySelectorAll('.notification button.delete')
  deleteButtons.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.currentTarget.parentElement.style.display = 'none';
    })
  })
});
