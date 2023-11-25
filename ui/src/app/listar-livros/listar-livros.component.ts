import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { Livro } from '../shared/models/livro';
import { ApiService } from '../shared/api.service';

@Component({
  selector: 'app-listar-livros',
  templateUrl: './listar-livros.component.html',
  styleUrls: ['./listar-livros.component.css']
})
export class ListarLivrosComponent {

  listaVazia = true;
  listaLivros: Observable<Livro[]>;
  displayedColumns: string[] = ["titulo", "editora", "autores", "id_funcionario"]

  constructor(private service: ApiService) {
    const listaLivros = service.listarLivros()
    this.listaLivros = listaLivros

    // checa se há algum livro na lista
    listaLivros.subscribe({
      next: (livros) => {
        console.log(livros[0])
        if (livros[0]) {
          this.listaVazia = false
        }
      }
    })
  }
}