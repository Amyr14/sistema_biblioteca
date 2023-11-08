import { Component } from '@angular/core';
import { ApiFuncionariosService } from '../services/api-funcionarios.service';
import { Observable } from "rxjs";
import { Usuario } from '../models/usuario';


@Component({
  selector: 'app-consulta-usuario',
  templateUrl: './consulta-usuario.component.html',
  styleUrls: ['./consulta-usuario.component.css']
})

export class ConsultaUsuarioComponent {
  listaUsuarios: Observable<Usuario[]>;
  displayedColumns: string[] = ["nome", "cpf", "email", "endereco", "id_categoria", "telefones"]

  constructor(private service: ApiFuncionariosService) {
    this.listaUsuarios = service.listarUsuarios()
  }
}
