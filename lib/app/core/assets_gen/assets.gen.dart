/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/air_conditioner.png
  AssetGenImage get airConditioner => const AssetGenImage('assets/images/air_conditioner.png');

  /// File path: assets/images/back_device.png
  AssetGenImage get backDevice => const AssetGenImage('assets/images/back_device.png');

  /// File path: assets/images/back_splash.png
  AssetGenImage get backSplash => const AssetGenImage('assets/images/back_splash.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/humidifier.png
  AssetGenImage get humidifier => const AssetGenImage('assets/images/humidifier.png');

  /// File path: assets/images/lines.png
  AssetGenImage get lines => const AssetGenImage('assets/images/lines.png');

  /// File path: assets/images/logo-app.png
  AssetGenImage get logoApp => const AssetGenImage('assets/images/logo-app.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/on1.png
  AssetGenImage get on1 => const AssetGenImage('assets/images/on1.png');

  /// File path: assets/images/on2.png
  AssetGenImage get on2 => const AssetGenImage('assets/images/on2.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/radar.png
  AssetGenImage get radar => const AssetGenImage('assets/images/radar.png');

  /// File path: assets/images/smart_lamp.png
  AssetGenImage get smartLamp => const AssetGenImage('assets/images/smart_lamp.png');

  /// File path: assets/images/speaker.png
  AssetGenImage get speaker => const AssetGenImage('assets/images/speaker.png');

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreen => const AssetGenImage('assets/images/splash_screen.png');

  /// File path: assets/images/weather.png
  AssetGenImage get weather => const AssetGenImage('assets/images/weather.png');
  /// File path: assets/images/Header_Background.png
  AssetGenImage get headerBackground => const AssetGenImage('assets/images/Header_Background.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    airConditioner,
    backDevice,
    backSplash,
    google,
    humidifier,
    lines,
    logoApp,
    logo,
    on1,
    on2,
    profile,
    radar,
    smartLamp,
    speaker,
    splashScreen,
    weather,
    headerBackground,
  ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/Photo-1.svg
  SvgGenImage get photo1 => const SvgGenImage('assets/svgs/Photo-1.svg');

  /// File path: assets/svgs/Photo-2.svg
  SvgGenImage get photo2 => const SvgGenImage('assets/svgs/Photo-2.svg');

  /// File path: assets/svgs/Photo-3.svg
  SvgGenImage get photo3 => const SvgGenImage('assets/svgs/Photo-3.svg');

  /// File path: assets/svgs/Photo.svg
  SvgGenImage get photo => const SvgGenImage('assets/svgs/Photo.svg');

  /// File path: assets/svgs/airconditioner.svg
  SvgGenImage get airconditioner => const SvgGenImage('assets/svgs/airconditioner.svg');

  /// File path: assets/svgs/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/svgs/apple.svg');

  /// File path: assets/svgs/back_arrow.svg
  SvgGenImage get backArrow => const SvgGenImage('assets/svgs/back_arrow.svg');

  /// File path: assets/svgs/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/svgs/facebook.svg');

  /// File path: assets/svgs/google.svg
  SvgGenImage get google => const SvgGenImage('assets/svgs/google.svg');

  /// File path: assets/svgs/humidifier.svg
  SvgGenImage get humidifier => const SvgGenImage('assets/svgs/humidifier.svg');

  /// File path: assets/svgs/qr_scan.svg
  SvgGenImage get qrScan => const SvgGenImage('assets/svgs/qr_scan.svg');

  /// File path: assets/svgs/smartlamp.svg
  SvgGenImage get smartlamp => const SvgGenImage('assets/svgs/smartlamp.svg');

  /// File path: assets/svgs/speaker.svg
  SvgGenImage get speaker => const SvgGenImage('assets/svgs/speaker.svg');

  /// File path: assets/svgs/vector.svg
  SvgGenImage get vector => const SvgGenImage('assets/svgs/vector.svg');

  /// file path: assets/svgs/change_photo.svg
  SvgGenImage get changePhoto => const SvgGenImage('assets/svgs/change_photo.svg');

  /// File path: assets/svgs/alexa.svg
  SvgGenImage get alexa => const SvgGenImage('assets/svgs/alexa.svg');

  /// File path: assets/svgs/google_assistant.svg
  SvgGenImage get googleAssistant => const SvgGenImage('assets/svgs/google_assistant.svg');

  /// File path: assets/svgs/smart_thing.svg
  SvgGenImage get smartThing => const SvgGenImage('assets/svgs/smart_thing.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    photo1,
    photo2,
    photo3,
    photo,
    airconditioner,
    apple,
    backArrow,
    facebook,
    google,
    humidifier,
    qrScan,
    smartlamp,
    speaker,
    vector,
    changePhoto,
    alexa,
    googleAssistant,
    smartThing,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
