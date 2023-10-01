import { Component } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-entry-page',
  templateUrl: './entry-page.component.html',
  styleUrls: ['./entry-page.component.scss'],
})
export class EntryPageComponent {
  idx = new FormControl(0);

  changheTabIndex(idx: number) {
    this.idx.setValue(idx);
  }
}
