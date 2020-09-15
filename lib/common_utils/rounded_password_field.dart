import 'package:flutter/material.dart';
import 'package:flutter_http_cipher/common_utils/text_field_container.dart';

import 'constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: KprimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: KprimaryLightColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: KprimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
