import 'package:eventview_application_1/presentation/screens.dart';
import 'package:flutter/material.dart';



class SettingAccountView extends StatelessWidget {
  const SettingAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:  16.0),
              TextFieldCustom(labelText: 'No. Celular',
              hintText: 'lorem ipsum',
                fontSize:  16.0,
                constraints: BoxConstraints(minWidth:  100, maxWidth:  350),
              ),
              SizedBox(height:  16.0),
              TextFieldCustom(labelText: 'No. Celular',
              hintText: 'lorem ipsum',
                fontSize:  16.0,
                constraints: BoxConstraints(minWidth:  100, maxWidth:  350),
              ),
              
            ],)
          ],
        ),
      ),
    );
  }
}