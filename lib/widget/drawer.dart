import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/about.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(backgroundColor: Colors.pink, elevation: 100, 
        child: ListView(children:  [
          SizedBox(height: 100),
      ListTile(
        leading: FaIcon(FontAwesomeIcons.calculator),
        title: Text('BMI CALCULATOR'),
        onTap: () => Navigator.of(context).pushReplacementNamed('/')
      ),
      ListTile(
        leading: FaIcon(FontAwesomeIcons.book),
        title: Text('ABOUT'),
        onTap: () => Navigator.of(context).pushReplacementNamed(About.routeName)
      ),
    ]));
  }
}
