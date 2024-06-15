
document.getElementById('configuracion_lk').addEventListener('click', function(event) {
    event.preventDefault();
    fetch('settings.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('content').innerHTML = data;
        })
        .catch(error => console.error('Error al cargar la página:', error));
});
