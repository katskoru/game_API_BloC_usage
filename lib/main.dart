import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_api_using_bloc/repo/bloc/game_data_bloc.dart';
import 'package:game_api_using_bloc/repo/games_repo.dart';
import 'package:game_api_using_bloc/repo/screens/landing_page.dart';
import 'package:game_api_using_bloc/theme/cubit/theme_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GameDataBloc>(
        create: (context) => GameDataBloc(GamesRepo()),
      ),
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.theme,
            home: const LandingPage());
      },
    );
  }
}
