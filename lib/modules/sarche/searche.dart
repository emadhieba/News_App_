//https://newsapi.org/v2/everything?q=tesla&apiKey=b1e7c825cc464ad6a36f009e5ba5d28f

import 'package:datae_base/layout/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/states.dart';
import '../../shard/components/components.dart';

class SearchScreen extends StatelessWidget {


 var searchController = TextEditingController();

  @override

  Widget build(BuildContext context)  {
    return BlocConsumer<NewCubit, NewsStates>(
      listener: ( context,  state) {  },
      builder: ( context, state) {
        var list = NewCubit.get(context).search;
        return Scaffold(

          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value )  {
                    NewCubit.get(context).getSearch(value);
                    },
                    label: 'Search',
                    validate: (String value){
                      if(value.isEmpty){
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    prefix: Icons.search,
                    ),
              ),
              Expanded(
                  child: articleBuilder(list, context,isSearch: true),
              ),

            ],
          ),
        );
      },

    );
  }
}
