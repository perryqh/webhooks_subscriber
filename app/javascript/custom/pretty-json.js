import prettyPrintJson from 'pretty-print-json';

function PrettyJson() {

    const jsonDivs = document.querySelectorAll('.pretty-json');

    jsonDivs.forEach(jsonDiv => {
       console.log(jsonDiv);
    });
}

document.addEventListener('turbo:load', PrettyJson);