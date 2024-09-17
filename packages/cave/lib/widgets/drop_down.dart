import 'package:cave/themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../themes/themes.dart';
import 'text_field.dart';

class DevfestDropDown<T> extends StatefulWidget {
  const DevfestDropDown({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.title,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  final List<T> items;
  final T? selectedItem;
  final void Function(T? value)? onChanged;
  final String? title;
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  @override
  State<DevfestDropDown<T>> createState() => _DevfestDropDownState<T>();
}

class _DevfestDropDownState<T> extends State<DevfestDropDown<T>> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final TextEditingController _fieldController = TextEditingController();

  final _link = LayerLink();
  double? _buttonWidth;
  T? _hoveredItem;

  @override
  Widget build(BuildContext context) {
    final textFieldTheme = DevfestTheme.of(context).textFieldTheme;
    final backgroundColor = DevfestTheme.of(context).backgroundColor;
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          final overlay =
              Overlay.of(context).context.findRenderObject()! as RenderBox;
          return ConstrainedBox(
            constraints: BoxConstraints.loose(overlay.paintBounds.size),
            child: TapRegion(
              onTapOutside: (_) {
                _tooltipController.toggle();
              },
              child: CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 150)),
                      ScaleEffect(
                        begin: Offset(.95, .95),
                        end: Offset(1, 1),
                        duration: Duration(milliseconds: 150),
                      ),
                      MoveEffect(
                        begin: Offset(0, 2),
                        end: Offset.zero,
                        duration: Duration(milliseconds: 150),
                      ),
                    ],
                    child: Container(
                      width: _buttonWidth,
                      decoration: ShapeDecoration(
                        color: backgroundColor,
                        shape: RoundedRectangleBorder(
                          side: textFieldTheme?.border?.borderSide.copyWith(
                                  color: Colors.grey.withOpacity(0.12),
                                  width: 1.0) ??
                              BorderSide.none,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.items
                            .map(
                              (item) => MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    _hoveredItem = item;
                                  });
                                },
                                onExit: (_) {
                                  setState(() {
                                    _hoveredItem = null;
                                  });
                                },
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    _fieldController.text = item.toString();
                                    widget.onChanged?.call(item);
                                    _tooltipController.toggle();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: _getItemBackgroundColor(item),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      item.toString(),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: DevfestTheme(
          data: DevfestTheme.of(context).copyWith(
            textFieldTheme: DevfestTextFieldTheme(
              border: textFieldTheme?.border,
              enabledBorder: textFieldTheme?.border,
              errorBorder: textFieldTheme?.border,
              focusedBorder: textFieldTheme?.border,
              errorStyle: textFieldTheme?.errorStyle,
              hintStyle: textFieldTheme?.hintStyle,
              style: textFieldTheme?.style,
              suffixColor: textFieldTheme?.suffixColor,
              prefixColor: textFieldTheme?.prefixColor,
            ),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: DevfestTextFormField(
              title: widget.title,
              hint: widget.hint,
              controller: _fieldController,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              enabled: false,
              readOnly: true,
            ),
          ),
        ),
      ),
    );
  }

  Color? _getItemBackgroundColor(T item) {
    if (item == widget.selectedItem) {
      return Colors.grey.withOpacity(0.2);
    } else if (item == _hoveredItem) {
      return Colors.grey.withOpacity(0.1);
    }
    return Colors.transparent;
  }

  void onTap() {
    _buttonWidth = context.size?.width;
    _tooltipController.toggle();
  }
}
