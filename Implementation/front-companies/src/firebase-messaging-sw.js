importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging-compat.js');

firebase.initializeApp(
    {
        apiKey: 'AIzaSyAjp0rZ-wlREP9aZxU8m5N7wSiszOnJREE',
        authDomain: 'push-test2-95c61.firebaseapp.com',
        projectId: 'push-test2-95c61',
        storageBucket: 'push-test2-95c61.appspot.com',
        messagingSenderId: '236107690508',
        appId: '1:236107690508:web:d082a28859eed222743429',
    }
)

const messaging = firebase.messaging()
