import 'dart:convert';

import '../features/dashboard/model/model.dart';

class ConferenceExtraCodec extends Codec<Object?, Object?> {
  const ConferenceExtraCodec({
    this.decoder = const _ConferenceExtraDecoder(),
    this.encoder = const _ConferenceExtraEncoder(),
  });

  @override
  final Converter<Object?, Object?> decoder;

  @override
  final Converter<Object?, Object?> encoder;
}

class _ConferenceExtraDecoder extends Converter<Object?, Object?> {
  const _ConferenceExtraDecoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    final List<Object?> inputAsList = input as List<Object?>;
    return switch (inputAsList[0]) {
      'SpeakerDto' =>
        SpeakerDto.fromJson(inputAsList[1] as Map<String, dynamic>),
      _ => throw FormatException('Unable to parse input: $input'),
    };
  }
}

class _ConferenceExtraEncoder extends Converter<Object?, Object?> {
  const _ConferenceExtraEncoder();

  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }

    return switch (input) {
      SpeakerDto dto => <Object?>['SpeakerDto', dto.toJson()],
      _ => throw FormatException('Cannot encode type ${input.runtimeType}'),
    };
  }
}
