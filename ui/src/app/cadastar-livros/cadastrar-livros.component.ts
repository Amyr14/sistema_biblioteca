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
    console.log(this.form.value)
    this.form.value["autores"] = this.form.value["autores"].split(",")
    this.form.value["id_funcionario"] = localStorage['id']
    this.service.cadastrarLivro(this.form.value).subscribe(result => console.log(result))
  }

}
