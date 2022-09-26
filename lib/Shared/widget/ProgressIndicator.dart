import 'package:flutter/material.dart';

class Custom_ProgressIndicator extends StatelessWidget {
  const Custom_ProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: Theme.of(context).primaryColor,
    ));
  }
}
