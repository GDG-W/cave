// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:widgetbook_generator/builder.dart' as _i2;
import 'package:build/build.dart' as _i3;
import 'package:build_config/build_config.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'package:build_resolvers/builder.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'widgetbook_generator:use_case_builder',
    [_i2.useCaseBuilder],
    _i1.toDependentsOf(r'widgetbook_generator'),
    hideOutput: true,
    defaultOptions: const _i3.BuilderOptions(
        <String, dynamic>{r'nav_path_mode': r'component'}),
  ),
  _i1.apply(
    r'widgetbook_generator:app_builder',
    [_i2.appBuilder],
    _i1.toDependentsOf(r'widgetbook_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'widgetbook_generator:telemetry',
    [_i2.reportTelemetry],
    _i1.toRoot(),
    hideOutput: true,
    defaultOptions:
        const _i3.BuilderOptions(<String, dynamic>{r'debug': false}),
  ),
  _i1.apply(
    r'widgetbook_generator:experimental_story_builder',
    [_i2.storyBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    defaultGenerateFor: const _i4.InputSet(include: [r'lib/**.stories.dart']),
  ),
  _i1.apply(
    r'widgetbook_generator:experimental_components_builder',
    [_i2.componentsBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i5.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i6.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i6.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i5.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i7.SendPort? sendPort,
]) async {
  var result = await _i8.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i9.exitCode = result;
}
