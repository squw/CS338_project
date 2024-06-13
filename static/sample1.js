function fetchData() {
    fetch('/data')
        .then(response => response.json())
        .then(data => {
            let tableBody = document.querySelector('#titleCrewTable5R tbody');
            

            // Insert new data
            data.forEach(sample => {
                let row = tableBody.insertRow();
                let tconst = row.insertCell(0);
                let directors = row.insertCell(1);
                let writers = row.insertCell(2);
                tconst.innerHTML = sample.tconst;
                directors.innerHTML = sample.directors;
                writers.innerHTML = sample.writers;
            });
        });
}
