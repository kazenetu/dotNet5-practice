using System;

namespace source.Interfaces
{
    public interface IWeatherForecast
    {
        DateTime Date { get; }

        int TemperatureC { get; }

        int TemperatureF { get; }

        string Summary { get; }
    }
}
