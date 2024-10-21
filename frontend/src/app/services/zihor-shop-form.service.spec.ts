import { TestBed } from '@angular/core/testing';

import { ZihorShopFormService } from './zihor-shop-form.service';

describe('ZihorShopFormService', () => {
  let service: ZihorShopFormService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ZihorShopFormService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
