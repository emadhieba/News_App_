
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:datae_base/layout/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/states.dart';
import '../../shard/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewCubit.get(context).science;
        return  articleBuilder(list,context);
      },
    );
  }
}