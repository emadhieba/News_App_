import 'package:bloc/bloc.dart';
import 'package:datae_base/shard/states/shard_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/states.dart';
import '../network/remote/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get (context) => BlocProvider.of(context);
  bool isDark = false;

  void changeMode({ bool? darkMode})
  {
    if(darkMode != null){
      isDark=darkMode;
      emit(AppChangeModeState());
    }else{
      isDark = !isDark;
      CacheHelper.putBool(key: 'isDark', value: isDark).then((value)  {
        emit(AppChangeModeState());
      });
    }

  }
}