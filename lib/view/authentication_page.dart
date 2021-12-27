import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:social_authentication/model/googleSignInModel.dart';
import 'package:social_authentication/view/profile_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Log In with Google"),
        ),
        body: SignInButton(
          Buttons.Google,
          onPressed: (){
            _googleSignInProcess(context);
          },
        ),
        //_googleSignInProcess(context),
      ),
    );
  }
}

void _googleSignInProcess(BuildContext context) async {
  //final user=Provider.of<UserList>(context,listen: false);
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  String? token = googleAuth?.idToken;
  // ResGoogleSignInModel _socialGoogleUser = ResGoogleSignInModel(
  //   displayName: googleUser?.displayName,
  //   email: googleUser?.email,
  //   photoUrl: googleUser?.photoUrl,
  //   id: googleUser?.id,
  //   token: token,
  // );
  Provider.of<UserList>(context,listen: false).addUser(
      googleUser?.displayName,
      googleUser?.email,
      googleUser?.photoUrl,
      googleUser?.id,
      token,
  );
  Fluttertoast.showToast(
    msg: googleUser!.email,
    backgroundColor: Colors.blue,
    //fontSize: 50,
    textColor: Colors.white,
  );
  //print(user.currentUser);
  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>UserProfile()));
}
