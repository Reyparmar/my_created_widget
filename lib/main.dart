import 'package:flutter/material.dart';
import 'package:my_created_widget/screen/custom_scrolling.dart';
import 'package:my_created_widget/utility/helper.dart';
import 'package:my_created_widget/widget/app_button.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [
    'Custom scrolling',
    'Show Toast',
  ];

  void onButtonTap(int index) {
    switch (list[index]) {
      case 'Custom scrolling':
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => const CustomScrolling(),
          ),
        );
        break;
      case 'Show Toast':
        Helper.showToast('Show Toast Testing');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Demo Widget And File',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // ignore: prefer_const_literals_to_create_immutables
            children: List.generate(
              list.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  onPressed: () => onButtonTap(index),
                  name: list[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
