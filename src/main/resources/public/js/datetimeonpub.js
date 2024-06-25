
function updateDateTime() {
    var currentTime = new Date().toLocaleTimeString();
    var currentDate = new Date().toLocaleDateString();
    var loginStatus = localStorage.getItem('loginStatus');
    document.getElementById('current-time').textContent = currentTime;
    document.getElementById('current-date').textContent = currentDate;
    document.getElementById('login-status').textContent = loginStatus;
}

// Update date and time every second
setInterval(updateDateTime, 1000);
//// 
function saveSettings() {
    var selectedEngine = document.getElementById('search-engine').value;
    localStorage.setItem('selectedSearchEngine', selectedEngine);
    //alert('Motor de búsqueda seleccionado guardado:' + selectedEngine);
}



document.getElementById('save-settings').addEventListener('click', function(event) {
    var selectedEngine = document.getElementById('search-engine').value;
    
    // Muestra un alerta con el motor seleccionado
    alert('Motor de búsqueda seleccionado: ' + selectedEngine + ' ha sido guardado como predeterminado.');
    
    // Redirige a index.html que debería leer la configuración guardada
    window.location.href = '/';
});
