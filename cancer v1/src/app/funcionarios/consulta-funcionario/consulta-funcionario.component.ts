import { Component } from '@angular/core';
import { Funcionario } from '../models/funcionario';
import { ApiFuncionariosService } from '../services/api-funcionarios.service';
import { Observable } from "rxjs";

@Component({
  selector: 'app-consulta-funcionario',
  templateUrl: './consulta-funcionario.component.html',
  styleUrls: ['./consulta-funcionario.component.css']
})

export class ConsultaFuncionarioComponent {

  listaFuncionarios: Observable<Funcionario[]>;
  displayedColumns: string[] = ["nome", "cpf", "email", "telefones", "tipo_funcionario"]

  constructor(private service: ApiFuncionariosService) {
    this.listaFuncionarios = service.listarFuncionarios()
  }
}
