import 'package:get/get.dart';

class CheckboxController extends GetxController {
  final RxBool isChecked = false.obs;

  void toggleCheckbox(bool? newValue) {
    if (newValue != null) {
      isChecked.value = newValue;
      // print('Checkbox is now: ${isChecked.value} (from controller)');
    }
  }
}
