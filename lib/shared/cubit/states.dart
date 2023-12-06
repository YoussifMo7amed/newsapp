abstract class Newsstates {}

class NewsInitialState extends Newsstates{}

class BottomNavBarState extends Newsstates{}

class NewsGetBusinessLoadingstate extends Newsstates{}

class NewsGetBusinessSucssesstate extends Newsstates{}

class NewsGetBusinessErrorstate extends Newsstates{

  final String Error;

  NewsGetBusinessErrorstate(this.Error);
}

class NewsGetGeneralLoadingstate extends Newsstates{}

class NewsGetGeneralSucssesstate extends Newsstates{}

class NewsGetGeneralErrorstate extends Newsstates{

  final String Error;

  NewsGetGeneralErrorstate(this.Error);
}

class NewsGetSportsLoadingstate extends Newsstates{}

class NewsGetSportsSucssesstate extends Newsstates{}

class NewsGetSportsErrorstate extends Newsstates{

  final String Error;

  NewsGetSportsErrorstate(this.Error);
}

class NewsGetSearchLoadingstate extends Newsstates{}

class NewsGetSearchSucssesstate extends Newsstates{}

class NewsGetSearchErrorstate extends Newsstates{

  final String Error;

  NewsGetSearchErrorstate(this.Error);
}