import 'package:cave/cave.dart';
import 'package:flutter/material.dart';

@immutable
class DevfestTextTheme extends ThemeExtension<DevfestTextTheme> {
  final TextStyle? headerH1;
  final TextStyle? headerH2;
  final TextStyle? headerH3;
  final TextStyle? headerH4;
  final TextStyle? headerH5;
  final TextStyle? headerH6;
  final TextStyle? titleTitle1Regular;
  final TextStyle? titleTitle1Medium;
  final TextStyle? titleTitle1Semibold;
  final TextStyle? titleTitle2Regular;
  final TextStyle? titleTitle2Medium;
  final TextStyle? titleTitle2Semibold;
  final TextStyle? bodyBody1Regular;
  final TextStyle? bodyBody1Medium;
  final TextStyle? bodyBody1Semibold;
  final TextStyle? bodyBody2Regular;
  final TextStyle? bodyBody2Medium;
  final TextStyle? bodyBody2Semibold;
  final TextStyle? bodyBody3Regular;
  final TextStyle? bodyBody3Medium;
  final TextStyle? bodyBody3Semibold;
  final TextStyle? bodyBody4Regular;
  final TextStyle? bodyBody4Medium;
  final TextStyle? bodyBody4Semibold;
  final TextStyle? bodyBody5Regular;
  final TextStyle? bodyBody5Medium;
  final TextStyle? bodyBody5Semibold;
  final TextStyle? buttonLargeMedium;
  final TextStyle? buttonLargeSemibold;
  final TextStyle? buttonLargeBold;
  final TextStyle? buttonMediumMedium;
  final TextStyle? buttonMediumSemibold;
  final TextStyle? buttonMediumBold;
  final TextStyle? buttonSmallMedium;
  final TextStyle? buttonSmallSemibold;
  final TextStyle? buttonSmallBold;

  const DevfestTextTheme({
    this.headerH1,
    this.headerH2,
    this.headerH3,
    this.headerH4,
    this.headerH5,
    this.headerH6,
    this.titleTitle1Regular,
    this.titleTitle1Medium,
    this.titleTitle1Semibold,
    this.titleTitle2Regular,
    this.titleTitle2Medium,
    this.titleTitle2Semibold,
    this.bodyBody1Regular,
    this.bodyBody1Medium,
    this.bodyBody1Semibold,
    this.bodyBody2Regular,
    this.bodyBody2Medium,
    this.bodyBody2Semibold,
    this.bodyBody3Regular,
    this.bodyBody3Medium,
    this.bodyBody3Semibold,
    this.bodyBody4Regular,
    this.bodyBody4Medium,
    this.bodyBody4Semibold,
    this.bodyBody5Regular,
    this.bodyBody5Medium,
    this.bodyBody5Semibold,
    this.buttonLargeMedium,
    this.buttonLargeSemibold,
    this.buttonLargeBold,
    this.buttonMediumMedium,
    this.buttonMediumSemibold,
    this.buttonMediumBold,
    this.buttonSmallMedium,
    this.buttonSmallSemibold,
    this.buttonSmallBold,
  });

