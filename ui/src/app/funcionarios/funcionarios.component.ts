import { Component } from '@angular/core';

@Component({
  selector: 'app-funcionarios',
  templateUrl: './funcionarios.component.html',
  styleUrls: ['./funcionarios.component.css'],
})

export class FuncionariosComponent {

  window: string = 'cadastrarFuncionario';
  mudarComponente(newWindow: string) {
    this.window = newWindow;
  }
}