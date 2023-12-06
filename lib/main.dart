import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/Newslayout.dart';
import 'package:newsapp/shared/components/constants.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/network/remote.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getgeneral()..getbusiness()..getsports(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Newslayout()
      ),
    );
  }
}
