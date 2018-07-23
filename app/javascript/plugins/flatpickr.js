import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.css";
import "flatpickr/dist/themes/airbnb.css";

import { French } from "flatpickr/dist/l10n/fr.js"
flatpickr.localize(French);

flatpickr('.datepicker', {
  allowInput: true,
  altInput: true,
  altFormat: 'l d F Y', // avalaible format: https://flatpickr.js.org/formatting
});
