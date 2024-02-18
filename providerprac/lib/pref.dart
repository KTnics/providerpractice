import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  String name="";

  @override
  void initState() {
    super.initState();
    load();
  }

   Future<void> load() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString('storedText', textEditingController.text);
     loadText();
     setState(() {
       isLoggedIn = loggedIn;
     });
   }

  Future<void> loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = usernameController.text.trim();

    // Simulate a login process
    // In a real-world scenario, you'd authenticate the user against a backend server
    if (username.isNotEmpty) {
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);
      checkLoginStatus();
    }
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Center(
        child: isLoggedIn
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${usernameController.text.trim()}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: logoutUser,
              child: Text('Logout'),
            ),
          ],
        )
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginUser,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
