import 'package:flutter/material.dart';
import 'package:my_app/src/authenticate/authenticate.dart';
import 'package:my_app/src/home/home.dart';
import 'package:my_app/src/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<Users?>(context);

    // return either Home or Authenticate widget
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
