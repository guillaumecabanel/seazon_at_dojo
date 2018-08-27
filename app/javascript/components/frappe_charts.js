// import { Chart } from "frappe-charts"; not working see https://github.com/frappe/charts/issues/155
import { Chart } from 'frappe-charts/dist/frappe-charts.esm.js';
import 'frappe-charts/dist/frappe-charts.min.css';

function ordersByDayChart(ordersByDayChartDiv) {
  const data = JSON.parse(ordersByDayChartDiv.dataset.json)

  const chart = new Chart(ordersByDayChartDiv, {
    data: data,
    type: 'bar',
    height: 140,
    colors: ['#3273DC']
  });
}

function ordersPaymentsChart(ordersPaymentsChartDiv) {
  const data = {
    labels: ["commandes payées", "commandes non payées"],
    datasets: [{
      values: [140, 30]
    }]
  }

  const chart = new Chart(ordersPaymentsChartDiv, {
    data: data,
    type: 'percentage',
    height: 140,
    colors: ['#3273DC', '#FFDD57']
  });
}

function loadCharts() {
  const ordersByDayChartDiv = document.getElementById('orders-by-day-chart');
  const ordersPaymentsChartDiv = document.getElementById('orders-payments-chart');

  if (ordersByDayChartDiv) {
    ordersByDayChart(ordersByDayChartDiv);
  }
  if (ordersPaymentsChartDiv) {
    ordersPaymentsChart(ordersPaymentsChartDiv);
  }
}

const frappeChartsDiv = document.getElementById('frappe-charts');

if (frappeChartsDiv) {
  loadCharts();
}
