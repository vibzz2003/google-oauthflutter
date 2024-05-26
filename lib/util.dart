import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:kodersassignment/screens/home_page.dart';

class Appconstants {
  static const String endpoint = "https://cloud.appwrite.io/v1";
  static const String projectid = "6653462e00022509e0de";
}

class AppProvider extends ChangeNotifier {
  Client client = Client();
  late Account account;
  late bool _isLoggedIn;

  bool get isLoggedIn => _isLoggedIn;

  AppProvider() {
    _isLoggedIn = true;
    initialize();
  }

  initialize() {
    client
      ..setProject(Appconstants.projectid)
      ..setEndpoint(Appconstants.endpoint);
    account = Account(client);
    checkLogin();
  }

  checkLogin() async {
    try {
      await account.get();
    } catch (_) {
      _isLoggedIn = false;
      notifyListeners();
      print(_isLoggedIn);
    }
  }

  socialSignIn(String provider, context) async {
    await account.createOAuth2Session(provider: provider);

    final response = await account.get();
    if (response.status == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ));
    }
  }
}
