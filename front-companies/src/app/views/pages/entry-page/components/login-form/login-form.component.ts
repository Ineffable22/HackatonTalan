import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';
import { FirebaseService } from '../../../../../services/firebase.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.scss'],
})
export class LoginFormComponent implements OnInit {
  protected showPassword: boolean = false;
  protected loginForm!: FormGroup;

  constructor(
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private firebaseService: FirebaseService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.buildLoginForm();
  }

  get emailController() {
    return this.loginForm.controls['email'];
  }

  get passwordController() {
    return this.loginForm.controls['password'];
  }

  private cleanForm() {
    this.loginForm.reset();
  }

  buildLoginForm() {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      fcmtoken: [''],
    });
  }

  submitForm() {
    const user = this.loginForm.value;
    user.fcmtoken = this.firebaseService.fcmToken;

    console.log(user);

    this.authService.login(user).subscribe({
      next: (res) => {
        console.log(res);

        this.authService.verifyUserLogged(res);

        this.router.navigate(['/dashboard/home']);
      },
      error: (err: HttpErrorResponse) => {
        console.error(err);
        this.cleanForm();
      },
    });
  }
}
