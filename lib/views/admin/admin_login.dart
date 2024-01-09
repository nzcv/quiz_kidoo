import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_application_tut_from_scracth/utils/constants.dart';
import 'package:quiz_application_tut_from_scracth/views/admin/admin_dashboard.dart';

class AdminLoginScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: const Text(
            "Quiz Kidoo Admin",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
          centerTitle: true,
          gradient: const LinearGradient(
            colors: [Color(0xffb40707), Color(0xFFF56363)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/bg.svg",
            fit: BoxFit.fitWidth,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Let's Make a Quiz",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const Text("Check your Kids IQ with Quiz Kidoo"),
                  const Spacer(), // /1/6
                  TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Type Parent/parent",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      final userName = userNameController.text;
                      if (userName == "Parent" || userName == "parent") {
                        Get.to(
                          const AdminDashboard(),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Let's Make a Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),

                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
