import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volunteerapp/src/shared/shared.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.5, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: ContainerProperties.defaultPrimaryBorderRadius,
        border: Border.all(color: DevfestColors.grey70),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/icons/logout.svg'),
          Constants.horizontalGutter.horizontalSpace,
          Text(
            'Log out',
            style: DevfestTheme.of(context)
                .textTheme
                ?.bodyBody3Medium
                ?.medium
                .applyColor(DevfestColors.grey10.possibleDarkVariant),
          )
        ],
      ),
    );
  }
}
