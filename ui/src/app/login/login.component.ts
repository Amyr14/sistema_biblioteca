import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ApiService } from '../shared/api.service';

import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  form: FormGroup;

  constructor(private formBuilder: FormBuilder, private service: ApiService, private router: Router) {
    this.form = this.formBuilder.group({
      cpf: [null],
      senha: [null],
    })
  }

  onSubmit() {
    this.service.login(this.form.value).subscribe(loginResponse => {
      // checa se é um usuario ou funcionario, pede suas informações e redireciona
      // se é nulo é pq não exist
      if (loginResponse) {

        if (Object.keys(loginResponse)[0] == "id_usuario") {

          console.log(loginResponse)
          this.service.listarUsuariosId(loginResponse.id_usuario).subscribe(res => {
            localStorage["tipo"] = "usuario"
            localStorage["dados"] = res
            this.router.navigate(["/usuarios"])
          })

        } else {

          this.service.listarFuncionarioId(loginResponse.id_funcionario).subscribe(res => {
            // localStorage["tipo"] = "usuario"
            // localStorage["dados"] = res
            localStorage.setItem("tipo", "usuario")
            localStorage.setItem("dados", JSON.stringify(res))
            this.router.navigate(["/funcionarios"])
          })

        }

      } else {
        alert("Usuário ou Senha Inválidos")
      }
    })
  }

  mandarEmail() {
    const cpf = prompt("Entre com seu CPF")
    alert("Nada foi feito! Porém o endpoint da API funciona")
  }

}
