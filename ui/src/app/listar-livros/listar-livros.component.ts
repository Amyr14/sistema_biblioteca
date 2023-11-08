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

  listaLivros: Observable<Livro[]>;
  displayedColumns: string[] = ["titulo", "editora", "autores", "id_funcionario"]

  constructor(private service: ApiService) {
    this.listaLivros = service.listarLivros()
  }
}