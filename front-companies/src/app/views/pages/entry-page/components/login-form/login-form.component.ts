import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.scss'],
})
export class LoginFormComponent {
  protected showPassword: boolean = false;
  protected loginForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required]),
  });

  get emailController() {
    return this.loginForm.controls.email;
  }

  get passwordController() {
    return this.loginForm.controls.password;
  }

  private cleanForm() {
    this.loginForm.reset();
  }

  submitForm(event: SubmitEvent) {
    event.preventDefault();
    this.cleanForm();
  }
}
