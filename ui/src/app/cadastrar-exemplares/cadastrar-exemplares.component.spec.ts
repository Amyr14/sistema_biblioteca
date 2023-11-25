import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastrarExemplaresComponent } from './cadastrar-exemplares.component';

describe('CadastrarExemplaresComponent', () => {
  let component: CadastrarExemplaresComponent;
  let fixture: ComponentFixture<CadastrarExemplaresComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CadastrarExemplaresComponent]
    });
    fixture = TestBed.createComponent(CadastrarExemplaresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
