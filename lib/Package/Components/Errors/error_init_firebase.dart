import 'package:flutter/material.dart';
import 'package:flutter_pet/Helper/Utils/path_icons.dart';

class ErrorInitFirebase extends StatelessWidget {
  const ErrorInitFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              PathIcons.errorInitFirebase,
              // Text(KeyLang.errorInitFirebase.tr())
              const Text('Error Init Firebase'),
            ],
          ),
        ),
      ),
    );
  }
}
