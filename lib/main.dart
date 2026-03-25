import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instituto_braziel/pages/_auth_check.dart';
import 'package:instituto_braziel/pages/_home.dart';
import 'package:instituto_braziel/pages/_profile.dart';
import 'package:instituto_braziel/pages/_subject.dart';
import 'package:instituto_braziel/pages/_subjects.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:instituto_braziel/pages/_summary_payment.dart';
import 'package:instituto_braziel/services/auth_service.dart';
import 'package:instituto_braziel/services/users_service.dart';
import 'package:provider/provider.dart';
import 'pages/_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyB7IcjOhirFBVlTHWf873iJejPhrIr6Yj8",
        authDomain: "intituto-braziel.firebaseapp.com",
        projectId: "intituto-braziel",
        storageBucket: "intituto-braziel.firebasestorage.app",
        messagingSenderId: "879596766924",
        appId: "1:879596766924:web:bdee7326937b06ae4fa469",
        measurementId: "G-803KH0JH0R",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          lazy: false,
          create: (_) => AuthService(),
        ),
        ProxyProvider<AuthService, UsersService>(
          update: (_, authService, __) =>
              UsersService(authService: authService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Instituto Braziel',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6F0606)),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('pt', 'BR'), // Portuguese
      ],
      routes: {
        '/': (context) => const AuthCheck(),
        '/login': (context) => const Login(),
        'home': (context) => const Home(),
        'profile': (context) => const Profile(),
        'subjects': (context) => const Subjects(),
        'subject': (context) => const Subject(),
        'summary_payment': (context) => const SummaryPayment(),
      },
    );
  }
}