  DevfestTextTheme.light()
      : this(
          headerH1: TextStyle(
              fontSize: 80.sp,
              fontWeight: FontWeight.w700,
              height: 1.15,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          headerH2: TextStyle(
              fontSize: 62.sp,
              fontWeight: FontWeight.w700,
              height: 1.23,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          headerH3: TextStyle(
              fontSize: 56.sp,
              fontWeight: FontWeight.w700,
              height: 1.25,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          headerH4: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          headerH5: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              height: 1.25,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          headerH6: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
              height: 1.29,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle1Regular: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle1Medium: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle1Semibold: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle2Regular: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              height: 1.45,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle2Medium: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              height: 1.45,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle2Semibold: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              height: 1.45,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody1Regular: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody1Medium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody1Semibold: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody2Regular: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody2Medium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody2Semibold: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody3Regular: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody3Medium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.43,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody3Semibold: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody4Regular: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody4Medium: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody4Semibold: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody5Regular: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody5Medium: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.4,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody5Semibold: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonLargeMedium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonLargeSemibold: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonLargeBold: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonMediumMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonMediumSemibold: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonMediumBold: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonSmallMedium: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonSmallSemibold: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
          buttonSmallBold: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey10,
              leadingDistribution: TextLeadingDistribution.even),
        );

  DevfestTextTheme.dark()
      : this(
          headerH1: TextStyle(
              fontSize: 80.sp,
              fontWeight: FontWeight.w700,
              height: 1.15,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          headerH2: TextStyle(
              fontSize: 62.sp,
              fontWeight: FontWeight.w700,
              height: 1.23,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          headerH3: TextStyle(
              fontSize: 56.sp,
              fontWeight: FontWeight.w700,
              height: 1.25,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          headerH4: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          headerH5: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
              height: 1.25,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          headerH6: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w400,
              height: 1.29,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle1Regular: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle1Medium: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle1Semibold: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle2Regular: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              height: 1.45,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle2Medium: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              height: 1.45,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          titleTitle2Semibold: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              height: 1.45,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody1Regular: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody1Medium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody1Semibold: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody2Regular: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody2Medium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody2Semibold: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody3Regular: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody3Medium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.43,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody3Semibold: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody4Regular: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody4Medium: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody4Semibold: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody5Regular: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody5Medium: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              height: 1.4,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          bodyBody5Semibold: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              height: 1.4,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonLargeMedium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonLargeSemibold: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonLargeBold: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              height: 1.33,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonMediumMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonMediumSemibold: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonMediumBold: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonSmallMedium: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonSmallSemibold: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
          buttonSmallBold: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
              color: DevfestColors.grey100,
              leadingDistribution: TextLeadingDistribution.even),
        );

  const DevfestTextTheme.responsive()
      : this(
          headerH1: const TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w700,
            height: 1.15,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          headerH2: const TextStyle(
            fontSize: 62,
            fontWeight: FontWeight.w700,
            height: 1.23,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          headerH3: const TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w700,
            height: 1.25,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          headerH4: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            height: 1.2,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          headerH5: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            height: 1.25,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          headerH6: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            height: 1.29,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          titleTitle1Regular: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          titleTitle1Medium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          titleTitle1Semibold: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          titleTitle2Regular: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            height: 1.45,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          titleTitle2Medium: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 1.45,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          titleTitle2Semibold: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            height: 1.45,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody1Regular: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody1Medium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody1Semibold: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody2Regular: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody2Medium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody2Semibold: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody3Regular: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody3Medium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody3Semibold: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody4Regular: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody4Medium: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody4Semibold: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.5,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody5Regular: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.4,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody5Medium: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.4,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          bodyBody5Semibold: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.4,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonLargeMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonLargeSemibold: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonLargeBold: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1.33,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonMediumMedium: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonMediumSemibold: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonMediumBold: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonSmallMedium: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonSmallSemibold: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
          buttonSmallBold: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            decoration: TextDecoration.none,
          ),
        );

  @override
  DevfestTextTheme copyWith({
    TextStyle? headerH1,
    TextStyle? headerH2,
    TextStyle? headerH3,
    TextStyle? headerH4,
    TextStyle? headerH5,
    TextStyle? headerH6,
    TextStyle? titleTitle1Regular,
    TextStyle? titleTitle1Medium,
    TextStyle? titleTitle1Semibold,
    TextStyle? titleTitle2Regular,
    TextStyle? titleTitle2Medium,
    TextStyle? titleTitle2Semibold,
    TextStyle? bodyBody1Regular,
    TextStyle? bodyBody1Medium,
    TextStyle? bodyBody1Semibold,
    TextStyle? bodyBody2Regular,
    TextStyle? bodyBody2Medium,
    TextStyle? bodyBody2Semibold,
    TextStyle? bodyBody3Regular,
    TextStyle? bodyBody3Medium,
    TextStyle? bodyBody3Semibold,
    TextStyle? bodyBody4Regular,
    TextStyle? bodyBody4Medium,
    TextStyle? bodyBody4Semibold,
    TextStyle? bodyBody5Regular,
    TextStyle? bodyBody5Medium,
    TextStyle? bodyBody5Semibold,
    TextStyle? buttonLargeMedium,
    TextStyle? buttonLargeSemibold,
    TextStyle? buttonLargeBold,
    TextStyle? buttonMediumMedium,
    TextStyle? buttonMediumSemibold,
    TextStyle? buttonMediumBold,
    TextStyle? buttonSmallMedium,
    TextStyle? buttonSmallSemibold,
    TextStyle? buttonSmallBold,
  }) {
    return DevfestTextTheme(
      headerH1: headerH1 ?? this.headerH1,
      headerH2: headerH2 ?? this.headerH2,
      headerH3: headerH3 ?? this.headerH3,
      headerH4: headerH4 ?? this.headerH4,
      headerH5: headerH5 ?? this.headerH5,
      headerH6: headerH6 ?? this.headerH6,
      titleTitle1Regular: titleTitle1Regular ?? this.titleTitle1Regular,
      titleTitle1Medium: titleTitle1Medium ?? this.titleTitle1Medium,
      titleTitle1Semibold: titleTitle1Semibold ?? this.titleTitle1Semibold,
      titleTitle2Regular: titleTitle2Regular ?? this.titleTitle2Regular,
      titleTitle2Medium: titleTitle2Medium ?? this.titleTitle2Medium,
      titleTitle2Semibold: titleTitle2Semibold ?? this.titleTitle2Semibold,
      bodyBody1Regular: bodyBody1Regular ?? this.bodyBody1Regular,
      bodyBody1Medium: bodyBody1Medium ?? this.bodyBody1Medium,
      bodyBody1Semibold: bodyBody1Semibold ?? this.bodyBody1Semibold,
      bodyBody2Regular: bodyBody2Regular ?? this.bodyBody2Regular,
      bodyBody2Medium: bodyBody2Medium ?? this.bodyBody2Medium,
      bodyBody2Semibold: bodyBody2Semibold ?? this.bodyBody2Semibold,
      bodyBody3Regular: bodyBody3Regular ?? this.bodyBody3Regular,
      bodyBody3Medium: bodyBody3Medium ?? this.bodyBody3Medium,
      bodyBody3Semibold: bodyBody3Semibold ?? this.bodyBody3Semibold,
      bodyBody4Regular: bodyBody4Regular ?? this.bodyBody4Regular,
      bodyBody4Medium: bodyBody4Medium ?? this.bodyBody4Medium,
      bodyBody4Semibold: bodyBody4Semibold ?? this.bodyBody4Semibold,
      bodyBody5Regular: bodyBody5Regular ?? this.bodyBody5Regular,
      bodyBody5Medium: bodyBody5Medium ?? this.bodyBody5Medium,
      bodyBody5Semibold: bodyBody5Semibold ?? this.bodyBody5Semibold,
      buttonLargeMedium: buttonLargeMedium ?? this.buttonLargeMedium,
      buttonLargeSemibold: buttonLargeSemibold ?? this.buttonLargeSemibold,
      buttonLargeBold: buttonLargeBold ?? this.buttonLargeBold,
      buttonMediumMedium: buttonMediumMedium ?? this.buttonMediumMedium,
      buttonMediumSemibold: buttonMediumSemibold ?? this.buttonMediumSemibold,
      buttonMediumBold: buttonMediumBold ?? this.buttonMediumBold,
      buttonSmallMedium: buttonSmallMedium ?? this.buttonSmallMedium,
      buttonSmallSemibold: buttonSmallSemibold ?? this.buttonSmallSemibold,
      buttonSmallBold: buttonSmallBold ?? this.buttonSmallBold,
    );
  }

  @override
  DevfestTextTheme lerp(DevfestTextTheme? other, double t) {
    if (other is! DevfestTextTheme) return this;
    return DevfestTextTheme(
      headerH1: TextStyle.lerp(headerH1, other.headerH1, t),
      headerH2: TextStyle.lerp(headerH2, other.headerH2, t),
      headerH3: TextStyle.lerp(headerH3, other.headerH3, t),
      headerH4: TextStyle.lerp(headerH4, other.headerH4, t),
      headerH5: TextStyle.lerp(headerH5, other.headerH5, t),
      headerH6: TextStyle.lerp(headerH6, other.headerH6, t),
      titleTitle1Regular:
          TextStyle.lerp(titleTitle1Regular, other.titleTitle1Regular, t),
      titleTitle1Medium:
          TextStyle.lerp(titleTitle1Medium, other.titleTitle1Medium, t),
      titleTitle1Semibold:
          TextStyle.lerp(titleTitle1Semibold, other.titleTitle1Semibold, t),
      titleTitle2Regular:
          TextStyle.lerp(titleTitle2Regular, other.titleTitle2Regular, t),
      titleTitle2Medium:
          TextStyle.lerp(titleTitle2Medium, other.titleTitle2Medium, t),
      titleTitle2Semibold:
          TextStyle.lerp(titleTitle2Semibold, other.titleTitle2Semibold, t),
      bodyBody1Regular:
          TextStyle.lerp(bodyBody1Regular, other.bodyBody1Regular, t),
      bodyBody1Medium:
          TextStyle.lerp(bodyBody1Medium, other.bodyBody1Medium, t),
      bodyBody1Semibold:
          TextStyle.lerp(bodyBody1Semibold, other.bodyBody1Semibold, t),
      bodyBody2Regular:
          TextStyle.lerp(bodyBody2Regular, other.bodyBody2Regular, t),
      bodyBody2Medium:
          TextStyle.lerp(bodyBody2Medium, other.bodyBody2Medium, t),
      bodyBody2Semibold:
          TextStyle.lerp(bodyBody2Semibold, other.bodyBody2Semibold, t),
      bodyBody3Regular:
          TextStyle.lerp(bodyBody3Regular, other.bodyBody3Regular, t),
      bodyBody3Medium:
          TextStyle.lerp(bodyBody3Medium, other.bodyBody3Medium, t),
      bodyBody3Semibold:
          TextStyle.lerp(bodyBody3Semibold, other.bodyBody3Semibold, t),
      bodyBody4Regular:
          TextStyle.lerp(bodyBody4Regular, other.bodyBody4Regular, t),
      bodyBody4Medium:
          TextStyle.lerp(bodyBody4Medium, other.bodyBody4Medium, t),
      bodyBody4Semibold:
          TextStyle.lerp(bodyBody4Semibold, other.bodyBody4Semibold, t),
      bodyBody5Regular:
          TextStyle.lerp(bodyBody5Regular, other.bodyBody5Regular, t),
      bodyBody5Medium:
          TextStyle.lerp(bodyBody5Medium, other.bodyBody5Medium, t),
      bodyBody5Semibold:
          TextStyle.lerp(bodyBody5Semibold, other.bodyBody5Semibold, t),
      buttonLargeMedium:
          TextStyle.lerp(buttonLargeMedium, other.buttonLargeMedium, t),
      buttonLargeSemibold:
          TextStyle.lerp(buttonLargeSemibold, other.buttonLargeSemibold, t),
      buttonLargeBold:
          TextStyle.lerp(buttonLargeBold, other.buttonLargeBold, t),
      buttonMediumMedium:
          TextStyle.lerp(buttonMediumMedium, other.buttonMediumMedium, t),
      buttonMediumSemibold:
          TextStyle.lerp(buttonMediumSemibold, other.buttonMediumSemibold, t),
      buttonMediumBold:
          TextStyle.lerp(buttonMediumBold, other.buttonMediumBold, t),
      buttonSmallMedium:
          TextStyle.lerp(buttonSmallMedium, other.buttonSmallMedium, t),
      buttonSmallSemibold:
          TextStyle.lerp(buttonSmallSemibold, other.buttonSmallSemibold, t),
      buttonSmallBold:
          TextStyle.lerp(buttonSmallBold, other.buttonSmallBold, t),
    );
  }
}

extension TypographyX on TextStyle {
  /// fontweight: 400
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// fontweight: 500
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// fontweight: 600
  TextStyle get semi => copyWith(fontWeight: FontWeight.w600);

  /// fontweight: 700
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Italic
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// fontweight: 800
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  /// underlined text
  TextStyle get underlined => copyWith(decoration: TextDecoration.underline);

  TextStyle applyColor(Color? color) => copyWith(color: color);
}
