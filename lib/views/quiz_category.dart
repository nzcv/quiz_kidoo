import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_application_tut_from_scracth/controllers/question_controller.dart';
import 'package:quiz_application_tut_from_scracth/views/quiz_screen.dart';

class QuizCategoryScreen extends StatelessWidget {
  QuizCategoryScreen({super.key});

  final QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/bg.svg",
            fit: BoxFit.fitWidth,
          ),
          _questionController.savedCategories.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: _questionController.savedCategories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(QuizScreen(
                          category: _questionController.savedCategories[index],
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xffb40707), Color(0xFFF56363)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.question_answer),
                              Text(_questionController.savedCategories[index]),
                              Text(_questionController.savedSubtitle[index])
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                  "No Questions & Categories Added by Your Parent \n Please Ask to Add Questions",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30
                    ),
                ))
        ],
      ),
    );
  }
}
