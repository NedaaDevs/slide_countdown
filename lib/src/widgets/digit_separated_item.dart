import 'package:flutter/widgets.dart';
import 'package:slide_countdown/src/models/base_digit.dart';
import 'package:slide_countdown/src/utils/enum.dart';
import 'package:slide_countdown/src/utils/extensions.dart';

import 'box_separated.dart';
import 'raw_digit_item.dart';
import 'separator.dart';

class DigitSeparatedItem extends BaseDigits {
  const DigitSeparatedItem({
    super.key,
    required super.duration,
    required super.timeUnit,
    required super.padding,
    required super.decoration,
    required super.style,
    required super.separatorStyle,
    required super.slideDirection,
    required super.curve,
    required super.countUp,
    required super.slideAnimationDuration,
    required super.separator,
    required super.textDirection,
    required super.showSeparator,
    super.separatorPadding,
    super.digitsNumber,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> digits = [];

    if (timeUnit == TimeUnit.days && duration.inDays > 999) {
      digits.add(
        RawDigitItem(
          duration: duration,
          timeUnit: timeUnit,
          digitType: DigitType.daysThousand,
          countUp: countUp,
          style: style,
          slideDirection: slideDirection,
          slideAnimationDuration: slideAnimationDuration,
          digitsNumber: digitsNumber,
          curve: curve,
        ),
      );
    }

    if (timeUnit == TimeUnit.days && duration.inDays > 99) {
      digits.add(
        RawDigitItem(
          duration: duration,
          timeUnit: timeUnit,
          digitType: DigitType.daysHundred,
          countUp: countUp,
          style: style,
          slideDirection: slideDirection,
          slideAnimationDuration: slideAnimationDuration,
          digitsNumber: digitsNumber,
          curve: curve,
        ),
      );
    }

    digits.add(
      RawDigitItem(
        duration: duration,
        timeUnit: timeUnit,
        digitType: DigitType.first,
        countUp: countUp,
        style: style,
        slideDirection: slideDirection,
        slideAnimationDuration: slideAnimationDuration,
        digitsNumber: digitsNumber,
        curve: curve,
      ),
    );

    digits.add(
      RawDigitItem(
        duration: duration,
        timeUnit: timeUnit,
        digitType: DigitType.second,
        countUp: countUp,
        style: style,
        slideDirection: slideDirection,
        slideAnimationDuration: slideAnimationDuration,
        digitsNumber: digitsNumber,
        curve: curve,
      ),
    );

    final separatorWidget = showSeparator
        ? Separator(
            padding: separatorPadding,
            show: true,
            separator: separator,
            style: separatorStyle,
          )
        : SizedBox.shrink();

    final box = BoxSeparated(
      padding: padding,
      decoration: decoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: digits,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children:
          textDirection.isRtl ? [separatorWidget, box] : [box, separatorWidget],
    );
  }
}