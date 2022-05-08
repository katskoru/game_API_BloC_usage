import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_api_using_bloc/repo/screens/game_det_screen.dart';
import 'package:game_api_using_bloc/static_val/my_static_values.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../models/data_model.dart';

import '../../theme/cubit/theme_cubit.dart';

import '../bloc/game_data_bloc.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        centerTitle: true,
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Switch(
                  activeColor: Colors.black,
                  value: state.isDarkThemeOn,
                  onChanged: (newValue) {
                    context.read<ThemeCubit>().toggleSwitch(newValue);
                  });
            },
          ),
        ],
        title: const Text("Game Library"),
      ),
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return const CircularProgressIndicator();
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return buildGameModel(state.apiResult);
          } else if (state is GameDataErrorState) {
            return const Center(
              child: Text("Something went wrong!"),
            );
          }
          return const Text("Error");
        },
      ),
    );
  }

  Widget buildGameModel(List<DataModel> apiResult) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final DataModel dataModel = apiResult[index];

        Widget glassWidget = GlassmorphicContainer(
          width: MediaQuery.of(context).size.width / 1.05,
          height: 90,
          border: 0,
          borderRadius: MyStaticValues.myRadius,
          blur: 20,
          alignment: Alignment.bottomCenter,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.1),
              const Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
              0.1,
              1,
            ],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      dataModel.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Platforms: " + dataModel.platforms,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(MyStaticValues.myRadius),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameDetailScreen(
                  dataModel: dataModel,
                );
              }));
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(MyStaticValues.myRadius),
                    child: Image(
                      height: 230,
                      width: MediaQuery.of(context).size.width / 1.05,
                      fit: BoxFit.fill,
                      image: NetworkImage(dataModel.image),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: glassWidget,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
