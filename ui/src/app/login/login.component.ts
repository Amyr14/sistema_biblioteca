import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms'
import { ApiService } from '../shared/api.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  form: FormGroup;

  constructor(private formBuilder: FormBuilder, private service: ApiService) {
    this.form = this.formBuilder.group({
      cpf: [null],
      senha: [null],
    })
  }

  onSubmit() {
    
  }
  
}
