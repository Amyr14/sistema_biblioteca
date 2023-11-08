import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CadastroFuncionarioComponent } from './cadastro-funcionario/cadastro-funcionario.component';
import { CadastroUsuarioComponent } from './cadastro-usuario/cadastro-usuario.component';
import { ConsultaFuncionarioComponent } from './consulta-funcionario/consulta-funcionario.component';
import { ConsultaUsuarioComponent } from './consulta-usuario/consulta-usuario.component';
import { IndexComponent } from './index/index.component';

const routes: Routes = [
  { path: '', component: IndexComponent },
  { path: 'consultarFuncionario', component: ConsultaFuncionarioComponent, outlet: "funcionarios"},
  { path: 'cadastrarFuncionario', component: CadastroFuncionarioComponent, outlet: "funcionarios" },
  { path: 'consultarUsuario', component: ConsultaUsuarioComponent, outlet: "funcionarios" },
  { path: "cadastrarUsuario", component: CadastroUsuarioComponent, outlet: "funcionarios" }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})

export class FuncionariosRoutingModule { }
