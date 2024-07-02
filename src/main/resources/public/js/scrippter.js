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
            tabla[i][j] = ((tabla[i + 1][j - 1] - tabla[i][j - 1]) / (x[i + j] - x[i]));
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
            polynomial += Math.abs(coef);
            for (let j = 0; j < i; j++) {
                polynomial += `(x - ${x[j]})`;
            }
        }
    }
    return polynomial;
}



function formatPolynomial(polynomial) {
    return polynomial.replace(/\*1/g, '')
        .replace(/\+-/g, '-')
        .replace(/--/g, '+')
        .replace(/\b0\.\d+/g, match => parseFloat(match).toPrecision(4));
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
    const simplifiedPolynomial = math.simplify(polynomial).toString();
    
    
    
    const filePath = 'output.txt';
    const blob = new Blob([simplifiedPolynomial], { type: 'text/plain' });
    const fileHandle = await window.showSaveFilePicker({
        suggestedName: filePath,
        types: [{
            description: 'Text Files',
            accept: {'text/plain': ['.txt']},
        }],
    });
    const writableStream = await fileHandle.createWritable();
    await writableStream.write(blob);
    await writableStream.close();
    //console.log(`The value of simplifiedPolynomial has been saved as ${filePath}`);
    
    
    const simplifiedExpression = math.simplify(polynomial).toString();
    const latexFormattedExpression = `y = ${simplifiedExpression.replace(/\*/g, ' \\cdot ')}`;
    window.latexFormattedExpression = latexFormattedExpression;
    
    async function readSimplifiedResult(file) {
        try {
            const reader = new FileReader();
            reader.onload = async function(event) {
                const data = event.target.result;
                const b2simplifiedExpression = data.trim();
                window.latexFormattedExpression = b2simplifiedExpression;
                document.getElementById('mod-black').innerText = `Modelo: ${b2simplifiedExpression}`;
                
                let formattedPolynomial;
                try {
                    formattedPolynomial = formatPolynomial(latexFormattedExpression);
                } catch (error) {
                    console.error("Error formatting polynomial:", error);
                    formattedPolynomial = latexFormattedExpression; // Fallback to the original expression
                }
            };
            reader.readAsText(file);
        } catch (error) {
            console.error(error);
        }
    }

    
    
    katex.render(`y = ${simplifiedPolynomial}`, document.getElementById('simplifiedModel'), {
        throwOnError: false
    });
    

    const formattedPolynomial = simplifiedPolynomial.replace(/\*/g, ' \\cdot ').replace(/\//g, ' \\div ').replace(/x/g, ' \\cdot x');


    const procedure = `
        \\text{\\textbf{Procedimiento}} \\\\
        \\text{Datos Iniciales:} \\\\
        \\begin{array}{c|c}
        x & f(x) \\\\
        \\hline
        ${xValues.map((x, i) => `${x} & ${fxValues[i]}`).join(' \\\\ ')}
        \\end{array} \\\\
        \\text{Cálculo de las Diferencias Divididas:} \\\\
        \\begin{array}{c|c|c|c|c|c}
        x & f(x) & \\Delta_1 & \\Delta_2 & \\Delta_3 & \\Delta_4 & \\Delta_5 \\\\
        \\hline
        ${diferencias.map((row, i) => `${xValues[i]} & ${row.join(' & ')}`).join(' \\\\ ')}
        \\end{array} \\\\
        \\text{Construcción del Polinomio de Newton:} \\\\
        P(x) = f(x_0) + \\Delta_1 (x - x_0) + \\Delta_2 (x - x_0)(x - x_1) + \\Delta_3 (x - x_0)(x - x_1)(x - x_2) + \\ldots \\\\
        \\text{Sustituyendo los valores calculados:} \\\\
        P(x) = ${simplifiedPolynomial} \\\\
        \\text{\\textbf{Modelo Matemático Final}} \\\\
        y = ${formattedPolynomial}
    `;
    
    // Operate on the formattedPolynomial to handle cases like x^n

    
    
    //const resolvedPolynomial = resolvePolynomial(simplifiedPolynomial);
    // Render the operated polynomial using KaTeX
    katex.render(`y = ${procedure}`, document.getElementById('procedure'), {
        throwOnError: false
    });
    
    document.getElementById('fileInput').addEventListener('change', async function(event) {
        const file = event.target.files[0];
        if (file) {
            await readSimplifiedResult(file);
            const latexCode = `\\text{Archivo seleccionado:} \\texttt{${file.name}}`;
            katex.render(latexCode, document.getElementById('fileInputLatex'), {
                throwOnError: false
            });

            // Update the value after reading the file
            const response = await fetch('js/simplified_result.json');
            const data = await response.json();
            const simplifiedPolynomial = data.value;
            katex.render(`y = ${simplifiedPolynomial}`, document.getElementById('simplifiedModel'), {
                throwOnError: false
            }); 
        }
    });
    // Generate model using Newton's interpolation
    const modelValues = xValues.map(x => interpolacionNewton(xValues, fxValues, x));

    // Update charts
    updateChartsWithData(xValues, fxValues, modelValues);
};








function updateChartsWithData(xValues, fxValues, modelValues) {
    const lineChart = Chart.getChart('lineChart');
    const scatterChart = Chart.getChart('scatterChart');

    if (lineChart) {
        lineChart.data.labels = xValues;
        lineChart.data.datasets[0].data = modelValues;
        lineChart.update();
    } else {
        new Chart(document.getElementById('lineChart'), {
            type: 'line',
            data: {
                labels: xValues,
                datasets: [{
                    label: 'Interpolación de Newton',
                    data: modelValues,
                    borderColor: 'rgba(0, 0, 139, 1)', // Azul oscuro
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
    }

    if (scatterChart) {
        const newData = xValues.map((x, index) => ({ x: x, y: fxValues[index] }));
        scatterChart.data.datasets[0].data.push(...newData);
        scatterChart.data.datasets[0].backgroundColor = xValues.map((_, index) => `rgba(${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, 1)`); // Actualizar color con más colores
        scatterChart.update();
    } else {
        new Chart(document.getElementById('scatterChart'), {
            type: 'scatter',
            data: {
                datasets: [{
                    label: 'Datos',
                    data: xValues.map((x, index) => ({ x: x, y: fxValues[index] })),
                    backgroundColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)']
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
}

