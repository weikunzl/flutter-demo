import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  final String url;
  const NewWidget({
    Key key,@required  this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.purple])
      ),
      child: Image.network(
        this.url,
        fit: BoxFit.fitHeight,
        repeat: ImageRepeat.noRepeat,
      ),
    );
  }
}