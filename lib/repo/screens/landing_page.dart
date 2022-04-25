import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game_data_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameDataBloc, GameDataState>(
      builder: (context, state) {
        if (state is GameDataInitialState) {
          context.read<GameDataBloc>().add(LoadGameDataEvent());
          return const CircularProgressIndicator();
        } else if (state is LoadingState) {
          return const CircularProgressIndicator();
        } else if (state is LoadedState) {
          return Text("Data is loaded");
        } else if (state is GameDataErrorState) {
          return Text("Something went wrong");
        }
        return const Text("Error");
      },
    );
  }
}
