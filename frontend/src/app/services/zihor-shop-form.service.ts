import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Country } from '../common/country';
import { map } from 'rxjs/operators';
import { State } from '../common/state';
import { environment } from '../../environments/environment';


@Injectable({
  providedIn: 'root'
})
export class ZihorShopFormService {

  private countriesUrl = environment.zihorshopApiUrl + '/countries';
  private statesUrl = environment.zihorshopApiUrl + '/states';


  constructor(private httpClient: HttpClient) { }


  getCountries(): Observable<Country[]> {
    return this.httpClient.get<GetResonseCountries>(this.countriesUrl).pipe(
      map(response => response._embedded.countries)
    );
  }

  getStates(theCountryCode: string): Observable<State[]> {
    const searchStatesUrl = `${this.statesUrl}/search/findByCountryCode?code=${theCountryCode}`;

    return this.httpClient.get<GetResonseStates>(searchStatesUrl).pipe(
      map(response => response._embedded.states)
    );
  }


  getCreditCardMonth(startMonth: number): Observable<number[]> {

    let data: number[] = [];

    for(let theMonth = startMonth; theMonth <= 12; theMonth ++) {
      data.push(theMonth);
    }
    return of(data);
  }

  getCreditCardYears(): Observable<number[]> {
    
    let data: number[] = [];

    const startYear: number = new Date().getFullYear();
    const endYear: number = startYear + 10;

    for(let theYear = startYear; theYear <= endYear; theYear++){
      data.push(theYear);
    }
    return of(data);
  }
}

interface GetResonseCountries {
  _embedded: {
    countries: Country[];
  }
}

interface GetResonseStates {
  _embedded: {
    states: State[];
  }
}
