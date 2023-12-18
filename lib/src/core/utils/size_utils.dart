import 'package:flutter/widgets.dart';

widthValue(BuildContext context, [double val = 360]) {
  return MediaQuery.of(context).size.width * (val / 360);
}

heightValue(BuildContext context, [double val = 800]) {
  return MediaQuery.of(context).size.height * (val / 800);
}

addVerticalSpace(double val) {
  return SizedBox(height: val);
}

addHorizontalSpace(double val) {
  return SizedBox(width: val);
}
