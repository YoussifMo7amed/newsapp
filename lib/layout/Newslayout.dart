import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class Newslayout extends StatelessWidget {
  const Newslayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
        listener: (context, state) {},
        builder: (context, state) {
        NewsCubit cubit=NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: const Text(
                "Newsly",
                style: TextStyle(fontSize: 35.0),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const Search() ,));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 40.0,
                  ),
                ),
              ],
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (Index) {
              cubit.changeIndex(Index);

            },
            ),
          );
        });
  }
}
