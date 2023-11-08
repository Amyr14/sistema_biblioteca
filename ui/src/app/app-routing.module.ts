import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { FuncionariosComponent } from './funcionarios/funcionarios.component';

const routes: Routes = [
  { path: '', component: LoginComponent },
  { path: 'funcionarios', component: FuncionariosComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
