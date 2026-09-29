import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woo/presentation/screens/pages/slashscreens/startup_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:woo/themes/theme.dart';


Future<void> main() async {
  // Nécessaire si on utilise du code asynchrone avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Demande d'autorisations avant d'afficher l'app (optionnel)
  await requestPermissions();

  // Mode UI (immersive sticky) — appel avant runApp possible
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

Future<void> requestPermissions() async {
  if (await Permission.microphone.request().isGranted) {
    print('Microphone access granted');
  } else {
    print('Microphone access denied');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Woo',
      theme: lightMode,
      darkTheme: darkMode,
      // Suit le thème système : bascule automatique quand l'utilisateur change le thème du téléphone
      themeMode: ThemeMode.system,
      home:  StartupScreen(),
    );
  }
}
