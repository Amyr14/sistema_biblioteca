import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ApiService } from '../shared/api.service';

@Component({
  selector: 'app-cadastrar-livros',
  templateUrl: './cadastrar-livros.component.html',
  styleUrls: ['./cadastrar-livros.component.css']
})

export class CadastrarLivrosComponent {

  form: FormGroup;

  constructor(private formBuilder: FormBuilder, private service: ApiService) {
    this.form = this.formBuilder.group({
      titulo: [null],
      editora: [null],
      isbn: [null],
      autores: [null],
    })
  }

  onSubmit() {
    const funcionario = localStorage.getItem("dados")
    if (funcionario) {
      this.form.value["autores"] = this.form.value["autores"].split(",")
      this.form.value["id_funcionario"] = JSON.parse(funcionario)[0].id_funcionario
      this.service.cadastrarLivro(this.form.value).subscribe(result => console.log(result))
      console.log(this.form.value)
    }
  }

}
