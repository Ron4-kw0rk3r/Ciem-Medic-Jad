

function performSearch() {
    var query = document.getElementById('cptsearch').value.trim(); // Obtener el término de búsqueda
    
    // Obtener el motor de búsqueda seleccionado desde el almacenamiento local
    var selectedEngine = localStorage.getItem('preferredSearchEngine');
    console.log("Selected search engine:", selectedEngine);
    if (selectedEngine === 'PubMed-Basic') {
        // Reemplaza 'tu_cx_de_google_cse' con tu propio ID de Google CSE
        var cx = '1006b4e345d3f4aed';

        // URL para realizar la búsqueda directamente a través de Google CSE JSON API
        var url = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBsazN3igykfiKh1yfn2ovz-OOcvlOycOY&cx=' + cx + '&q=' + encodeURIComponent(query);

        // Realizar la solicitud GET a la API de Google CSE
        fetch(url)
            .then(response => response.json())
            .then(data => {
                showSearchResults(data.items); // Mostrar los resultados obtenidos
            })
            .catch(error => {
                console.error('Error al obtener resultados de búsqueda:', error);
            });


        
        function showSearchResults(results) {
            var container = document.getElementById('searchResultsContainer');
            container.innerHTML = ''; // Limpiar resultados anteriores

            if (results && results.length > 0) {
                results.forEach(result => {
                    var title = result.title;
                    var snippet = result.snippet; // Descripción del resultado
                    var link = result.link;

                    // Crear elementos HTML para mostrar los resultados
                    var resultElement = document.createElement('div');
                    resultElement.classList.add('search-result');
                    resultElement.innerHTML = `
                        <h2><a href="${link}" target="_blank">${title}</a></h2>
                        <p>${snippet}</p>
                        <p><a href="${link}" target="_blank">${link}</a></p>
                    `;
                    container.appendChild(resultElement);
                });
            } else {
                container.innerHTML = '<p>No se encontraron resultados para la búsqueda.</p>';
            }

        }

    } else if (selectedEngine === 'Google-SyncsAll') {
        // Reemplaza 'tu_cx_de_google_cse' con tu propio ID de Google CSE
        var cx = '0757d0455053a446c';

        // URL para realizar la búsqueda directamente a través de Google CSE JSON API
        var url = 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBLvGI4ios_-zMSbKwNKbwdRV64M-NLnvI&cx=' + cx + '&q=' + encodeURIComponent(query);

        // Realizar la solicitud GET a la API de Google CSE
        fetch(url)
            .then(response => response.json())
            .then(data => {
                showSearchResults(data.items); // Mostrar los resultados obtenidos
            })
            .catch(error => {
                console.error('Error al obtener resultados de búsqueda:', error);
            });


            function showSearchResults(results) {
                var container = document.getElementById('searchResultsContainer');
                container.innerHTML = ''; // Limpiar resultados anteriores
    
                if (results && results.length > 0) {
                    results.forEach(result => {
                        var title = result.title;
                        var snippet = result.snippet; // Descripción del resultado
                        var link = result.link;
                        var image = result.image ? result.image : 'https://via.placeholder.com/150'; // Imagen del resultado o imagen por defecto
    
                        // Crear elementos HTML para mostrar los resultados
                        var resultElement = document.createElement('div');
                        resultElement.classList.add('search-result');
                        resultElement.innerHTML = `
                            <div class="result-header">
                                <img src="${image}" alt="${title}" class="result-image">
                                <h2><a href="${link}" target="_blank">${title}</a></h2>
                            </div>
                            <p>${snippet}</p>
                            <p><a href="${link}" target="_blank">Ver más</a></p>
                        `;
                        container.appendChild(resultElement);
                    });
                } else {
                    container.innerHTML = '<p>No se encontraron resultados para la búsqueda.</p>';
                }
    
            }
    } else {
        
        // Implementar la lógica para otros motores de búsqueda si es necesario
        var container = document.getElementById('searchResultsContainer');
        container.innerHTML = '<p>Motor de búsqueda no configurado para este tipo.</p>';
        console.log('Motor de búsqueda no configurado para este tipo.');
        
    }
}
