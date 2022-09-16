
import 'package:datae_base/layout/cubit.dart';
import 'package:datae_base/layout/states.dart';
import 'package:datae_base/shard/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewCubit.get(context).business;
        return articleBuilder(list,context);
      },
    );
  }
}
