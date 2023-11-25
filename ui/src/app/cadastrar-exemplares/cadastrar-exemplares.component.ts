import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ApiService } from '../shared/api.service';
import { Observable, map, startWith } from 'rxjs';

@Component({
  selector: 'app-cadastrar-exemplares',
  templateUrl: './cadastrar-exemplares.component.html',
  styleUrls: ['./cadastrar-exemplares.component.css']
})
export class CadastrarExemplaresComponent implements OnInit {

  formControl = new FormControl()
  form: FormGroup;
  // lista de titulos de livros
  options: string[] = [];
  filteredOptions: Observable<string[]>|undefined;

  constructor(private formBuilder: FormBuilder, private service: ApiService) {
    this.form = this.formBuilder.group({
      livros: [null],
      num_exemplar: [null],
      colecao: [null],
    })

    service.listarLivros().subscribe((livros) => {
      livros.forEach((livro) => {
        this.options.push(livro.titulo)
      })
    })
    
    console.log("construtor")
    console.log(this.options)
  }
  
  ngOnInit(): void {
    this.filteredOptions = this.formControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value || '')),
    );
    console.log("ngOnInit")
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();
    return this.options.filter(option => option.toLowerCase().includes(filterValue));
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
