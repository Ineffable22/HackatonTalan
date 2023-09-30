import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './views/pages/dashboard/dashboard.component';
import { EntryPageComponent } from './views/pages/entry-page/entry-page.component';

const routes: Routes = [
  {
    path: '',
    pathMatch: 'full',
    redirectTo: 'auth',
  },
  {
    path: 'auth',
    component: EntryPageComponent,
  },
  {
    path: '',
    loadChildren: () =>
      import('./views/layouts/layouts.module').then((m) => m.LayoutsModule),
  },
  {
    path: '**',
    redirectTo: 'auth',
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
