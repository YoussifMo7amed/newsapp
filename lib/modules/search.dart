
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/states.dart';

import '../shared/cubit/cubit.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
  
    return BlocConsumer<NewsCubit,Newsstates>(
      listener: (context, state) {
      },
      builder: (context, state) {
          var list =NewsCubit.get(context).Search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: dfaultFormField(
                  controller: controller,
                  type: TextInputType.text,
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  label: 'search',
                  prefix: Icons.search),
            ),
            Expanded(child: buildArtecleItem(list),),
          ],
        ),
      );
      },
    );
  }
}
