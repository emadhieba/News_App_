import 'package:bloc/bloc.dart';
import 'package:datae_base/layout/states.dart';
import 'package:datae_base/models/busniess/business_screen.dart';
import 'package:datae_base/models/science/science_screen.dart';
import 'package:datae_base/models/sports/sports_screen.dart';

import 'package:datae_base/shard/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCubit extends Cubit<NewsStates>{
  NewCubit(): super(NewsInitialState());
  static NewCubit get(context) => BlocProvider.of(context);
 int currentIndex= 0;

 List<BottomNavigationBarItem> bottomItems = const [
  BottomNavigationBarItem(
     icon:Icon(Icons.business,),
   label:  'Business',

     ),

   BottomNavigationBarItem(
  icon:Icon(Icons.sports,),
  label:  'sports',

  ),

   BottomNavigationBarItem(
     icon:Icon(Icons.science,),
     label:  'science',

   ),
   //BottomNavigationBarItem(
   //      icon:Icon(Icons.settings),
   //      label:  'Settings',
   //
   //    ),
  ];
 List<Widget> screens =  [
   BusinessScreen(),
   ScienceScreen(),
   SportsScreen(),
   //SettingScreen(),
 ];
 void changeBottomNavbar (int index){
   currentIndex = index;
   if(index==1) {
     getSports();
   }
   if(index==2) {
     getScience();
   }
   emit(NewsBottomNavState());

 }
List<dynamic> business = [];
 void getBusiness(){
   emit(NewsGetBusinessLoadingState());

     DioHelper.getData(
       url: 'v2/top-headlines' ,
       query: {'country':'eg',
         'category':'business',
         'apiKey':'b1e7c825cc464ad6a36f009e5ba5d28f',
       },).then((value) {
       //print(value.data.toString());
       business = value.data['articles'];
       print(business[0]['title']);
       emit(NewsGetBusinessSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(NewsGetBusinessErrorState(error.toString()));
     });


 }

  List<dynamic> sports = [];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if (sports.length==0)
    {


      DioHelper.getData(
        url: 'v2/top-headlines' ,
        query: {'country':'eg',
          'category':'sports',
          'apiKey':'b1e7c825cc464ad6a36f009e5ba5d28f',
        },).then((value) {
        //print(value.data.toString());
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else{
      emit(NewsGetSportsSuccessState());
    }

  }
  List<dynamic> science = [];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    if (science.length==0){ DioHelper.getData(
      url: 'v2/top-headlines' ,
      query: {'country':'eg',
        'category':'science',
        'apiKey':'b1e7c825cc464ad6a36f009e5ba5d28f',
      },).then((value) {
      //print(value.data.toString());
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });}
    else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> search = [];
  void getSearch( String value ){
    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getData(
      url: 'v2/everything' ,
      query: {
        'q':'$value',
        'apiKey':'b1e7c825cc464ad6a36f009e5ba5d28f',
      },).then((value) {
      //print(value.data.toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }
  

}
//import 'package:dio/dio.dart';
// import 'package:flutter_app/modules/business/cubit/states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class BusinessCubit extends Cubit<BusinessStates>
// {
//   BusinessCubit() : super(BusinessInitialState());
//
//   static BusinessCubit get(context) => BlocProvider.of(context);
//
//   List articles = [];
//   List sports = [];
//
//   getBusiness() async
//   {
//     if(articles.length == 0)
//     {
//       emit(BusinessLoadingState());
//
//       Dio dio = Dio();
//       dio.options.baseUrl = 'http://newsapi.org/';
//
//       await dio.get(
//         'v2/top-headlines',
//         queryParameters: {
//           'country': 'eg',
//           'category': 'business',
//           'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
//         },
//       ).then((value) {
//         articles = value.data['articles'] as List;
//
//         emit(BusinessSuccessState());
//       }).catchError((e)
//       {
//         emit(BusinessErrorState(e.toString()));
//       });
//     }
//   }
//
//   getSports() async
//   {
//     if(sports.length == 0)
//     {
//       emit(BusinessLoadingState());
//
//       Dio dio = Dio();
//       dio.options.baseUrl = 'http://newsapi.org/';
//
//       await dio.get(
//         'v2/top-headlines',
//         queryParameters: {
//           'country': 'eg',
//           'category': 'sports',
//           'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
//         },
//       ).then((value) {
//         sports = value.data['articles'] as List;
//
//         emit(BusinessSuccessState());
//       }).catchError((e)
//       {
//         emit(BusinessErrorState(e.toString()));
//       });
//     }
//   }
// }
