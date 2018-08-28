function setDateInputs(dateStr) {
  const beginDate = dateStr.match(/^\d{4}-\d{2}-\d{2}/)[0];
  const endDate = dateStr.match(/\d{4}-\d{2}-\d{2}$/)[0];

  const beginDateInput = document.getElementById('begin_date');
  const endDateInput = document.getElementById('end_date');

  beginDateInput.value = beginDate;
  endDateInput.value = endDate;
}

const rangeInput = document.getElementById('range');

if (rangeInput) {
  const rangeValues = document.getElementById('range-values');
  const beginDate= rangeValues.dataset.beginDate
  const endDate= rangeValues.dataset.endDate

  flatpickr('.datepicker-range', {
    allowInput: true,
    altInput: true,
    mode: "range",
    defaultDate: [beginDate, endDate],
    altFormat: 'd.m.Y', // avalaible format: https://flatpickr.js.org/formatting
    onClose: function(selectedDates, dateStr, instance){
       setDateInputs(dateStr)
    }
  });
}
