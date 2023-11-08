import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms'
import { ApiService } from '../shared/api.service';

@Component({
  selector: 'app-cadastar-funcionarios',
  templateUrl: './cadastar-funcionarios.component.html',
  styleUrls: ['./cadastar-funcionarios.component.css']
})

export class CadastarFuncionariosComponent {

  form: FormGroup;

  constructor(private formBuilder: FormBuilder, private service: ApiService) {
    this.form = this.formBuilder.group({
      nome: [null],
      cpf: [null],
      email: [null],
      telefones: [null],
      tipo_funcionario: [null],
    })
  }

  onSubmit() {
    this.form.value["senha"] = crypto.randomUUID()
    this.form.value["telefones"] = this.form.value["telefones"].split(",")
    console.log(this.form.value)
    this.service.cadastrarFuncionario(this.form.value).subscribe(result => console.log(result))
  }
}
