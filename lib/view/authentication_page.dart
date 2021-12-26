import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_authentication/model/googleSignInModel.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInButton(
        Buttons.Google,
        onPressed: (){
          _googleSignInProcess(context);
        },
      ),
      //_googleSignInProcess(context),
    );
  }
}

void _googleSignInProcess(BuildContext context) async {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  String? token = googleAuth?.idToken;
  ResGoogleSignInModel _socialGoogleUser = ResGoogleSignInModel(
    displayName: googleUser?.displayName,
    email: googleUser?.email,
    photoUrl: googleUser?.photoUrl,
    id: googleUser?.id,
    token: token,
  );
  Fluttertoast.showToast(
    msg: googleUser!.email,
    backgroundColor: Colors.blue,
    textColor: Colors.white
  );
}
