import { Component } from '@angular/core';
import { FirebaseService } from './services/firebase.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'Sentinel Earth';
  constructor(private firebase: FirebaseService) {
    this.firebase.requestPermission().then((token) => {
      console.log(token);
    });
  }
}
