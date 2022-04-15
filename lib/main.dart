import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}
