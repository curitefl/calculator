import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayController extends GetxController {
  final Rx<String> _displayExpression = '1+1'.obs;
}

//ディスプレイ部分
class DisplayArea extends StatelessWidget {
  DisplayArea({Key? key}) : super(key: key);

  final DisplayController displayController = Get.put(DisplayController());

  // ディスプレイの再描画処理
  _UpdateDisplay(String letter) {
    if (letter == '=' || letter == 'C') {
      displayController._displayExpression.value = '';
    } else {
      displayController._displayExpression.value += letter;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              displayController._displayExpression.value,
              style: TextStyle(
                fontSize: 64.0.sp,
              ),
            ),
          )),
    );
  }
}