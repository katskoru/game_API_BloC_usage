import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:game_api_using_bloc/theme/theme_data.dart';
import 'package:game_api_using_bloc/theme/cubit/theme_cubit.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkThemeOn: true));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));
}
