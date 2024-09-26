import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/features/speakers/presentation/widgets/widgets.dart';
import 'package:devfest24/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpeakerDetailsScreen extends StatelessWidget {
  const SpeakerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GoBackButton(
          onTap: context.pop,
        ),
        leadingWidth: 120.w,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: DevfestColors.success70),
              child: Wrap(
                spacing: 8,
                children: [
                  const Icon(IconsaxBold.people),
                  Text(
                    '100 Slots Left',
                    style: DevfestTheme.of(context)
                        .textTheme
                        ?.bodyBody2Medium
                        ?.medium,
                  ),
                ],
              ),
            ),
            Constants.verticalGutter.verticalSpace,
            Padding(
              padding: EdgeInsets.only(right: 32.w),
              child: Text(
                'Appreciating the usefulness of football memes in decoding intent',
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.titleTitle2Semibold
                    ?.semi,
              ),
            ),
            Constants.verticalGutter.verticalSpace,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: ContainerProperties.defaultBorderRadius,
                    border: Border.all(
                        color: DevfestColors.primariesBlue60, width: 2),
                  ),
                  child: Image.asset(
                    'assets/images/mastersam.png',
                    semanticLabel: 'Speaker\'s photograph',
                    height: 56.h,
                    width: 56.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Constants.horizontalGutter.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Samuel Abada',
                      style: DevfestTheme.of(context)
                          .textTheme
                          ?.bodyBody1Semibold
                          ?.semi,
                    ),
                    Constants.smallVerticalGutter.verticalSpace,
                    Text(
                      'Flutter Engineer, Tesla',
                      style: DevfestTheme.of(context)
                          .textTheme
                          ?.bodyBody2Medium
                          ?.semi
                          .applyColor(DevfestColors.grey50),
                    ),
                  ],
                )
              ],
            ),
            Constants.verticalGutter.verticalSpace,
            const Wrap(
              spacing: 8,
              children: [
                SpeakersTalkInfoPill(
                  icon: IconsaxOutline.clock,
                  title: '10:00AM',
                ),
                SpeakersTalkInfoPill(
                  icon: IconsaxOutline.location,
                  title: 'Hall A',
                ),
              ],
            ),
            Constants.largeVerticalGutter.verticalSpace,
            DevfestFilledButton(
              title: Text(
                'Reserve My Spot',
                style: DevfestTheme.of(context)
                    .textTheme
                    ?.buttonMediumSemibold
                    ?.semi
                    .applyColor(DevfestColors.grey100),
              ),
            ),
            Constants.largeVerticalGutter.verticalSpace,
             Text('SPEAKER BIO',style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody3Medium
                    ?.semi
                    .applyColor(DevfestColors.grey50),),
            Constants.verticalGutter.verticalSpace,   
             Text('Samuel is a developer from Akure who thinks he is Batman, and unfortunately, with his vast resources and endless wealth he has found a way to balance squashing bugs and the heads of criminals within Nigeria',style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody2Medium
                    ?.semi),
            Constants.largeVerticalGutter.verticalSpace, 
            Text('SPEAKER SOCIALS',style: DevfestTheme.of(context)
                    .textTheme
                    ?.bodyBody3Medium
                    ?.semi
                    .applyColor(DevfestColors.grey50),),
             Constants.verticalGutter.verticalSpace,    
             Wrap(
              spacing: 16.w,
              runSpacing: 16.h,
               children: const [
                 SpeakerSocialMedia(icon: Icon(IconsaxOutline.link_21,semanticLabel:'Social Media Link'  ,),onTap: null),
                 SpeakerSocialMedia(icon: Twitter(),onTap: null),
                 SpeakerSocialMedia(icon: Facebook(),onTap: null),
                 SpeakerSocialMedia(icon: Linkedin(),onTap: null),
                 SpeakerSocialMedia(icon: Behance(),onTap: null),
                 SpeakerSocialMedia(icon: Github(),onTap: null),
                 SpeakerSocialMedia(icon: Dribbble(),onTap: null),
               ],
             )  
          ],
        ),
      ),
    );
  }
}