// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/usecases/bottom_nav.dart' as _i2;
import 'package:app/usecases/buttons.dart' as _i4;
import 'package:app/usecases/dropdown.dart' as _i3;
import 'package:app/usecases/text_field.dart' as _i5;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'DevfestBottomNav',
        useCase: _i1.WidgetbookUseCase(
          name: 'DevFest Bottom Nav',
          builder: _i2.devfestBottomNav,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DevfestDropDown',
        useCase: _i1.WidgetbookUseCase(
          name: 'DevFest Dropdown',
          builder: _i3.devfestDropdown,
          designLink:
              'https://www.figma.com/design/CMEZj7OPDW09hOuTg1tAgF/DevFest-Lagos-\'24---Mobile-App.?node-id=5457-8141&node-type=FRAME&t=13HTMdJAt4XcDqvU-0',
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DevfestFilledButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Filled Button',
          builder: _i4.devfestFilledButton,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DevfestOutlinedButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Outlined Button',
          builder: _i4.devfestOutlinedButton,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DevfestTextFormField',
        useCase: _i1.WidgetbookUseCase(
          name: 'DevFest FormField',
          builder: _i5.devfestTextField,
        ),
      ),
    ],
  )
];
