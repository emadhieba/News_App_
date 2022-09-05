import 'package:bloc/bloc.dart';
import 'package:datae_base/layout/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCubit extends Cubit<NewsStates>{
  NewCubit(): super(NewsInitialState());
  static NewCubit get(context) => BlocProvider.of(context);
  
}