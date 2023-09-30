import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayoutsRoutingModule } from './layouts-routing.module';
import { DashboardLayoutComponent } from './dashboard-layout/dashboard-layout.component';
import { MatButtonModule } from '@angular/material/button';
import { DashboardHeaderComponent } from './dashboard-layout/components/dashboard-header/dashboard-header.component';
import { DashboardFooterComponent } from './dashboard-layout/components/dashboard-footer/dashboard-footer.component';
import { DashboardAsideComponent } from './dashboard-layout/components/dashboard-aside/dashboard-aside.component';

@NgModule({
  declarations: [
    DashboardLayoutComponent,
    DashboardHeaderComponent,
    DashboardFooterComponent,
    DashboardAsideComponent,
  ],
  imports: [CommonModule, LayoutsRoutingModule, MatButtonModule],
  exports: [DashboardLayoutComponent],
})
export class LayoutsModule {}
