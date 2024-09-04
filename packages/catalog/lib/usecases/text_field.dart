import 'package:cave/cave.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'DevFest FormField',
  type: DevfestTextFormField,
)
Widget devfestTextField(BuildContext context) {
  return StatefulBuilder(builder: (context, setState) {
    return Scaffold(
      backgroundColor: DevfestTheme.of(context).backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DevfestTextFormField(
                title: 'Email Address',
                hint: 'eg seneatorofthenbu@gmail.com',
              ),
              const SizedBox(height: 16),
              DevfestTextFormField(
                title: 'Ticket ID',
                hint: 'eg 413-012-ABC',
                autovalidateMode: AutovalidateMode.always,
                validator: (value) =>
                    'The ticket ID or Email address is incorrect. Please try again',
              ),
            ],
          ),
        ),
      ),
    );
  });
}
