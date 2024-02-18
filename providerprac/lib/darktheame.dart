import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerprac/provider/theme_changer_provider.dart';
class Darkthemescreen extends StatefulWidget {
  const Darkthemescreen({super.key});

  @override
  State<Darkthemescreen> createState() => _DarkthemescreenState();
}

class _DarkthemescreenState extends State<Darkthemescreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final themechanger =Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("modes"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text("light"),
              value: ThemeMode.light,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("dark"),
              value: ThemeMode.dark,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text("system"),
              value: ThemeMode.system,
              groupValue: themechanger.thememode,
              onChanged: themechanger.setTheme),
          Icon(Icons.light),


        ],
      ),
    );
  }
}
