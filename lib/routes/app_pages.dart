
import 'package:get/get.dart';


import '../modules/about_me_module/about_me_bindings.dart';
import '../modules/about_me_module/add_more_photos.dart';
import '../modules/about_me_module/how_do_you_identify.dart';
import '../modules/about_me_module/how_do_you_identify_tags.dart';
import '../modules/about_me_module/neurological_status.dart';
import '../modules/dashboard_module/dashboard_bindings.dart';
import '../modules/dashboard_module/dashboard_screen.dart';
import '../modules/feed_module/feed_bindings.dart';
import '../modules/feed_module/feed_screen.dart';
import '../modules/group_module/group_bindings.dart';
import '../modules/group_module/group_screen.dart';
import '../modules/message_module/message_bindings.dart';
import '../modules/message_module/message_screen.dart';
import '../modules/profile_module/profile_bindings.dart';
import '../modules/profile_module/profile_screen.dart';
import '../modules/signin_module/signin_bindings.dart';
import '../modules/signin_module/signin_screen.dart';
import '../modules/signin_module/signin_with_email_screen.dart';
import '../modules/signup_module/signup_bindings.dart';
import '../modules/signup_module/signup_screen.dart';
import '../modules/splash_module/splash_bindings.dart';
import '../modules/splash_module/splash_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.SIGNINWITHEMAIL,
      page: () => const SignInWithEmailScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.ADDMOREPHOTOS,
      page: () => const AddMorePhotosScreen(),
      binding: AboutMeBinding(),
    ),
    GetPage(
      name: Routes.HOWDOYOUIDENTIFY,
      page: () => const HowDoYouIdentifyScreen(),
      binding: AboutMeBinding(),
    ),
    GetPage(
      name: Routes.HOWDOYOUIDENTIFYTAGS,
      page: () => const HowDoYouIdentifyTagsScreen(),
      binding: AboutMeBinding(),
    ),
    GetPage(
      name: Routes.NEUROLOGICALSTATUS,
      page: () => const NeuroLogicalStatusScreen(),
      binding: AboutMeBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashBoardScreen(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: Routes.FEED,
      page: () => const FeedScreen(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: Routes.GROUP,
      page: () => const GroupScreen(),
      binding: GroupBinding(),
    ),
    GetPage(
      name: Routes.MESSAGE,
      page: () => const MessageScreen(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
