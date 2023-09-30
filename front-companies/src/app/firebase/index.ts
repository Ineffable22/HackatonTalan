// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app';
import { getMessaging, getToken } from 'firebase/messaging';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: 'AIzaSyAjp0rZ-wlREP9aZxU8m5N7wSiszOnJREE',
  authDomain: 'push-test2-95c61.firebaseapp.com',
  projectId: 'push-test2-95c61',
  storageBucket: 'push-test2-95c61.appspot.com',
  messagingSenderId: '236107690508',
  appId: '1:236107690508:web:d082a28859eed222743429',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const messaging = getMessaging(app);

getToken(messaging, {
  vapidKey: 'BMmGXU7JRd8_I30afORyZFcbRLpDjTKxkAgQXjwdPCU6Pm',
})
  .then((currentToken) => {
    if (currentToken) {
    } else {
      console.log('NOOOOOOOOOOOOOOOOOOOOOOO');
    }
  })
  .catch((err) => {
    console.error('Error', err);
  });

// private=0Y782XqqojXB4K1DiWJb2tUctjJnrFiPBt3OP0pxFjg
// public=BMmGXU7JRd8_I30afORyZFcbRLpDjTKxkAgQXjwdPCU6Pm
