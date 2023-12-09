import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:e_commerce/ui/home/cart/cart_screen.dart';
import 'package:e_commerce/ui/home/home_screen/widget/home_screen_view.dart';
import 'package:e_commerce/ui/home/product_details/product_details_view.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // el main lw async yb2a lazem azwd el str da 34an y3ml initlalize l ay 7aga lazmlha initialize
  await SharedPreferenceUtils.init();
  // Bloc.observer = MyBlocObserver();
  var user = await SharedPreferenceUtils.getData(key: 'Token');
  String route;
  if (user == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreenView.routeName;
  }
  runApp(MyApp(route));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp(this.route);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // initialRoute: SplashScreen.routeName,
            initialRoute: route,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreenView.routeName: (context) => HomeScreenView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
            },
          );
        });
  }
}
