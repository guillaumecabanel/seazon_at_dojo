// import { Chart } from "frappe-charts"; not working see https://github.com/frappe/charts/issues/155
import { Chart } from 'frappe-charts/dist/frappe-charts.esm.js';

function ordersChart(frappeChartsDiv) {
  const data = {
    labels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
    datasets: [
        { values: [18, 40, 30, 35, 8, 52, 17, -4] }
    ]
  }

  frappeChartsDiv.insertAdjacentHTML('beforeend', '<div id="orders-chart"></div>');

  const chart = new Chart("#orders-chart", {
    data: data,
    type: 'bar',
    height: 140,
    colors: ['blue']
  });
}

function loadCharts(frappeChartsDiv) {
  ordersChart(frappeChartsDiv);
}

const frappeChartsDiv = document.getElementById('frappe-charts');

if (frappeChartsDiv) {
  loadCharts(frappeChartsDiv);
}
