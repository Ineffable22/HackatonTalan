import { Component } from '@angular/core';
import {
  AbstractControl,
  FormControl,
  FormGroup,
  FormGroupDirective,
  NgForm,
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
  signupForm = new FormGroup(
    {
      name: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.email, Validators.required]),
      password: new FormControl('', [
        Validators.required,
        Validators.minLength(8),
        Validators.maxLength(36),
      ]),
      confirmPassword: new FormControl('', [Validators.required]),
    },
    [this.passwordMatch('password', 'confirmPassword')]
  );

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

  showErrors() {
    console.log(this.signupForm.errors);
    console.log(this.signupForm.hasError('passwordMismatchError'));
  }

  passwordMatch(password: string, confirmPassword: string) {
    return function (form: AbstractControl) {
      const passwordValue = form.get(password)?.value;
      const confirmPasswordValue = form.get(confirmPassword)?.value;

      if (passwordValue === confirmPasswordValue) return null;

      return { passwordMismatchError: true };
    };
  }

  submitForm(event: SubmitEvent) {
    event.preventDefault();
    this.cleanForm();
  }
}
