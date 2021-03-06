import { Component, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IWeatherForecast } from '../interfaces/IWeatherForecast'

@Component({
  selector: 'app-fetch-data',
  templateUrl: './fetch-data.component.html'
})
export class FetchDataComponent {
  public forecasts: IWeatherForecast[];
  private httpClient:HttpClient = null;

  constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string) {
    this.httpClient = http;
    http.get<IWeatherForecast[]>(baseUrl + 'weatherforecast').subscribe(result => {
      this.forecasts = result;
    }, error => console.error(error));
  }

  postRequest(){
    this.httpClient.post<IWeatherForecast[]>("/" + 'weatherforecast',null).subscribe(result => {
      this.forecasts = result;
    }, error => console.error(error));
  }
}

