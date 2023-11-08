import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastarFuncionariosComponent } from './cadastar-funcionarios.component';

describe('CadastarFuncionariosComponent', () => {
  let component: CadastarFuncionariosComponent;
  let fixture: ComponentFixture<CadastarFuncionariosComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CadastarFuncionariosComponent]
    });
    fixture = TestBed.createComponent(CadastarFuncionariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
