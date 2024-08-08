import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view%20model/auth_view_model.dart';
import 'package:tms/view/auth%20screens/welcome_screen.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 6), () async {
      await Provider.of<AuthViewModel>(context, listen: false).loadToken();
      final token = Provider.of<AuthViewModel>(context, listen: false).token;
      if (token != null) {
        const DashBoardScreen().launch(context);
        if (kDebugMode) {
          print("token saved $token");
        }
      } else {
        const WelcomeScreen().launch(context);
        if (kDebugMode) {
          print("No token found!!!");
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
                scale: _animation.value,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          image_logo,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      text(
                        "Task Management System",
                        textColor: primary_color,
                        fontSize: size16,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ));
          },
        ),
      ).paddingAll(size30),
    );
  }
}
