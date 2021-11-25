import 'package:example/examples/extended_example/example.dart';
import 'package:example/examples/provider_example/ui/app.dart';
import 'package:example/examples/styles_example/example.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

/// You can use [GroupButtonExtendedExample] example
/// for check all package [GroupingType]'s in one place

/// /// You can use [StylesExample] example
/// for check all package style's configuration

/// You can use [GroupButtonProviderExample] example
/// using this package with state - managment package like provider

void main() {
  runApp(CommonExample());
}

class CommonExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GroupButton(
            spacing: 10,
            buttons: const [
              '12:00',
              '13:00',
              '14:00',
              '15:00',
              '16:00',
            ],
            buttonsImages: const [
              'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
              'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
              'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
              'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
              'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
            ],
            borderRadius: BorderRadius.circular(30),
            onSelected: (i, selected) => debugPrint('Button #$i selected'),
          ),
        ),
      ),
    );
  }
}
