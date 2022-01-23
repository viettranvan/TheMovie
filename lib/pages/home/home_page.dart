import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_movie/pages/pages.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        // 'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    String username = 'Guest';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 30.0, bottom: 30.0),
                child: Text('Hello $username,', style: kTextSize30w400White),
              ),
              GestureDetector(
                onTap: (){
                  FirebaseAuth _auth =  FirebaseAuth.instance;
                  var user = _auth.currentUser;
                  var verifyEmail = user?.emailVerified;
                  print('user:  ${user?.uid}');
                  print('name:  ${user?.displayName}');
                  print('name:  ${user?.photoURL}');
                  user?.updatePhotoURL(
                    'https://i.pinimg.com/236x/17/3d/6c/173d6c5ea458b677afa5a34a35d6eb55.jpg'
                  );
                  print('verifyEmail:  $verifyEmail');

                  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
                    print('account: $account');
                  });

                },
                child: Text('Click $username,', style: kTextSize20w400White),
              ),
              OfficialTrailerCard(
                image: image,
                onGotoDetail: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MovieDetailPage()),
                ),
                onPlayMovie: () => print('play'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
                child: Text(
                  'Top Rated',
                  style: kTextSize30w400White,
                ),
              ),
              const TopRatedView(),

              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
                child: Text(
                  'Popular',
                  style: kTextSize30w400White,
                ),
              ),
              const PopularView(),

              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 15.0),
                child: Text(
                  'Now Playing',
                  style: kTextSize30w400White,
                ),
              ),
              const NowPlayingView(),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
