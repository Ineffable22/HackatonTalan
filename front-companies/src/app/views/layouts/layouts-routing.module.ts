import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardLayoutComponent } from './dashboard-layout/dashboard-layout.component';
import { DashboardComponent } from '../pages/dashboard/dashboard.component';
import { AlertsComponent } from '../pages/alerts/alerts.component';
import { ConfigurationComponent } from '../pages/configuration/configuration.component';
import { ProfileComponent } from '../pages/profile/profile.component';

const routes: Routes = [
  {
    path: 'dashboard',
    redirectTo: 'dashboard/home',
  },
  {
    path: 'dashboard',
    component: DashboardLayoutComponent,
    children: [
      { path: 'home', component: DashboardComponent },
      { path: 'alerts', component: AlertsComponent },
      { path: 'config', component: ConfigurationComponent },
      { path: 'profile', component: ProfileComponent },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class LayoutsRoutingModule {}
