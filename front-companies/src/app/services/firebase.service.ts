import { Injectable } from '@angular/core';
// import { initializeApp } from 'firebase/app';
// import { getMessaging } from 'firebase/messaging/sw';
// import { getToken } from 'firebase/messaging';

// const firebaseConfig = {
//   apiKey: 'AIzaSyAjp0rZ-wlREP9aZxU8m5N7wSiszOnJREE',
//   authDomain: 'push-test2-95c61.firebaseapp.com',
//   projectId: 'push-test2-95c61',
//   storageBucket: 'push-test2-95c61.appspot.com',
//   messagingSenderId: '236107690508',
//   appId: '1:236107690508:web:d082a28859eed222743429',
// };

@Injectable({
  providedIn: 'root',
})
export class FirebaseService {
  constructor() {
    // const app = initializeApp(firebaseConfig);
    // const messaging = getMessaging(app);
    // getToken(messaging, {
    //   vapidKey: 'BMmGXU7JRd8_I30afORyZFcbRLpDjTKxkAgQXjwdPCU6Pm',
    // })
    //   .then((currentToken) => {
    //     if (currentToken) {
    //       console.log(currentToken);
    //     } else {
    //       console.log('NOOOOOOOOOOOOOOOOOOOOOOO');
    //     }
    //   })
    //   .catch((err) => {
    //     console.error('Error', err);
    //   });
  }
}
