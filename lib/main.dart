import 'package:flutter/material.dart';
import 'package:gtpl/provider/home.dart';
import 'package:gtpl/provider/login.dart';
import 'package:gtpl/provider/plan_list.dart';
import 'package:gtpl/provider_callback/splash.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => PlanListProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: GlobalLoaderOverlay(
        overlayColor: Colors.white,
        overlayOpacity: 1.0,
        child: MaterialApp(
          title: 'GTPL Recharge',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color(0xff2058A5),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              color: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const Splash(),
        ),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  Future checkUser() async {
    await Future.delayed(const Duration(seconds: 2));
    await CallBackSplash().onDoneLoading(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Image.asset(
            'assets/icon.png',
          ),
        ),
      ),
    );
  }
}
