import 'package:flutter/material.dart';
import 'package:users_app/splashscreen.dart';

import 'constant.dart';
import 'favourite.dart';
import 'loginpage.dart';
import 'users.dart';
void main()
{
  runApp(
    Myapp()
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        routes:
        {
          "/":(context) => Splashscreen(),
          loginpage:(context) => const Loginpage(),
          usersdetail:(context) => Detailpage(),
          fav_page:(context) => FavoriteUser(),
        }
    );
  }
}
