import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Inject, Injectable } from '@angular/core';
import { OktaAuth } from '@okta/okta-auth-js';
import { Observable, from, lastValueFrom } from 'rxjs';
import { OKTA_AUTH } from '@okta/okta-angular';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthInterceptorService implements HttpInterceptor {

  constructor(@Inject(OKTA_AUTH) private oktaAuth: typeof OktaAuth) { }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    return from(this.handleAccess(request, next));
  }

  private async handleAccess(request: HttpRequest<any>, next: HttpHandler): Promise<HttpEvent<any>> {

  const theEndPoint = environment.zihorshopApiUrl + '/orders';

  const securedEndpoints = [theEndPoint];

  if (securedEndpoints.some(url => request.urlWithParams.includes(url))) {


    const accesToken = this.oktaAuth.getAccessToken(request);

    request = request.clone({
      setHeaders: { 'Authorization': 'Bearer ' + accesToken}
    });

    }
    return await lastValueFrom(next.handle(request));
  }
}