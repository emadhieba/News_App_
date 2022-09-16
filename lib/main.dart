
import 'package:datae_base/layout/cubit.dart';
import 'package:datae_base/shard/cubit/shard_cubit.dart';
import 'package:datae_base/shard/network/remote/cache_helper.dart';
import 'package:datae_base/shard/network/remote/dio_helper.dart';
import 'package:datae_base/shard/states/shard_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/cubit.dart';


import 'layout/news_home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyB;
  DioHelper.init();
 await CacheHelper.init();
 bool? isDark = CacheHelper.getBool(key: 'isDark');
  runApp( MyApp(isDark));
}
class MyApp extends StatelessWidget {

  final bool? isDark;
   MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(

      providers: [
        BlocProvider(create: (context)=>NewCubit()
          ..getBusiness()..getScience()..getSports()),
        BlocProvider(create: (context) => AppCubit()
          ..changeMode(
          darkMode: isDark,
        ),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: ( context, state) {},
        builder: (context,  state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color:Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('181818'),
              appBarTheme:  AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('181818'),
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: HexColor('181818'),
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  color:Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,

                ),
              ),
              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 30.0,
                backgroundColor: HexColor('181818'),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

            ),
            themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light ,
            home: Home(),
          );
        },

      ),
    );
  }
}
