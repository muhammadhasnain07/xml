const apiKey = "8e1d567e3c88c4b3d4f9aa7af12ffbf6";

async function getWeather() {
  let city = document.getElementById("city").value;
  if(city === ""){
    alert("Please enter a city name!");
    return;
  }

  let response = await fetch(`https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}&units=metric`);
  let data = await response.json();

  if(data.cod !== 200){
    document.getElementById("result").innerHTML =
      `<p class="text-danger fw-bold">City not found ❌</p>`;
    return;
  }

  document.getElementById("result").innerHTML = `
    <div>
      <i id="weather-icon" class="wi wi-day-cloudy"></i>
      <h4 class="fw-bold mt-2">${data.name}</h4>
      <p class="mb-1"><b>🌡 Temp:</b> ${data.main.temp} °C</p>
      <p class="mb-1"><b💨 Wind:</b> ${data.wind.speed} m/s</p>
      <p class="mb-0"><b>🌥 Weather:</b> ${data.weather[0].description}</p>
    </div>
  `;
}