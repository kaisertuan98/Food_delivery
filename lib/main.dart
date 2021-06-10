import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:monkey_app_demo/screens/changeAddressScreen.dart';
import 'package:monkey_app_demo/services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import './screens/landingScreen.dart';
import './screens/loginScreen.dart';
import './screens/signUpScreen.dart';
import './screens/forgetPwScreen.dart';
import './screens/sentOTPScreen.dart';
import './screens/newPwScreen.dart';
import './screens/introScreen.dart';
import './screens/homeScreen.dart';
import './screens/menuScreen.dart';
import './screens/moreScreen.dart';
import './screens/offerScreen.dart';
import './screens/profileScreen.dart';
import './screens/dessertScreen.dart';
import './screens/individualItem.dart';
import './screens/paymentScreen.dart';
import './screens/notificationScreen.dart';
import './screens/aboutScreen.dart';
import './screens/inboxScreen.dart';
import './screens/myOrderScreen.dart';
import './screens/checkoutScreen.dart';
import './const/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticateService>(
          create: (_) => AuthenticateService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticateService>().authStateChanges,
          // initialData: super, //unsure
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'De Food',
        theme: ThemeData(
          fontFamily: "Metropolis",
          primarySwatch: Colors.red,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColor.orange,
              ),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                AppColor.orange,
              ),
            ),
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            headline5: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.normal,
              fontSize: 25,
            ),
            headline6: TextStyle(
              color: AppColor.primary,
              fontSize: 25,
            ),
            bodyText2: TextStyle(
              color: AppColor.secondary,
            ),
          ),
        ),
        home: AuthenticationWrapper(),
        routes: {
          LandingScreen.routeName: (context) => LandingScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
          SendOTPScreen.routeName: (context) => SendOTPScreen(),
          NewPwScreen.routeName: (context) => NewPwScreen(),
          IntroScreen.routeName: (context) => IntroScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          MenuScreen.routeName: (context) => MenuScreen(),
          OfferScreen.routeName: (context) => OfferScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          MoreScreen.routeName: (context) => MoreScreen(),
          DessertScreen.routeName: (context) => DessertScreen(),
          IndividualItem.routeName: (context) => IndividualItem(),
          PaymentScreen.routeName: (context) => PaymentScreen(),
          NotificationScreen.routeName: (context) => NotificationScreen(),
          AboutScreen.routeName: (context) => AboutScreen(),
          InboxScreen.routeName: (context) => InboxScreen(),
          MyOrderScreen.routeName: (context) => MyOrderScreen(),
          CheckoutScreen.routeName: (context) => CheckoutScreen(),
          ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  StreamSubscription _streamSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _streamSubscription =
        context.read<AuthenticateService>().authStateChanges.listen((user) {
      if (user != null) {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      } else {
        Navigator.of(context).pushNamed(LandingScreen.routeName);
      }
    });
  }

  @override
  void dispose() {
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //SplashScreen
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
