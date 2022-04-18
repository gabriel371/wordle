import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wordle/constants/colors.dart';

import '../../../data/default_data.dart';
import 'title_box.dart';

class HeaderTitle extends StatefulWidget {
  const HeaderTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  List<List<String>> titleGuesses = defaultTitleGuesses;
  List<List<Color>> titleColors = defaultTitleColors;

  int counter = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter++;
      });
      if (counter >= (titleGuesses.length)) {
        setState(() {
          counter = 0;
        });
        // timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          splashRadius: 20.0,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return const Dialog(backgroundColor: kBackgroundColor);
              },
            );
          },
          icon: const Icon(
            Icons.help_outline_outlined,
            color: kTextColor,
          ),
        ),
        Row(
          children: titleGuesses[counter]
              .asMap()
              .map((i, letter) {
                return MapEntry(
                  i,
                  TitleBox(
                    text: letter,
                    color: titleColors[counter][i],
                  ),
                );
              })
              .values
              .toList(),
        ),
        IconButton(
          splashRadius: 20.0,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return const Dialog(backgroundColor: kBackgroundColor);
              },
            );
          },
          icon: const Icon(
            Icons.history,
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
