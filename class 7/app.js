// openweather
const apiKey = "34f7571ec7b03f293befd3f12d506ee8" ;

async function getWeather(){
    let city = document.getElementById("city").value

    let response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`);
    
    let data = await response.json();

    let weatherDiv = document.getElementById("result")
    weatherDiv.innerHTML = `
        <p>City : ${data.name} </p>
        <p>Temp : ${data.main.temp} °C </p>
        <p>Wind : ${data.wind.speed} </p>
        <p>Weather description : ${data.weather[0].description} </p>
    `
}

