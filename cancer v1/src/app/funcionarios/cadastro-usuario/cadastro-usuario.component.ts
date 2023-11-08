import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms'
import { ApiFuncionariosService } from '../services/api-funcionarios.service';

@Component({
  selector: 'app-cadastro-usuario',
  templateUrl: './cadastro-usuario.component.html',
  styleUrls: ['./cadastro-usuario.component.css']
})
export class CadastroUsuarioComponent {

  form: FormGroup;

  constructor(private formBuilder: FormBuilder, private service: ApiFuncionariosService) {
    this.form = this.formBuilder.group({
      nome: [null],
      cpf: [null],
      email: [null],
      endereco: [null],
      id_categoria: [null],
      telefones: [null],
    })
  }

  onSubmit() {
    console.log(this.form.value)
    this.form.value["telefones"] = this.form.value["telefones"].split(",")
    this.service.cadastrarFuncionario(this.form.value).subscribe(result => console.log(result))
  }

}
