const String BASE_URL = 'https://www.magicprodz.store';


////// USERS ROUTES //////
  
const String USER = '/users';

const String LOGIN = '/users/login';

const String REGISTER = '/users/register';

const String PROFILE = '/users/profile'; //send token return user

const String ACCEPTE_USER = '/users/accept/';

const String REFUSE_USER = '/users/refuse/';

const String GET_ALL_USERS = '/users/all';

const String GET_ALL_USERS_ACCEPTED = '/users/active';

const String GET_ALL_USERS_INACTIVE = '/users/inactive';

const String PUT_CHANGE_PASSWORD = '/users/confirmForgotPasswort';


////// PRODUCTS ROUTES //////

const String GET_ALL_PRODUCTS_ACTIVE = '/products/';

const String GET_ALL_PRODUCTS = '/products/getAll';

const String CREATE_PRODUCT = '/products/create';

const String UPDATE_PRODUCT = '/products/update/';

const String DELETE_PRODUCT = '/products/delete/';

const String GET_PRODUCT = '/products/product/';

const String GET_ALL_PRODDUCT_ACCEPTED = '/products/product/accepted';

const String GET_ALL_PRODDUCT_DELETED = '/products/product/deleted';

const String GET_PRODUCT_BY_CATEGORY_USER = '/products/product/user/category/';

const String GET_PRODUCT_BY_CATEGORY_ADMIN = '/products/product/user/category/';

const String SEARCH_PRODUCT = '/products/search';


////// CATEGORIES ROUTES //////

const String GET_ALL_CATEGORIES = '/category';

const String CREATE_CATEGORY = '/category/create';

const String UPDATE_CATEGORY = '/category/update/';

const String DELETE_CATEGORY = '/category/delete/';

const String GET_CATEGORY = '/category/get/';

////// PURCHASE ROUTES //////

const String GET_ALL_PURCHASES_USER = '/purchase/get';

const String GET_ALL_PURCHASES_ADMIN = '/purchase/getAll';

const String CREATE_PURCHASE = '/purchase/create';

const String ACCEPTE_PURCHASE = '/purchase/accept/';

const String REFUSE_PURCHASE = '/purchase/refuse/';

///// FAVORITES ROUTES //////


const String GET_ALL_FAVORITES = '/favourites/get';

const String ADD_FAVORITE = '/favourites/add/';

const String REMOVE_FAVORITE = '/favourites/delete/';

const String REMOVE_FAVORITES = '/favourites/delete';

///// CART ROUTES //////

const String GET_ALL_CART = '/cart/get';

const String ADD_CART = '/cart/add';

const String REMOVE_CART = '/cart/remove';

const String REMOVE_CARTS = '/cart/removeAll';

///// UPLOAD ROUTES //////

const String UPLOAD_IMAGE = '/uploads';

const String RECOVER_PASSWORD = '/users/forgotPassword';