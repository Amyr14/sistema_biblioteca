import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { CadastroFuncionarioComponent } from './cadastro-funcionario/cadastro-funcionario.component';
import { ConsultaFuncionarioComponent } from './consulta-funcionario/consulta-funcionario.component';
import { FuncionariosRoutingModule } from './funcionarios-routing.module';
import { CadastroUsuarioComponent } from './cadastro-usuario/cadastro-usuario.component';
import { ConsultaUsuarioComponent } from './consulta-usuario/consulta-usuario.component';

import { ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatTableModule } from '@angular/material/table';
import { MatListModule } from '@angular/material/list';
import { MatToolbarModule } from '@angular/material/toolbar'
import { MatIconModule } from '@angular/material/icon';
import { IndexComponent } from './index/index.component'

@NgModule({
  declarations: [
    CadastroFuncionarioComponent,
    ConsultaFuncionarioComponent,
    CadastroUsuarioComponent,
    ConsultaUsuarioComponent,
    IndexComponent,
  ],
  imports: [
    CommonModule,
    FuncionariosRoutingModule,
    MatTableModule,
    MatSidenavModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    ReactiveFormsModule,
    MatCardModule,
    MatButtonModule,
    MatListModule,
    MatToolbarModule,
    MatIconModule
  ]
})
export class FuncionariosModule { }
