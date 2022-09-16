import 'package:datae_base/layout/cubit.dart';
import 'package:datae_base/layout/states.dart';
import 'package:datae_base/modules/sarche/searche.dart';
import 'package:datae_base/shard/cubit/shard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shard/components/components.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context, state){
        var cubit = NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(

                icon:  Icon(Icons.search),
                onPressed: ()
                { navigateTo(context,SearchScreen()); },),


              IconButton(
                icon:  Icon(Icons.mode_night,),
                onPressed: () {  AppCubit.get(context).changeMode(); },),
            ],

          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavbar(index);
            },
            items:cubit.bottomItems,
          ),
        );
      },
    );
  }
}
