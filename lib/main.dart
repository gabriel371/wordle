import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const App()));
}

var theme = darkTheme;

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    changeTheme();
  }

  void changeTheme() {
    var brightness = WidgetsBinding.instance!.window.platformBrightness;
    brightness == Brightness.dark ? theme = darkTheme : theme = lightTheme;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: theme,
      home: const HomePage(),
    );
  }
}
