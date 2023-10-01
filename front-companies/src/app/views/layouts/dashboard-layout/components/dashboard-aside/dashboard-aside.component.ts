import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../../../../services/auth.service';

@Component({
  selector: 'app-dashboard-aside',
  templateUrl: './dashboard-aside.component.html',
  styleUrls: ['./dashboard-aside.component.scss'],
})
export class DashboardAsideComponent {
  constructor(private router: Router, private authService: AuthService) {}

  logout() {
    this.authService.logout();
    this.router.navigate(['/auth']);
  }
}
