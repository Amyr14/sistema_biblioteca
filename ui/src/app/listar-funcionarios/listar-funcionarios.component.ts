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

  listaVazia = true;
  listaFuncionarios: Observable<Funcionario[]>;
  displayedColumns: string[] = ["nome", "cpf", "email", "telefones", "tipo_funcionario"]

  constructor(private service: ApiService) {
    const listaFuncionarios = service.listarFuncionarios();
    this.listaFuncionarios = listaFuncionarios;
    
    // checa se há algum funcionário na lista
    listaFuncionarios.subscribe({
      next: (funcionarios) => {
        console.log(funcionarios[0])
        if (funcionarios[0]) {
          this.listaVazia = false
        }
      }
    })
  }

}