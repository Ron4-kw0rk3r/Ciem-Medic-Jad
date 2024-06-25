document.getElementById('model-link').addEventListener('click', function(event) {
    event.preventDefault();
    fetch('terrenfy.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('content').innerHTML = data;
            // Mostrar los scripts incluidos en settings.html
            const scripts = new DOMParser().parseFromString(data, 'text/html').querySelectorAll('script');
            scripts.forEach(script => {
                document.body.appendChild(script);
            });
        })
        .catch(error => console.error('Error al cargar la página:', error));
});
