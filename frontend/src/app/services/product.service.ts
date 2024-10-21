import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Product } from '../common/product';
import { ProductCategory } from '../common/product-category';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private baseUrl = environment.zihorshopApiUrl + '/products';

  private categoryUrl = environment.zihorshopApiUrl + '/product-category';

  constructor(private httpClient: HttpClient) {}

  getProduct(theProductId: number): Observable<Product> {
    // need the build URL based on product id
    const productUrl = `${this.baseUrl}/${theProductId}`;

    return this.httpClient.get<Product>(productUrl);
  }

  getProductListPaginate(thePage: number,
                        thePageSize: number,
                        theCategoryId: number): Observable<GetResponseProducts> {

    const searchUrl = `${this.baseUrl}/search/findByCategoryId?id=${theCategoryId}`
                    + `&page=${thePage}&size=${thePageSize}`;
                    
    console.log(`Getting products from - ${searchUrl}`);

    return this.httpClient.get<GetResponseProducts>(searchUrl);
  }

  getProductList(theCategoryId: number): Observable<Product[]> {

    const searchUrl = `${this.baseUrl}/search/findByCategoryId?id=${theCategoryId}`;
    
    return this.getProducts(searchUrl);
  }

  searchProducts(theKeyword: string): Observable<Product[]>  {
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}`;

    return this.getProducts(searchUrl);
  }

  private getProducts(searchUrl: string): Observable<Product[]> {
    return this.httpClient.get<GetResponseProducts>(searchUrl).pipe(
      map(response => response._embedded.products)
    );
  }
  searchProductsPaginate(thePage: number,
                          thePageSize: number,
                          theKeyword: string): Observable<GetResponseProducts> {

    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}`
                      + `&page=${thePage}&size=${thePageSize}`;

    return this.httpClient.get<GetResponseProducts>(searchUrl);
    }
    
      getProductCategories(): Observable<ProductCategory[]> {
        return this.httpClient.get<GetResponseProductCategory>(this.categoryUrl).pipe(
          map(response => response._embedded.productCategory)
        );
  }

}

interface GetResponseProducts {
  _embedded: {
    products: Product[];
  }
  page: number,
  totalElements: number,
  totalPages: number,
  numbers: number
}

interface GetResponseProductCategory {
  _embedded: {
    productCategory: ProductCategory[];
  }
}
