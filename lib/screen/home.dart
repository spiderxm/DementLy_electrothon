// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../widgets/google_sign_in_provider.dart';
// // import '../widgets/logged_in.dart';
// import '../screen/userDetails.dart';
// import './googleSign.dart';
// import 'package:provider/provider.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: ChangeNotifierProvider(
//           create: (context) => GoogleSignInProvider(),
//           child: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               final provider = Provider.of<GoogleSignInProvider>(context);

//               if (provider.isSigningIn) {
//                 return buildLoading();
//               } else if (snapshot.hasData) {
//                 return UserDetails();
//                 //return LoggedInWidget();
//               } else {
//                 return GoogleLoginPage();
//               }
//             },
//           ),
//         ),
//       );

//   Widget buildLoading() {
//     return Stack(
//       children: [
//         Center(child: CircularProgressIndicator()),
//       ],
//     );
//   }
// }
