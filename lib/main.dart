import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/screens/dashboard_screens/class_selection_screen.dart';
import 'package:uc_agile/screens/forgot_password_screens/change_password_screen.dart';
import 'package:uc_agile/screens/registration_screens/billing_address_screen.dart';
import 'package:uc_agile/screens/registration_screens/buyer_info_screen.dart';
import 'package:uc_agile/screens/registration_screens/card_details_screen.dart';
import 'package:uc_agile/screens/registration_screens/confirm_detail_screen.dart';
import 'package:uc_agile/screens/registration_screens/create_account_screen.dart';
import 'package:uc_agile/screens/dashboard_screen.dart';
import 'package:uc_agile/screens/dashboard_screens/class_details_screen.dart';
import 'package:uc_agile/screens/dashboard_screens/course_completion_screen.dart';
import 'package:uc_agile/screens/dashboard_screens/email_invoice_screen.dart';
import 'package:uc_agile/screens/dashboard_screens/refer_friend_screen.dart';
import 'package:uc_agile/screens/registration_screens/get_schedule_screen.dart';
import 'package:uc_agile/screens/registration_screens/participant_details_screen.dart';
import 'package:uc_agile/screens/temp_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/menu_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/tip_tricks_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/uc_exclusive_screen.dart';
import 'package:uc_agile/screens/forgot_password_screens/forgot_password_screen.dart';
import 'package:uc_agile/screens/login_screens/otp_verification_screen.dart';
import 'package:uc_agile/screens/login_screens/signin_screen.dart';
import 'package:uc_agile/screens/splash_screen.dart';
import 'package:uc_agile/screens/welcome_screen.dart';
import 'package:uc_agile/view_model/auth_view_model/check_otp_view_model.dart';
import 'package:uc_agile/view_model/change_password_view_model/change_password_view_model.dart';
import 'package:uc_agile/view_model/forgot_password_view_model/forgot_password_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/certificate_email_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/class_details_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/invoice_email_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/user_data_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/apply_coupon_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/billing_address_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/get_event_data_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/get_schedule_view_model.dart';
import 'package:uc_agile/view_model/auth_view_model/login_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/register_buyer_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/register_participants_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/registration_details_view_model.dart';
import 'package:uc_agile/view_model/auth_view_model/resend_view_model.dart';
import 'package:uc_agile/view_model/uc_exclusive_view_model/uc_exclusive_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScheduleViewModel>(create: (context) {
          return ScheduleViewModel();
        }),
        ChangeNotifierProvider<RegistrationDetailViewModel>(create: (context){
          return RegistrationDetailViewModel();
        }),
        ChangeNotifierProvider<LoginViewModel>(create: (context){
          return LoginViewModel();
        }),
        ChangeNotifierProvider<ResendViewModel>(create: (context){
          return ResendViewModel();
        }),
        ChangeNotifierProvider<CheckOtpViewModel>(create: (context){
          return CheckOtpViewModel();
        }),
        ChangeNotifierProvider<ForgotPasswordViewModel>(create: (context){
          return ForgotPasswordViewModel();
        }),
        ChangeNotifierProvider<GetEventDataViewModel>(create: (context){
          return GetEventDataViewModel();
        }),
        ChangeNotifierProvider<ApplyCouponViewModel>(create: (context){
          return ApplyCouponViewModel();
        }),
        ChangeNotifierProvider<RegisterBuyerViewModel>(create: (context){
          return RegisterBuyerViewModel();
        }),
        ChangeNotifierProvider<BillingAddressViewModel>(create: (context){
          return BillingAddressViewModel();
        }),
        ChangeNotifierProvider<RegisterParticipantsViewModel>(create: (context){
          return RegisterParticipantsViewModel();
        }),
        ChangeNotifierProvider<ClassDetailViewModel>(create: (context){
          return ClassDetailViewModel();
        }),
        ChangeNotifierProvider<CertificateEmailViewModel>(create: (context){
          return CertificateEmailViewModel();
        }),
        ChangeNotifierProvider<InvoiceEmailViewModel>(create: (context){
          return InvoiceEmailViewModel();
        }),
        ChangeNotifierProvider<UserDataViewModel>(create: (context){
          return UserDataViewModel();
        }),
        ChangeNotifierProvider<ChangePasswordViewModel>(create: (context){
          return ChangePasswordViewModel();
        }),
        ChangeNotifierProvider<ExclusiveViewModel>(create: (context){
          return ExclusiveViewModel();
        }),
      ],
      builder: (context, child) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return MaterialApp(
          title: 'UC Agile',
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            WelcomeScreen.id: (context) => WelcomeScreen(),
            SignInScreen.id: (context) => SignInScreen(),
            CreateAccountScreen.id: (context) => CreateAccountScreen(),
            ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
            ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
            OTPVerificationScreen.id: (context) => OTPVerificationScreen(),
            DashboardScreen.id: (context) => DashboardScreen(),
            ClassDetailsScreen.id: (context) => ClassDetailsScreen(),
            CourseCompletionScreen.id: (context) => CourseCompletionScreen(),
            EmailInvoiceScreen.id: (context) => EmailInvoiceScreen(),
            ReferFriendScreen.id: (context) => ReferFriendScreen(),
            UcExclusiveScreen.id: (context) => UcExclusiveScreen(),
            GetScheduleScreen.id: (context) => GetScheduleScreen(),
            BuyerInformationScreen.id: (context) => BuyerInformationScreen(),
            BillingAddressScreen.id: (context) => BillingAddressScreen(),
            ParticipantDetailScreen.id: (context) => ParticipantDetailScreen(),
            ConfirmDetailScreen.id: (context) => ConfirmDetailScreen(),
            CardDetailsScreen.id: (context) => CardDetailsScreen(),
            ClassSelectionScreen.id: (context) => ClassSelectionScreen(),
            TipTricksScreen.id: (context) => TipTricksScreen(),
            MenuScreen.id: (context) => MenuScreen(),
            TempScreen.id: (context) => TempScreen(),
          },
        );
      },
    );
  }
}
