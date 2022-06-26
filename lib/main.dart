import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ayo_bugar/data/playlist_repository.dart';
import 'package:simple_ayo_bugar/routes/route_info_parser.dart';
import 'package:simple_ayo_bugar/routes/router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final _routeInformationParser = ABRouteInformationParser();
  late final _routerDelegate = ABRouterDelegate();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: PlayListRepository(),),
      ],
      child: MaterialApp.router(
        title: "Ayo Bugar",
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}