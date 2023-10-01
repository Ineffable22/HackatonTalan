import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayoutsRoutingModule } from './layouts-routing.module';
import { DashboardLayoutComponent } from './dashboard-layout/dashboard-layout.component';
import { MatButtonModule } from '@angular/material/button';
import { DashboardHeaderComponent } from './dashboard-layout/components/dashboard-header/dashboard-header.component';
import { DashboardAsideComponent } from './dashboard-layout/components/dashboard-aside/dashboard-aside.component';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';

@NgModule({
  declarations: [
    DashboardLayoutComponent,
    DashboardHeaderComponent,
    DashboardAsideComponent,
  ],
  imports: [
    CommonModule,
    LayoutsRoutingModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
  ],
  exports: [DashboardLayoutComponent],
})
export class LayoutsModule {}
