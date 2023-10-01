import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardLayoutComponent } from './dashboard-layout/dashboard-layout.component';
import { DashboardComponent } from '../pages/dashboard/dashboard.component';
import { AlertsComponent } from '../pages/alerts/alerts.component';

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
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class LayoutsRoutingModule {}
