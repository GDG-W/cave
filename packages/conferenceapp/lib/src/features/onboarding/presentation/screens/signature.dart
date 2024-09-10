import 'package:cave/cave.dart';
import 'package:cave/constants.dart';
import 'package:devfest24/src/shared/shared.dart';
import 'package:flutter/material.dart';

class OnboardingSignatureScreen extends StatefulWidget {
  const OnboardingSignatureScreen({super.key});

  @override
  State<OnboardingSignatureScreen> createState() =>
      _OnboardingSignatureScreenState();
}

class _OnboardingSignatureScreenState extends State<OnboardingSignatureScreen> {
  Color? stencilColor = DevfestColors.grey10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Constants.horizontalMargin.horizontalSpace,
            SizedBox(
              width: 96.w,
              child: DevfestFilledButton.small(
                backgroundColor: DevfestColors.grey80.possibleDarkVariant,
                title: const Text('Exit'),
                titleStyle: TextStyle(
                  color: DevfestColors.grey50.possibleDarkVariant,
                ).semi,
                onPressed: () {},
              ),
            ),
          ],
        ),
        leadingWidth: 120.w,
        actions: [
          SizedBox(
            width: 96.w,
            child: DevfestFilledButton.small(
              title: const Text('Upload'),
              onPressed: () {},
            ),
          ),
          Constants.horizontalMargin.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
                horizontal: Constants.horizontalGutter,
                vertical: Constants.verticalGutter)
            .r
            .add(
              EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom),
            ),
        child: Column(
          children: [
            Expanded(child: Container()),
            _SignatureCanvasPalette(
              onUndoPressed: () {},
              onDeletePressed: () {},
              selectedColor: stencilColor,
              onColorChanged: (color) {
                setState(() {
                  stencilColor = color;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class _SignatureCanvasPalette extends StatelessWidget {
  const _SignatureCanvasPalette({
    this.onUndoPressed,
    this.onDeletePressed,
    this.onColorChanged,
    required this.selectedColor,
  });

  final VoidCallback? onUndoPressed;
  final VoidCallback? onDeletePressed;
  final void Function(Color color)? onColorChanged;
  final Color? selectedColor;

  static const paletteColors = [
    DevfestColors.primariesBlue50,
    DevfestColors.primariesGreen50,
    DevfestColors.grey10,
    DevfestColors.primariesYellow50,
    DevfestColors.primariesRed50,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onUndoPressed,
          icon: const Icon(IconsaxOutline.undo),
        ),
        Expanded(
          child: Material(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Constants.largeHorizontalGutter)),
              side: BorderSide(
                color: DevfestColors.grey100,
              ),
            ),
            child: SizedBox(
              height: 80.h,
              child: Padding(
                padding: const EdgeInsets.all(Constants.verticalGutter).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                          paletteColors.length, (index) => index)
                      .map(
                        (index) => Padding(
                          padding: index == paletteColors.length - 1
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(
                                      right: Constants.largeHorizontalGutter)
                                  .w,
                          child: _PaletteColorItem(
                            color: paletteColors[index],
                            isSelected: paletteColors[index] == selectedColor,
                            onTap: () {
                              onColorChanged?.call(paletteColors[index]);
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onDeletePressed,
          icon: const Icon(
            IconsaxOutline.trash,
            semanticLabel: 'Clear signature canvas',
          ),
        ),
      ],
    );
  }
}

class _PaletteColorItem extends StatelessWidget {
  const _PaletteColorItem({
    required this.color,
    this.isSelected = false,
    this.onTap,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dimension = isSelected ? 48.w : 34.w;
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: AnimatedSize(
          duration: Constants.kAnimationDur,
          curve: Curves.ease,
          child: SizedBox.square(
            dimension: dimension,
            child: isSelected
                ? const Icon(
                    Icons.check_rounded,
                    color: DevfestColors.grey100,
                    semanticLabel: 'Selected color',
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
