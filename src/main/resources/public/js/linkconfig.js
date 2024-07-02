document.getElementById('model-link').addEventListener('click', function(event) {
    event.preventDefault();
    fetch('terrenfy.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('content').innerHTML = data;
            // Mostrar los scripts incluidos en terrenfy.html
            const scripts = new DOMParser().parseFromString(data, 'text/html').querySelectorAll('script');
            scripts.forEach(script => {
                if (script.src) {
                    const newScript = document.createElement('script');
                    newScript.src = script.src;
                    document.body.appendChild(newScript);
                    
                } else {
                    const inlineScript = document.createElement('script');
                    inlineScript.textContent = script.textContent;
                    document.body.appendChild(inlineScript);
                }
            });
        })
        .catch(error => console.error('Error al cargar la página:', error));
});
