abstract class AppStates{}

class AppInitialState extends AppStates{}


class AppChangeNavBarState extends AppStates {}

class ChengeModeState extends AppStates {}


/////// search ///////

class AppLoadingSearchState extends AppStates {}

class AppSuccessSearchState extends AppStates {}

class AppErrorSearchState extends AppStates {}


/////// all jobs ///////

class AppLoadingGetJobsState extends AppStates {}

class AppSuccessGetJobsState extends AppStates {}

class AppErrorGetJobsState extends AppStates {}


/////// apply job ///////

class AppLoadingApplyJobState extends AppStates {}

class AppSuccessApplyJobState extends AppStates {}

class AppErrorApplyJobState extends AppStates {}