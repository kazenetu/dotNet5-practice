using System;
using source.Interfaces;

namespace source
{
    public class WeatherForecast: IWeatherForecast
    {
        public WeatherForecast(DateTime date, int temperatureC, string summary){
            Date = date;
            TemperatureC = temperatureC;
            Summary = summary;
        }

        public DateTime Date { get; private set; }

        public int TemperatureC { get; private set; }

        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);

        public string Summary { get; private set; }
    }
}
