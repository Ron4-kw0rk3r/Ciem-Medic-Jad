



const searchInput = document.getElementById('cptsearch');
const resultDiv = document.getElementById('respbusq'); searchInput.addEventListener('submit', async (e) => { e.preventDefault();
    const searchQuery = searchInput.value; const translatedQuery = await translate(searchQuery, 'es', 'en');
    const url = "https://www.ncbi.nlm.nih.gov/pubmed/?term=${translatedQuery}";
    fetch(url) .then(response => response.text()) .then(html => { resultDiv.innerHTML = html;

        });
    });
    async function translate(text, source, target) { const googleTranslate = await import('google-translate-api'); const translator = new googleTranslate(text, { from: source, to: target }); 
    return translator.text; 
}