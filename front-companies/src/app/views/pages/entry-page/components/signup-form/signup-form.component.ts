import { Component } from '@angular/core';
import {
  AbstractControl,
  FormControl,
  FormGroup,
  ValidatorFn,
  Validators,
} from '@angular/forms';

@Component({
  selector: 'app-signup-form',
  templateUrl: './signup-form.component.html',
  styleUrls: ['./signup-form.component.scss'],
})
export class SignupFormComponent {
  protected showPassword: boolean = false;
  protected showConfirmPassword: boolean = false;
  signupForm = new FormGroup({
    name: new FormControl('', [Validators.required]),
    email: new FormControl('', [Validators.email, Validators.required]),
    password: new FormControl('', [
      Validators.required,
      Validators.minLength(8),
      Validators.maxLength(36),
    ]),
    confirmPassword: new FormControl('', [
      Validators.required,
      this.passwordMatch(),
    ]),
  });

  get nameController() {
    return this.signupForm.controls.name;
  }

  get emailController() {
    return this.signupForm.controls.email;
  }

  get passwordControl() {
    return this.signupForm.controls.password;
  }

  get confirmPasswordControl() {
    return this.signupForm.controls.confirmPassword;
  }

  private cleanForm() {
    this.signupForm.reset();
  }

  passwordMatch(): ValidatorFn {
    return (control: AbstractControl) => {
      const passwordValue = this.signupForm?.controls.password.value ?? '';
      const confirmPasswordCOntrol = control.value;

      if (passwordValue === confirmPasswordCOntrol) return null;

      return { passwordMismatchError: true };
    };
  }

  submitForm(event: MouseEvent) {
    event.preventDefault();
    this.cleanForm();
  }
}
