import 'package:flutter/material.dart';
import 'package:kodersassignment/screens/home_page.dart';
import 'package:kodersassignment/screens/sign_in.dart';
import 'util.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProvider(),
        lazy: false,
        child: Consumer<AppProvider>(
          builder: (context, state, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Koders Assignment',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: state.isLoggedIn == false
                    ? const UserRegistration(
                        title: "Koders Assignment",
                      )
                    : const Homepage());
          },
        ));
  }
}
