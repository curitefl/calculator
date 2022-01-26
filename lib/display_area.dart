import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'text_data.dart';

class DisplayController extends GetxController {
  final Rx<String> displayExpression = '1+1'.obs;

  // ディスプレイの再描画処理
  void updateDisplay(String letter) {
    if (letter == TextData.equal || letter == TextData.clear) {
      displayExpression.value = '';
    } else {
      displayExpression.value += letter;
    }
  }
}

//ディスプレイ部分
class DisplayArea extends StatelessWidget {
  final DisplayController _displayController;

  DisplayArea({Key? key})
      : _displayController = Get.find<DisplayController>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              _displayController.displayExpression.value,
              style: TextStyle(
                fontSize: 64.0.sp,
              ),
            ),
          )),
    );
  }
}