
import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/resources/colour.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({super.key, required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColours.buttonColour,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child: loading ? CircularProgressIndicator(color: AppColours.white,): Text(title, style: TextStyle(color: AppColours.white),)),
      ),
    );
  }
}
