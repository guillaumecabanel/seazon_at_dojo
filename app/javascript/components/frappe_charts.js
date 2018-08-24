// import { Chart } from "frappe-charts"; not working see https://github.com/frappe/charts/issues/155
import { Chart } from 'frappe-charts/dist/frappe-charts.esm.js';
import 'frappe-charts/dist/frappe-charts.min.css';

function ordersChart() {
  const ordersChartDiv = document.getElementById('orders-chart');

  const data = JSON.parse(ordersChartDiv.dataset.orders)

  const chart = new Chart(ordersChartDiv, {
    data: data,
    type: 'bar',
    height: 140,
  });
}

function loadCharts() {
  ordersChart();
}

const frappeChartsDiv = document.getElementById('frappe-charts');

if (frappeChartsDiv) {
  loadCharts();
}
