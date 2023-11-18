const String BASE_URL = 'http://10.0.2.2:3000/api';


////// USER ROUTES //////
  
const String USER = '/users';

const String LOGIN = '/user/login';

const String REGISTER = '/user/register';

const String PROFILE = '/user/get-user'; //send token return user

const String PUT_CHANGE_PASSWORD = '/users/changePassword';

/////// JOB ROUTES //////
const String SEARCH_JOB = '/job/searchJob';

const String All_JOB = '/job/getJobs';

const String APPLY_JOB = '/job/applyJob';
////// CATEGORIES ROUTES //////

const String GET_ALL_CATEGORIES = '/category';

const String CREATE_CATEGORY = '/category/create';

const String UPDATE_CATEGORY = '/category/update/';

const String DELETE_CATEGORY = '/category/delete/';

const String GET_CATEGORY = '/category/get/';


const String UPLOAD_IMAGE = '/uploads';

const String RECOVER_PASSWORD = '/users/forgotPassword';