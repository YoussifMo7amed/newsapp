import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business.dart';
import 'package:newsapp/modules/general.dart';
import 'package:newsapp/modules/sports.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/remote.dart';

class NewsCubit extends Cubit<Newsstates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> Screens = [
    generalpage(),
    businesspage(),
    sportspage(),
  ];
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
        ),
        label: 'genneral'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
  ];
  void changeIndex(Index) {
    currentIndex = Index;
    emit(BottomNavBarState());
  }

  List<dynamic>? general;

  void getgeneral() {
    if (general != null) {
      // Data has already been loaded, do not fetch again
      emit(NewsGetGeneralSucssesstate());
      return;
    }

    emit(NewsGetGeneralLoadingstate());

    DioHelper.getBoolean(url: 'v2/top-headlines', queries: {
      'country': 'us',
      'category': 'general',
      'apiKey': '4bab073e010b4ee18322e6221a75cc39',
    }).then((value) {
      // Filter out articles with null 'urlToImage'
      general = value.data['articles']
          ?.where((article) => article['urlToImage'] != null)
          .toList();

      print(general.toString());
      emit(NewsGetGeneralSucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetGeneralErrorstate(error));
    });
  }

  List<dynamic>? business;

  void getbusiness() {
    if (business != null) {
      // Data has already been loaded, do not fetch again
      emit(NewsGetBusinessSucssesstate());
      return;
    }

    emit(NewsGetBusinessLoadingstate());

    DioHelper.getBoolean(url: 'v2/top-headlines', queries: {
      'country': 'us',
      'category': 'business',
      'apiKey': '4bab073e010b4ee18322e6221a75cc39',
    }).then((value) {
      // Filter out articles with null 'urlToImage'
      business = value.data['articles']
          ?.where((article) => article['urlToImage'] != null)
          .toList();

      print(business.toString());
      emit(NewsGetBusinessSucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorstate(error));
    });
  }

  List<dynamic>? sports;

  void getsports() {
    if (business != null) {
      // Data has already been loaded, do not fetch again
      emit(NewsGetSportsSucssesstate());
      return;
    }

    emit(NewsGetSportsLoadingstate());

    DioHelper.getBoolean(url: 'v2/top-headlines', queries: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '4bab073e010b4ee18322e6221a75cc39',
    }).then((value) {
      // Filter out articles with null 'urlToImage'
      sports = value.data['articles']
          ?.where((article) => article['urlToImage'] != null)
          .toList();

      print(sports.toString());
      emit(NewsGetSportsSucssesstate());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorstate(error));
    });
  }
    List<dynamic> Search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingstate());
      DioHelper.getBoolean(
        url: 'v2/everything',
        queries: {
          'q':value,
          'apiKey': '4bab073e010b4ee18322e6221a75cc39',
        },
      ).then((value) {
        Search = value.data['articles'];
        print(Search[0]['title']);
        emit((NewsGetSearchSucssesstate()));
      }).catchError((Error) {
        print({Error.toString()});
        emit(NewsGetSearchErrorstate(Error));
      });
   
  }
}
