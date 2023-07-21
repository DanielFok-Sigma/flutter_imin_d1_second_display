
import 'package:flutter/material.dart';
import 'package:flutter_imin_d1_second_display/flutter_imin_d1_second_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';
  final _flutterIminD1SecondDisplayPlugin = FlutterIminD1SecondDisplay();

  @override
  void initState() {
    super.initState();
  }

  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();
  WidgetsToImageController controller2 = WidgetsToImageController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Running on: $_platformVersion\n'),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _flutterIminD1SecondDisplayPlugin.init();
                  },
                  child: const Text('Init'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _flutterIminD1SecondDisplayPlugin.wakeUp();
                  },
                  child: const Text('Wake up'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _flutterIminD1SecondDisplayPlugin.sleep();
                  },
                  child: const Text('Sleep'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _flutterIminD1SecondDisplayPlugin.clear();
                  },
                  child: const Text('Clear'),
                ),
                const SizedBox(
                  height: 10,
                ),
                // WidgetsToImage(
                //   controller: controller,
                //   child: widget1(),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    // final bytes = await controller.capture();
                    DateTime startTime = DateTime.now();
                    // final bytes = await screenshotController.captureFromWidget(widget1());\
                    // final bytes = await controller.capture();
                    final bytes = await controller.createImageFromWidget(widget: widget1());
                    DateTime endTime = DateTime.now();
                    int timeTakenInMilliseconds = endTime.difference(startTime).inMilliseconds;
                    debugPrint('Time taken: $timeTakenInMilliseconds ms');

                    await _flutterIminD1SecondDisplayPlugin.sendImage(bytes);
                  },
                  child: const Text('Send Image 1'),
                ),
                const SizedBox(
                  height: 10,
                ),
                // WidgetsToImage(
                //   controller: controller2,
                //   child: widget2(),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime startTime = DateTime.now();
                    // final bytes = await screenshotController.captureFromWidget(widget2());
                    // final bytes = await controller2.capture();
                    final bytes = await controller2.createImageFromWidget(widget: widget2());

                    DateTime endTime = DateTime.now();
                    int timeTakenInMilliseconds = endTime.difference(startTime).inMilliseconds;
                    debugPrint('Time taken: $timeTakenInMilliseconds ms');
                    await _flutterIminD1SecondDisplayPlugin.sendImage(bytes);
                  },
                  child: const Text('Send Image 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widget1() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 240,
        width: 320,
        decoration: const BoxDecoration(
          color: Color(0xFFEBEBEB),
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              width: 320,
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              decoration: const BoxDecoration(
                color: Color(0xFF3F5F95),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Premium PU Leather Ultimate Gaming Chair (Black) asdasdad dasdas dsa das das d dasd ad',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'RM 100000.00',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'x 1000',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Total Amount
            Container(
              height: 60,
              width: 320,
              decoration: const BoxDecoration(
                color: Color(0xFFF27935),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('RM 15925.25',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widget2() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        height: 240,
        width: 320,
        decoration: const BoxDecoration(
          color: Color(0xFFEBEBEB),
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              width: 320,
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              decoration: const BoxDecoration(
                color: Color(0xFF3F5F95),
              ),
              child:  Column(
                children: [
                  const Text(
                    'Thank you for shopping with us!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Please come again!',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            //Total Amount
            Container(
              height: 60,
              width: 320,
              decoration: const BoxDecoration(
                color: Color(0xFFF27935),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('RM 0.00',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
