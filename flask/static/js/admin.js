document.addEventListener("DOMContentLoaded", function () {
    // Bar Chart
    const barCtx = document.getElementById('barChart').getContext('2d');
    new Chart(barCtx, {
        type: 'bar',
        data: {
            labels: ['Clientes', 'Empleados', 'Habitaciones'],
            datasets: [{
                label: 'Cantidad',
                data: [12, 19, 8], // Datos iniciales
                backgroundColor: [
                    '#8C1C13',
                    '#B22222',
                    '#FF6347'
                ]
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: true }
            }
        }
    });

    // Pie Chart
    const pieCtx = document.getElementById('pieChart').getContext('2d');
    new Chart(pieCtx, {
        type: 'pie',
        data: {
            labels: ['Clientes', 'Empleados', 'Habitaciones'],
            datasets: [{
                label: 'Distribución',
                data: [30, 20, 50], // Datos iniciales
                backgroundColor: [
                    '#8C1C13',
                    '#B22222',
                    '#FF6347'
                ]
            }]
        },
        options: {
            responsive: true
        }
    });
});
