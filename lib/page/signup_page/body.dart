import 'package:flutter/material.dart';
import 'package:flutter_http_cipher/common_utils/already_have_an_account_acheck.dart';
import 'package:flutter_http_cipher/common_utils/rounded_button.dart';
import 'package:flutter_http_cipher/common_utils/rounded_input_field.dart';
import 'package:flutter_http_cipher/common_utils/rounded_password_field.dart';
import 'package:flutter_http_cipher/page/login_page/login_page.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';
import 'or_divider.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height * 0.1,
              color: Color(0xFF4934eb),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
