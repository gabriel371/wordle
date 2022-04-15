import 'dart:async';

import 'package:flutter/material.dart';

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
    print(titleGuesses.length.toString() + ":" + titleColors.length.toString());
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 75.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
