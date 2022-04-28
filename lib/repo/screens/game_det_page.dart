import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../models/data_model.dart';
import '../../static_val/my_static_values.dart';

class GameDetailPage extends StatelessWidget {
  final DataModel dataModel;
  const GameDetailPage({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        centerTitle: true,
        title: const Text(
          "Game Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: double.infinity,
              fit: BoxFit.fitWidth,
              image: NetworkImage(dataModel.image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          dataModel.title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      if (dataModel.worth != "N/A")
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.orange[900],
                            borderRadius:
                                BorderRadius.circular(MyStaticValues.myRadius),
                          ),
                          child: Text(
                            dataModel.worth,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Available in: " + dataModel.platforms,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Game Description",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dataModel.description,
                    style: const TextStyle(
                        // fontWeight: FontWeight.w,
                        ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Steps to get it",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    dataModel.instructions,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      bottomButtons(
                          "Open in Gamepower", dataModel.gamerpower_url),
                      const SizedBox(
                        width: 10,
                      ),
                      bottomButtons("Get the game", dataModel.open_giveaway_url)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomButtons(String buttonText, String url) {
    return Flexible(
      child: InkWell(
        onTap: () {
          launch(url);
        },
        child: Container(
          width: double.infinity,
          height: 79,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange[900],
            borderRadius: BorderRadius.circular(MyStaticValues.myRadius),
          ),
          child: Center(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
