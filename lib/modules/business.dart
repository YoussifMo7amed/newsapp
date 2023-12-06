import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class businesspage extends StatelessWidget {
  const businesspage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return buildArtecleItem(cubit.business);
      },
    );
  }
}
