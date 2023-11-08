import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FuncionariosComponent } from './funcionarios/funcionarios.component';

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
import { LoginComponent } from './login/login.component';
import { CadastarFuncionariosComponent } from './cadastar-funcionarios/cadastar-funcionarios.component';
import { ListarFuncionariosComponent } from './listar-funcionarios/listar-funcionarios.component';
import { CadastrarLivrosComponent } from './cadastar-livros/cadastrar-livros.component';
import { ListarLivrosComponent } from './listar-livros/listar-livros.component';

@NgModule({
  declarations: [
    AppComponent,
    FuncionariosComponent,
    LoginComponent,
    CadastarFuncionariosComponent,
    ListarFuncionariosComponent,
    CadastrarLivrosComponent,
    ListarLivrosComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
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
    MatIconModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
