import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:flutter_application_1/service/allowance_service.dart';
import 'package:flutter_application_1/service/business_service.dart';
import 'package:flutter_application_1/widget/dashboard.dart';
import 'package:flutter_application_1/widget/logIn_page.dart';
import 'package:flutter_application_1/widget/sign_up_form.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runLogIn();
}

void runMainPage() {
  MainPage getMainPage = MainPage();
  runApp(getMainPage.getMainPage());
}
void runLogIn() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
         
          body: SignUpForm()
          )
          ));}


void runBusiness() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text("Business Management"),
          ),
          body: BusinessService().getBusinessHome())));
}

void runAllowance() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: const Text("Allowance Management"),
          ),
          body: AllowanceService().getAllowanceHome())));
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   runApp(MyApp(token: prefs.getString('token')));
// }

// class MyApp extends StatelessWidget {
//   final String? token;
  
//   const MyApp({
//     required this.token,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.black,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: (token != null && !JwtDecoder.isExpired(token!))
//           ? Dashboard(token: token!)
//           : SignInPage(),
//     );
//   }
// }
