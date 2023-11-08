import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Funcionario } from '../models/funcionario';
import { Usuario } from '../models/usuario';

@Injectable({
  providedIn: 'root'
})
export class ApiFuncionariosService {

  // TODO carregar de um .env
  private API_BASE = "http://127.0.0.1:3000/api"

  constructor(private http: HttpClient) {

  }

  listarFuncionarios() {
    return this.http.get<Funcionario[]>(this.API_BASE + "/funcionarios")
  }

  cadastrarFuncionario(data: Funcionario) {
    return this.http.post<Funcionario>(this.API_BASE + "/funcionarios", data);
  }

  listarUsuarios() {
    return this.http.get<Usuario[]>(this.API_BASE + "/usuarios")
  }

  cadastrarUsuarios(data: Usuario) {
    return this.http.post<Usuario>(this.API_BASE + "/ususarios", data)
  }

}