import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Funcionario } from './models/funcionario';
import { Usuario } from './models/usuario';
import { Livro } from './models/livro'
@Injectable({
  providedIn: 'root'
})
export class ApiService {


  // TODO carregar de um .env
  private API_BASE = "http://127.0.0.1:3000/api"

  constructor(private http: HttpClient) { }

  // metodos de funcionarios
  listarFuncionarios() {
    return this.http.get<Funcionario[]>(this.API_BASE + "/funcionarios")
  }

  cadastrarFuncionario(data: Funcionario) {
    return this.http.post<Funcionario>(this.API_BASE + "/funcionarios", data);
  }

  // metodos de usuarios
  listarUsuarios() {
    return this.http.get<Usuario[]>(this.API_BASE + "/usuarios")
  }

  cadastrarUsuarios(data: Usuario) {
    return this.http.post<Usuario>(this.API_BASE + "/ususarios", data)
  }

  // metodo de livros

  listarLivros() {
    return this.http.get<Livro[]>(this.API_BASE + "/livros")
  }

  cadastrarLivro(data: Livro) {
    return this.http.post<Livro>(this.API_BASE + "/livros", data)
  }

  // 

}
