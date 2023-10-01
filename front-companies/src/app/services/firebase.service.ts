import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { FirebaseApp, initializeApp } from 'firebase/app';
import {
  MessagePayload,
  Messaging,
  getMessaging,
  onMessage,
} from 'firebase/messaging';
import { getToken } from 'firebase/messaging';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class FirebaseService {
  fcmToken: string = '';
  messaging: Messaging;
  private app: FirebaseApp;
  private messagingObservable = new Observable<MessagePayload>((observe) => {
    onMessage(this.messaging, (payload) => observe.next(payload));
  });

  constructor() {
    this.app = initializeApp(environment.firebase);
    this.messaging = getMessaging(this.app);
  }

  requestPermission(): Promise<string> {
    return new Promise(async (resolve, reject) => {
      const permission = await Notification.requestPermission();

      if (permission === 'granted') {
        this.fcmToken = await getToken(this.messaging, {
          vapidKey: environment.firebase.vapidKey,
        });

        resolve(this.fcmToken);
      } else {
        reject(new Error('Permissions are not granted'));
      }
    });
  }

  receiveMessage() {
    return this.messagingObservable;
  }
}
