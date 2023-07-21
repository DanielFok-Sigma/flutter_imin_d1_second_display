import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class WidgetsToImageController {
  GlobalKey containerKey = GlobalKey();

  /// to capture widget to image by GlobalKey in RenderRepaintBoundary
  Future<Uint8List?> capture() async {
    try {
      /// boundary widget by GlobalKey
      RenderRepaintBoundary? boundary = containerKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

      /// convert boundary to image
      final image = await boundary!.toImage(pixelRatio: 1);

      /// set ImageByteFormat
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }

  /// Creates an image from the given widget by first spinning up a element and render tree,
  /// then waiting for the given [wait] amount of time and then creating an image via a [RepaintBoundary].
  ///
  /// The final image will be of size [imageSize] and the the widget will be layout, ... with the given [logicalSize].
  Future<Uint8List> createImageFromWidget(
      {required Widget widget, Duration wait = Duration.zero, Size logicalSize = const Size(320, 240), Size imageSize = const Size(320, 240)}) async {
    try {
      final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

      assert(logicalSize.aspectRatio == imageSize.aspectRatio);

      final RenderView renderView = RenderView(
        // view: ui.window,
        // view: View.of(context),
        child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
        configuration: ViewConfiguration(
          size: logicalSize,
          devicePixelRatio: 1.0,
        ),
        window: ui.window,
      );

      final PipelineOwner pipelineOwner = PipelineOwner();
      // final BuildOwner buildOwner = BuildOwner();
      final BuildOwner buildOwner = BuildOwner(
        focusManager: FocusManager(),
        onBuildScheduled: () {
          // Ensure that the focus manager keyMessageHandler is null in a headless environment
          ServicesBinding.instance.keyEventManager.keyMessageHandler = null;
        },
      );

      pipelineOwner.rootNode = renderView;
      renderView.prepareInitialFrame();

      final RenderObjectToWidgetElement<RenderBox> rootElement = RenderObjectToWidgetAdapter<RenderBox>(
        container: repaintBoundary,
        child: widget,
      ).attachToRenderTree(buildOwner);

      buildOwner.buildScope(rootElement);

      if (wait > Duration.zero) {
        await Future.delayed(wait);
      }

      buildOwner.buildScope(rootElement);
      buildOwner.finalizeTree();

      pipelineOwner.flushLayout();
      pipelineOwner.flushCompositingBits();
      pipelineOwner.flushPaint();

      final ui.Image image = await repaintBoundary.toImage(pixelRatio: imageSize.width / logicalSize.width);
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      return byteData!.buffer.asUint8List();
    } catch (e, s) {
      debugPrint('Error in createImageFromWidget: $e');
      debugPrint('Stacktrace: $s');
      rethrow;
    }
  }
}

class WidgetsToImage extends StatelessWidget {
  final Widget? child;
  final WidgetsToImageController controller;

  const WidgetsToImage({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// to capture widget to image by GlobalKey in RepaintBoundary
    return RepaintBoundary(
      key: controller.containerKey,
      child: child,
    );
  }
}
