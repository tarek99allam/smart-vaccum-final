import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart vacuum'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "Info: -",
                  style: Constant.headLineTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'The vacuum cleaner robot has an important mission which is to sweep every accessible area in the entire environment avoiding obstac les. When the robot passes through an area position it will be cleaned and if not yet it remains unclean. This named the path planning of the coverage region task is in which the robot should sweep each accessible free area and avoid obstacles with an efficient trajectory',
                style: Constant.mediumTextStyle,
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "developers: -",
                  style: Constant.headLineTextStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  DevImage(name: "Tarek Aalam", imagePath: "img/tarek.jpeg"),
                  DevImage(name: "Nada Mousa", imagePath: "img/profile.jpeg"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  DevImage(
                      name: "Mona Elsha3er", imagePath: "img/profile.jpeg"),
                  DevImage(name: "Mona Elsa3ed", imagePath: "img/profile.jpeg"),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DevImage extends StatelessWidget {
  const DevImage({Key? key, required this.imagePath, required this.name})
      : super(key: key);
  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60.0,
          backgroundImage: AssetImage(
            imagePath,
          ),
          backgroundColor: Colors.transparent,
        ),
        Text(
          name,
          style: Constant.mediumTextStyle,
        )
      ],
    );
  }
}
