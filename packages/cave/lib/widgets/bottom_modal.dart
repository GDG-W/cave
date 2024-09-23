import 'dart:math';

import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:cave/extensions/extensions.dart';
import 'package:cave/themes/themes.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showDevfestBottomModal(
  BuildContext context, {
  String? emoji,
  String? title,
  String? subtitle,
  String? btnText,
  String? userfullName,
  String? userTicketType,
  String? userID,
  String? secondBtnText,
  bool? outlineButtonIsPlacedFirst,
  bool? hasTwoButtons,
  bool? showColorfulUserNameCard,
  bool? showConfetti,
  void Function()? onBtnPressed,
  void Function()? onSecondBtnPressed,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    // constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width,
    //     MediaQuery.of(context).size.height * 0.45)),
    backgroundColor: DevfestColors.warning100,
    showDragHandle: true,
    context: context,
    builder: (context) => DevfestBottomModal(
      emoji: emoji,
      title: title,
      subtitle: subtitle,
      outlineButtonIsPlacedFirst: outlineButtonIsPlacedFirst,
      hasTwoButtons: hasTwoButtons,
      btnText: btnText,
      secondBtnText: secondBtnText,
      onBtnPressed: onBtnPressed,
      onSecondBtnPressed: onSecondBtnPressed,
      showColorfulUserNameCard: showColorfulUserNameCard,
      userID: userID,
      userTicketType: userTicketType,
      userfullName: userfullName,
      showConfetti: showConfetti,
    ),
  );
}

class DevfestBottomModal extends StatefulWidget {
  DevfestBottomModal(
      {super.key,
      this.emoji,
      this.title,
      this.subtitle,
      this.outlineButtonIsPlacedFirst,
      this.hasTwoButtons,
      this.btnText = '',
      this.secondBtnText,
      this.onBtnPressed,
      this.onSecondBtnPressed,
      this.showColorfulUserNameCard,
      this.userID = '',
      this.userTicketType = '',
      this.userfullName = '',
      this.showConfetti});
  String? emoji;
  String? title;
  String? subtitle;
  String? btnText;
  String? userfullName;
  String? userTicketType;
  String? userID;
  String? secondBtnText;
  bool? outlineButtonIsPlacedFirst;
  bool? hasTwoButtons;
  bool? showColorfulUserNameCard;
  bool? showConfetti;
  void Function()? onBtnPressed;
  void Function()? onSecondBtnPressed;

  @override
  State<DevfestBottomModal> createState() => _DevfestBottomModalState();
}

class _DevfestBottomModalState extends State<DevfestBottomModal> {
  final controller = ConfettiController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.showConfetti != null && widget.showConfetti == true) {
      controller.play();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (widget.showConfetti != null && widget.showConfetti == true) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0.w, 0.0, 16.0.w, 16.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.emoji != null) ...[
                
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: DevfestColors.warning80),
                          padding: EdgeInsets.all(21.w),
                          child: Text(
                            widget.emoji!,
                            style: TextStyle(fontSize: 40.sp),
                          ),
                        ),
                      ),
                      Constants.verticalGutter.verticalSpace,
                      Text(
                        widget.title ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: DevfestColors.grey10,
                        ),
                      ),
                      Constants.smallVerticalGutter.verticalSpace,
                      if (widget.subtitle != null) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            widget.subtitle ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: DevfestColors.grey60,
                            ),
                          ),
                        ),
                        Constants.verticalGutter.verticalSpace,
                      ],
                      if (widget.showColorfulUserNameCard == true) ...[
                        ColorfulUserInfoCard(widget: widget)
                      ] else ...[
                        SizedBox.shrink()
                      ],
                 


                if (widget.hasTwoButtons ?? false) ...[
                  if (widget.outlineButtonIsPlacedFirst ?? false) ...[
                    DevfestOutlinedButton(
                      onPressed: widget.onBtnPressed,
                      title: Text(
                        widget.btnText ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: DevfestColors.grey10,
                        ),
                      ),
                    ),
                    Constants.verticalGutter.verticalSpace,
                    DevfestFilledButton(
                      onPressed: widget.onSecondBtnPressed,
                      title: Text(
                        widget.secondBtnText ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: DevfestColors.grey100,
                        ),
                      ),
                    )
                  ] else ...[
                    DevfestFilledButton(
                      onPressed: widget.onBtnPressed,
                      title: Text(
                        widget.btnText ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: DevfestColors.grey100,
                        ),
                      ),
                    ),
                    Constants.verticalGutter.verticalSpace,
                    DevfestOutlinedButton(
                      onPressed: widget.onSecondBtnPressed,
                      title: Text(
                        widget.secondBtnText ?? '',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: DevfestColors.grey10,
                        ),
                      ),
                    ),
                  ]
                ],
                widget.hasTwoButtons == true
                    ? SizedBox.shrink()
                    : DevfestFilledButton(
                        onPressed: widget.onBtnPressed,
                        title: Text(
                          widget.btnText ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: DevfestColors.grey100,
                          ),
                        ),
                      )
              ]
            ],
          ),
        ),
         ConfettiWidget(
              confettiController: controller,
              shouldLoop: true,
              blastDirectionality:BlastDirectionality.explosive,
              //emissionFrequency: 0.1,
              numberOfParticles: 100,
            ),
      ],
    );
  }
}


class ColorfulUserInfoCard extends StatelessWidget {
  const ColorfulUserInfoCard({
    super.key,
    required this.widget,
  });

  final DevfestBottomModal widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                  colors: [Color(0xFFC471ED), Color(0xFF12C2E9)])),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(
                      12.h,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: DevfestColors.grey100),
                        color: DevfestColors.backgroundSoftLight),
                    child: Center(
                        child: Text(
                      widget.userfullName?.getUserInitials ?? '',
                      style: DevfestTheme.of(context)
                          .textTheme
                          ?.headerH5
                          ?.copyWith(color: DevfestColors.grey100),
                    )),
                  ),
                ),
              ),
              Constants.verticalGutter.verticalSpace,
              Text(widget.userfullName ?? '',
                  style: DevfestTheme.of(context)
                      .textTheme
                      ?.titleTitle2Medium
                      ?.copyWith(color: DevfestColors.grey100)),
              Constants.verticalGutter.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TicketOrIdContainer(
                      title: 'Type', info: widget.userTicketType ?? ''),
                  TicketOrIdContainer(title: 'ID', info: widget.userID ?? ''),
                ],
              )
            ],
          ),
        ),
        Constants.verticalGutter.verticalSpace
      ],
    );
  }
}

class TicketOrIdContainer extends StatelessWidget {
  const TicketOrIdContainer(
      {super.key, required this.title, required this.info});
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          border: Border.all(
            color: DevfestColors.grey100,
          ),
          color: DevfestColors.backgroundSoftLight),
      child: Row(
        children: [
          Icon(
            IconsaxOutline.ticket_star,
            color: DevfestColors.grey100,
          ),
          SizedBox(
            width: 2,
          ),
          Text('$title: $info',
              style: DevfestTheme.of(context)
                  .textTheme
                  ?.bodyBody3Semibold
                  ?.copyWith(color: DevfestColors.grey100))
        ],
      ),
    );
  }
}
