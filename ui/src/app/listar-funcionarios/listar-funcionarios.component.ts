import { Component } from '@angular/core';
import { ApiService } from '../shared/api.service';
import { Observable } from 'rxjs';
import { Funcionario } from '../shared/models/funcionario';

@Component({
  selector: 'app-listar-funcionarios',
  templateUrl: './listar-funcionarios.component.html',
  styleUrls: ['./listar-funcionarios.component.css']
})
export class ListarFuncionariosComponent {

  listaFuncionarios: Observable<Funcionario[]>;
  displayedColumns: string[] = ["nome", "cpf", "email", "telefones", "tipo_funcionario"]

  constructor(private service: ApiService) {
    this.listaFuncionarios = service.listarFuncionarios()
  }

}