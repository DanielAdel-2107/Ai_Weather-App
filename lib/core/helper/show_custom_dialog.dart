import 'package:ai_weather/app/my_app.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void showCustomDialog({
  required String title,
  required String description,
  required DialogType dialogType,
}) {
  AwesomeDialog(
    context: navigatorKey.currentState!.context,
    dialogType: dialogType,
    animType: AnimType.bottomSlide,
    title: title,
    desc: description,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  ).show();
}
