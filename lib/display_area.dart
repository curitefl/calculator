import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayController extends GetxController {
  final Rx<String> displayExpression = '1+1'.obs;

  // ディスプレイの再描画処理
  void updateDisplay(String letter) {
    if (letter == '=' || letter == 'C') {
      displayExpression.value = '';
    } else {
      displayExpression.value += letter;
    }
  }
}

//ディスプレイ部分
class DisplayArea extends StatelessWidget {
  DisplayArea({Key? key}) : super(key: key);

  final DisplayController displayController = Get.put(DisplayController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              displayController.displayExpression.value,
              style: TextStyle(
                fontSize: 64.0.sp,
              ),
            ),
          )),
    );
  }
}