import 'package:flutter/material.dart';
import 'package:social_authentication/model/googleSignInModel.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserList>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              user.currentUser[0].photoUrl.toString(),
            ),
          ),
          Text(user.currentUser[0].displayName.toString()),
          Text(user.currentUser[0].email.toString()),
          Text(user.currentUser[0].id.toString()),
          Text(user.currentUser[0].token.toString()),
          ElevatedButton(
            onPressed: () {
              print(user.currentUser[0]);
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
