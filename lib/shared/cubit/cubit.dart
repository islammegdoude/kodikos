import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../network/local/cashe_helper.dart';
import '../network/remot/dio_helper.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 4;
  // List<Widget> screens = [
  //   ProfileScreen(),
  //   OrdersScreen(),
  //   CardScreen(),
  //   FavoritesScreen(),
  //   HomeScreen(),
  // ];


  // void changeBottomNavBar(index) {
  //   currentIndex = index;
  //   if (currentIndex == 0) {
  //     getProfile();
  //   }
  //   if (currentIndex == 1) {
  //     getAllPendingPurchases();
  //   }
  //   if (currentIndex == 2) {
  //     getCart();
  //   }
  //   if (currentIndex == 3) {
  //     getFavorites();
  //   }
  //   if (currentIndex == 4) {
  //     getAllProducts();
  //     getAllCategories();
  //   }
  //   emit(ShopChangeNavBarState());
  // }

//   //////// get profile ///////
//   UserResponseModel? profileModel;
//   void getProfile() {
//     emit(ShopLoadingProfileState());
//     //profileModel = null; 
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.postData(
//       url: PROFILE,
//       data: null,
//       token: token!,
//     ).then((value) {
//       profileModel = UserResponseModel.fromJson(value.data);
//       emit(ShopSuccessProfileState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorProfileState());
//     });
//   }

//     /////// get all products ///////
//   AllProductsModel? allProductsModel;
//   void getAllProducts() {
//     emit(ShopLoadingHomeDataState());
//     allProductsModel = null;
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.getData(
//       url: GET_ALL_PRODUCTS_ACTIVE,
//       query: null,
//       token: token!,
//     ).then((value) {
//       allProductsModel = AllProductsModel.fromJson(value.data) ;
      
//       emit(ShopSuccessHomeDataState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorHomeDataState());
//     });
//   }

//   ///// get all categories ////////
//   CategoriesModel? allCategoriessModel;
//   void getAllCategories() {
//     emit(ShopLoadingCategoriesState());
//     allCategoriessModel = null;
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.getData(
//       url: GET_ALL_CATEGORIES,
//       query: null,
//       token: token!,
//     ).then((value) {
      
//       allCategoriessModel = CategoriesModel.fromJson(value.data) ;
//       emit(ShopSuccessCategoriesState(allCategoriessModel));
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorCategoriesState());
//     });
//   }
 
//   /////// products by category ///////
//   ProductsCategoryModel? productsCategoryModel;
//   void getProductsByCategory(String? categoryId) {
//     emit(ShopLoadingProductByCategoryState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.getData(
//       url: GET_PRODUCT_BY_CATEGORY_ADMIN+categoryId!,
//       query: null,
//       token: token!,
//     ).then((value) {
//       productsCategoryModel = ProductsCategoryModel.fromJson(value.data) ;
//       print(value.data);
      
//       emit(ShopSuccessProductByCategoryState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorProductByCategoryState());
//     });
//   }

// ////// get all Pending purchases //////

//   PurchasesModel? pendingPurchasesModel;
//   void getAllPendingPurchases() {
//     emit(ShopLoadingAllPendingPurchasesState());
//     pendingPurchasesModel = null;
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.getData(
//       url: GET_ALL_PURCHASES_USER,
//       query: null,
//       token: token!,
//     ).then((value) {
     
//       pendingPurchasesModel = PurchasesModel.fromJson(value.data);
      
//       emit(ShopSuccessAllPendingPurchasesState(pendingPurchasesModel));
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorAllPendingPurchasesState());
//     });
//   }


//  ///// search ///////
//   ProductsCategoryModel? searchModel;
//   void search(String text){
//     emit(ShopLoadingSearchState());
//     searchModel = null;
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.getData(
//       url: SEARCH_PRODUCT,
//       query: {
//         'query': text,
//       },
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       searchModel = ProductsCategoryModel.fromJson(value.data);
//       emit(ShopSuccessSearchState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorSearchState());
//     });
//   }


//   ///// add product to cart ///////
//   void addProductToCart({required String productId, required int quantity}) {
//     emit(ShopLoadingAddToCartState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.postData(
//       url: ADD_CART,
//       data: {
//         'productId': productId,
//         'quantity': quantity,
//       },
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       //searchModel = ProductsCategoryModel.fromJson(value.data);
//       emit(ShopSuccessAddToCartState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorAddToCartState());
//     });
//   }

//   //// get cart /////
  
//   CartResponse? cartModel;
//   double totalPriceInCard = 0 ;
//   void getCart() {
//     emit(ShopLoadingGetCartState());
//     cartModel = null;
//     //int innactive;
//     totalPriceInCard= 0;
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.postData(
//       url: GET_ALL_CART,
//       data: null,
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       cartModel = CartResponse.fromJson(value.data);
//       for (var element in cartModel!.cart.items) {
//         totalPriceInCard += element.product.price * element.quantity;
//       }

//       emit(ShopSuccessGetCartState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorGetCartState());
//     });
//   }


//   ///// remove product from cart ///////
//   void removeProductFromCart({required String productId}) {
//     emit(ShopLoadingDeleteProductFromCartState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.postData(
//       url: REMOVE_CART,
//       data: {
//         'productId': productId,
//       },
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       emit(ShopSuccessDeleteProductFromCartState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorDeleteProductFromCartState());
//     });
//   }

//   ///// create purchase ///////
//   void createPurchase(){
//     emit(ShopLoadingCreatePurchaseState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.postData(
//       url: CREATE_PURCHASE,
//       data: null,
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       emit(ShopSuccessCreatePurchaseState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorCreatePurchaseState());
//     });
//   }

//   ///// remove all product from cart ///////
//   void removeAllProductFromCart() {
//     emit(ShopLoadingDeleteAllProductFromCartState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.postData(
//       url: REMOVE_CARTS,
//       data: null,
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       getCart();
//       emit(ShopSuccessDeleteAllProductFromCartState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorDeleteAllProductFromCartState());
//     });
//   }

//   ////// get favorites ///////
//   FavoritesResponse? favoritesModel;
//   void getFavorites(){
//     emit(ShopLoadingGetFavoritesState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.getData(
//       url: GET_ALL_FAVORITES,
//       query: null,
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       favoritesModel = FavoritesResponse.fromJson(value.data);
//       emit(ShopSuccessGetFavoritesState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorGetFavoritesState());
//     });
//   }

//   ///// add to favorites ///////
//   void addToFavorite(String productId){
//     emit(ShopLoadingAddToFavoritesState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.putData(
//       url: ADD_FAVORITE+productId,
//       data: null,
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       favoritesModel = FavoritesResponse.fromJson(value.data);
//       emit(ShopSuccessAddToFavoritesState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorAddToFavoritesState());
//     });
//   }

//   ///// remove from favorites ///////
//   void deleteToFavorite(String productId){
//     emit(ShopLoadingRemoveFromFavoritesState());
//     String? token = CachHelper.getData(key: 'token');
//     print(token);
//     DioHelper.putData(
//       url: REMOVE_FAVORITE+productId,
//       data: null,
//       token: token!,
//     ).then((value) {
//       print(value.data);
//       favoritesModel = FavoritesResponse.fromJson(value.data);
//       emit(ShopSuccessRemoveFromFavoritesState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ShopErrorRemoveFromFavoritesState());
//     });
//   }

}
