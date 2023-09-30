
import { Injectable } from '@angular/core';

import { getMessaging, onMessage } from 'firebase/messaging';
import { getToken } from 'firebase/messaging';
import { environment } from 'src/environments/environment';



@Injectable({
  providedIn: 'root',
})
export class FirebaseService {
  constructor() {
    
    const messaging = getMessaging();

    getToken(messaging, {
      vapidKey: environment.firebase.vapidKey,
    })
      .then((currentToken) => {
        if (currentToken) {
          console.log(currentToken);
        } else {
          console.log('NOOOOOOOOOOOOOOOOOOOOOOO');
        }
      })
      .catch((err) => {
        console.error('Error', err);
      });
      onMessage(messaging, (payload) => {
        alert(JSON.stringify(payload.notification))
        console.log('Message received. ', payload);
        
      });
      
  }
}
