import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatTabsModule } from '@angular/material/tabs';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { EntryPageComponent } from './pages/entry-page/entry-page.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { LoginFormComponent } from './pages/entry-page/components/login-form/login-form.component';
import { SignupFormComponent } from './pages/entry-page/components/signup-form/signup-form.component';
import { LayoutsModule } from './layouts/layouts.module';
import { AlertsComponent } from './pages/alerts/alerts.component';

@NgModule({
  declarations: [
    EntryPageComponent,
    DashboardComponent,
    LoginFormComponent,
    SignupFormComponent,
    AlertsComponent,
  ],
  imports: [
    CommonModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    MatTabsModule,
    MatInputModule,
    MatButtonModule,
    MatIconModule,
    LayoutsModule,
  ],
  exports: [EntryPageComponent, DashboardComponent, AlertsComponent],
})
export class ViewsModule {}
