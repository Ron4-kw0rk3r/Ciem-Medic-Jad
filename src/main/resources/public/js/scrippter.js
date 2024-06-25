document.addEventListener('DOMContentLoaded', function () {
    updateCharts();
});

function addDataField() {
    const table = document.getElementById('dataPointsTable').getElementsByTagName('tbody')[0];
    const newRow = table.insertRow(table.rows.length);
    newRow.innerHTML = `
        <tr class="form-group">
            <td><input type="number" class="form-control" name="xValue[]" placeholder="x" required></td>
            <td><input type="number" class="form-control" name="fxValue[]" placeholder="f(x)" required></td>
            <td><button type="button" class="btn btn-danger" onclick="removeDataField(this)">Eliminar</button></td>
        </tr>
    `;
}

function removeDataField(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}

function calcularDiferenciasDivididas(x, fx) {
    let n = x.length;
    let tabla = new Array(n).fill(0).map(() => new Array(n).fill(0));
    for (let i = 0; i < n; i++) {
        tabla[i][0] = fx[i];
    }
    for (let j = 1; j < n; j++) {
        for (let i = 0; i < n - j; i++) {
            tabla[i][j] = (tabla[i + 1][j - 1] - tabla[i][j - 1]) / (x[i + j] - x[i]);
        }
    }
    return tabla;
}

function interpolacionNewton(x, fx, valor) {
    let diferencias = calcularDiferenciasDivididas(x, fx);
    let n = x.length;
    let resultado = diferencias[0][0];
    for (let i = 1; i < n; i++) {
        let term = diferencias[0][i];
        for (let j = 0; j < i; j++) {
            term *= (valor - x[j]);
        }
        resultado += term;
    }
    return resultado;
}

function generatePolynomialString(diferencias, x) {
    let polynomial = "";
    let n = diferencias.length;
    for (let i = 0; i < n; i++) {
        let coef = diferencias[0][i];
        if (coef !== 0) {
            if (polynomial !== "" && coef > 0) {
                polynomial += " + ";
            } else if (coef < 0) {
                polynomial += " - ";
            }
            polynomial += Math.abs(coef).toFixed(4);
            for (let j = 0; j < i; j++) {
                polynomial += `(x - ${x[j].toFixed(2)})`;
            }
        }
    }
    return polynomial;
}

async function generateModel() {
    const degree = parseInt(document.getElementById('degree').value);

    // Collect data from the table
    const xValues = Array.from(document.querySelectorAll('input[name="xValue[]"]')).map(input => parseFloat(input.value));
    const fxValues = Array.from(document.querySelectorAll('input[name="fxValue[]"]')).map(input => parseFloat(input.value));

    // Check if there are enough data points
    if (xValues.length < degree + 1) {
        alert('No hay suficientes puntos de datos para el grado del polinomio solicitado.');
        return;
    }

    const diferencias = calcularDiferenciasDivididas(xValues, fxValues);
    const polynomial = generatePolynomialString(diferencias, xValues);

    document.getElementById('model').innerText = `Polinomio interpolado: y = ${polynomial}`;

    // Generate model using Newton's interpolation
    const modelValues = xValues.map(x => interpolacionNewton(xValues, fxValues, x));

    // Update charts
    updateChartsWithData(xValues, fxValues, modelValues);
}

function updateChartsWithData(xValues, fxValues, modelValues) {
    new Chart(document.getElementById('lineChart'), {
        type: 'line',
        data: {
            labels: xValues,
            datasets: [{
                label: 'Interpolación de Newton',
                data: modelValues,
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false,
                tension: 0.4
            }]
        },
        options: {
            scales: {
                x: { type: 'linear' },
                y: { type: 'linear' }
            }
        }
    });

    new Chart(document.getElementById('scatterChart'), {
        type: 'scatter',
        data: {
            datasets: [{
                label: 'Datos',
                data: xValues.map((x, index) => ({ x: x, y: fxValues[index] })),
                backgroundColor: 'rgba(255, 99, 132, 1)'
            }]
        },
        options: {
            scales: {
                x: { type: 'linear' },
                y: { type: 'linear' }
            }
        }
    });
}
