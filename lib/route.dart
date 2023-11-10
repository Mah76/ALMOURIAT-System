import 'package:get/get.dart';

import 'appfiles/Home/Drawer/home.dart';
import 'appfiles/Home/Homescreen/resultdata.dart';
import 'appfiles/Home/Homescreen/upcoming.dart';
import 'appfiles/Home/map/map.dart';
import 'appfiles/Home/news/allnews.dart';
import 'appfiles/Home/news/newspage.dart';
import 'appfiles/Home/news/videonews.dart';
import 'appfiles/Home/report/horsereport.dart';
import 'appfiles/Home/report/livedata.dart';
import 'appfiles/data/OTP/views/OTPscreen.dart';
import 'appfiles/data/login/views/Screen/login.dart';
import 'appfiles/intro/onbordingTest.dart';
import 'appfiles/intro/splashPage.dart';
import 'appfiles/intro/welcomPage.dart';
import 'appfiles/registration/registerForm.dart';
import 'appfiles/registration/registerReceipt.dart';

class AppRoute {
  static const String initial = "/";
  static const String splash = "/SplashPage";
  static const String onboarde = "/OnboardeTest";
  static const String welcomePage = "/WelcomePage";
  static const String loginPage = "/LoginScreen";
  static const String otpPage = "/OtpScreenTest";
  static const String homePage = "/HomePagetest";
  static const String newsPage = "/NewsPage";
  static const String upcomingPage = "/UpComing";
  static const String formregistrationPage = "/FormRegistration";
  static const String horsereportPage = "/HorseReport";
  static const String maptrackingPage = "/Maptracking";
  static const String receiptPage = "/receipt";
  static const String resultPage = "/resultData";
  static const String videoPage = "/VideoNews";
  static const String allNewsPage = "/AllNews";
  static const String horseDataPage = "/HorseData";

  static String getwelcomePage() => welcomePage;
  static String getotpPage() => homePage;
  static String getloginPage() => loginPage;
  static String gethomePage() => homePage;
  static String getupcomingPage() => upcomingPage;
  static String getnewsPage() => newsPage;
  static String getformregistrationPage() => formregistrationPage;
  static String getmaptrackingPage() => maptrackingPage;
  static String gethorsereportPage() => horsereportPage;
  static String getreceiptPage() => receiptPage;
  static String getresultPage() => resultPage;
  static String getvideoPage() => videoPage;
  static String getallNewsPage() => allNewsPage;
  static String gethorseDataPage() => horseDataPage;

  // {int? raceid,
  // required int horseid,
  // required String riderpassport,
  // required String trainerpassport,
  // required String stages,
  // required String stablename})

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashPage(showOnBoard: true)),
    GetPage(name: onboarde, page: () => OnboardeTest()),
    GetPage(
        name: welcomePage,
        page: () {
          return WelcomePage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: loginPage,
        page: () {
          return LoginScreen();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: otpPage,
        page: () {
          return OtpScreenTest();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: homePage,
        page: () {
          //   var pageId = Get.parameters['pageId'];
          return const HomePagetest();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: newsPage,
        page: () {
          return NewsPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: upcomingPage,
        page: () {
          return const UpComing();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: formregistrationPage,
        page: () {
          return FormRegistration(
            raceid: Get.arguments,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: horsereportPage,
        page: () {
          return const HorseReport();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: maptrackingPage,
        page: () {
          return const Maptracking();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: receiptPage,
        page: () {
          return Receipt();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: resultPage,
        page: () {
          return const ResultData();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: videoPage,
        page: () {
          return const VideoNews();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: allNewsPage,
        page: () {
          return const AllNews();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: horseDataPage,
        page: () {
          return TestData();
        },
        transition: Transition.fadeIn),
  ];
}



