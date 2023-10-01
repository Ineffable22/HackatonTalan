import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { FirebaseService } from 'src/app/services/firebase.service';

@Component({
  selector: 'app-dashboard-layout',
  templateUrl: './dashboard-layout.component.html',
  styleUrls: ['./dashboard-layout.component.scss'],
})
export class DashboardLayoutComponent implements OnInit, OnDestroy {
  mesaggeReceived: string = '';
  subscription!: Subscription;

  constructor(private firebase: FirebaseService) {}

  ngOnInit(): void {
    console.log('before');
    this.subscription = this.firebase.receiveMessage().subscribe((payload) => {
      console.log('AAAAAAAAAAAAAAAAAAAAAAA');
      console.log(payload);
      this.mesaggeReceived = payload.notification?.title ?? '';
      console.log(this.mesaggeReceived);
    });
    console.log('after');
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}
