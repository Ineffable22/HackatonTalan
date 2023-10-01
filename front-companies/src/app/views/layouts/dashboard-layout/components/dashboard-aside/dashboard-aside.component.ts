import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard-aside',
  templateUrl: './dashboard-aside.component.html',
  styleUrls: ['./dashboard-aside.component.scss'],
})
export class DashboardAsideComponent {
  constructor(private router: Router) {}

  logout() {
    this.router.navigate(['/auth']);
  }
}
