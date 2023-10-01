import { Component, OnInit } from '@angular/core';
import {
  AbstractControl,
  FormGroup,
  ValidatorFn,
  Validators,
} from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';
import { FormBuilder } from '@angular/forms';
import { FirebaseService } from 'src/app/services/firebase.service';
import { Output, EventEmitter } from '@angular/core';
import { PlacesService } from 'src/app/services/places.service';

@Component({
  selector: 'app-signup-form',
  templateUrl: './signup-form.component.html',
  styleUrls: ['./signup-form.component.scss'],
})
export class SignupFormComponent implements OnInit {
  protected showPassword: boolean = false;
  protected showConfirmPassword: boolean = false;
  protected signupForm!: FormGroup;
  @Output() changheTabIndex = new EventEmitter<number>();

  constructor(
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private firebaseService: FirebaseService,
    private placesService: PlacesService
  ) {}

  ngOnInit(): void {
    this.buildLoginForm();
  }

  changeTab() {
    this.changheTabIndex.emit(0);
  }

  buildLoginForm() {
    this.signupForm = this.formBuilder.group({
      name: ['', [Validators.required]],
      email: ['', [Validators.email, Validators.required]],
      password: [
        '',
        [
          Validators.required,
          Validators.minLength(8),
          Validators.maxLength(36),
        ],
      ],
      confirmPassword: ['', [Validators.required, this.passwordMatch()]],
    });
  }

  get nameController() {
    return this.signupForm.controls['name'];
  }

  get emailController() {
    return this.signupForm.controls['email'];
  }

  get passwordControl() {
    return this.signupForm.controls['password'];
  }

  get confirmPasswordControl() {
    return this.signupForm.controls['confirmPassword'];
  }

  private cleanForm() {
    this.signupForm.reset();
  }

  passwordMatch(): ValidatorFn {
    return (control: AbstractControl) => {
      const passwordValue = this.signupForm?.controls['password'].value ?? '';
      const confirmPasswordCOntrol = control.value;

      if (passwordValue === confirmPasswordCOntrol) return null;

      return { passwordMismatchError: true };
    };
  }

  submitForm() {
    const { name, email, password } = this.signupForm.value;
    const fcmtoken = this.firebaseService.fcmToken;
    const long: number = this.placesService.useLocation[0];
    const lat: number = this.placesService.useLocation[1];

    const newUser = {
      name,
      email,
      password,
      lat,
      long,
      fcmtoken,
    };

    this.authService.signup(newUser).subscribe({
      next: (res) => {
        console.log(res);
        this.changheTabIndex.emit(0);
        this.cleanForm();
      },
      error: (err) => {
        console.error(err);
        this.cleanForm();
      },
    });
  }
}
