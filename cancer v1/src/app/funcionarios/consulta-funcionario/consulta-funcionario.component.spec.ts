import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsultaFuncionarioComponent } from './consulta-funcionario.component';

describe('ConsultaFuncionarioComponent', () => {
  let component: ConsultaFuncionarioComponent;
  let fixture: ComponentFixture<ConsultaFuncionarioComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ConsultaFuncionarioComponent]
    });
    fixture = TestBed.createComponent(ConsultaFuncionarioComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
