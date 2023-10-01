import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private loggedUserData = new BehaviorSubject(null);
  public loggedUserData$ = this.loggedUserData.asObservable();

  constructor(private httpClient: HttpClient) {}

  verifyUserLogged(user: any) {
    this.loggedUserData.next(user);
  }

  login(user: { email: string; password: string; fcmtoken: string }) {
    return this.httpClient.post(`${environment.apiUrl}/login/v1`, user);
  }

  signup(newUser: {
    name: string;
    email: string;
    password: string;
    lat: number;
    long: number;
    fcmtoken: string;
  }) {
    return this.httpClient.post(
      `${environment.apiUrl}/user/v1/register`,
      newUser
    );
  }

  logout() {
    this.verifyUserLogged(null);
  }
}
