import 'package:aslrabbids/rabbidflashcards.dart';
import 'package:aslrabbids/rabbidhome.dart';
import 'package:aslrabbids/widgets/background.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import 'rabbidstart.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => RabbidStart(),
          '/home': (context) => RabbidHome(),
          '/camera': (context) => RabbidCamera(),
          '/learn': (context) => RabbidFlashcards(),
        });
  }
}

class RabbidCamera extends StatefulWidget {
  @override
  _RabbidCameraState createState() => _RabbidCameraState();
}

class _RabbidCameraState extends State<RabbidCamera> {
  late CameraController cameraController;
  late CameraImage cameraImage;
  late List recognitionsList;

  initCamera() {
    cameraController = CameraController(
      cameras[1],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    cameraController.initialize().then((value) {
      setState(() {
        cameraController.startImageStream((image) => {
              cameraImage = image,
              runModel(),
            });
      });
    });
  }

  runModel() async {
    recognitionsList = (await Tflite.detectObjectOnFrame(
      bytesList: cameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResultsPerClass: 1,
      threshold: 0.4,
    ))!;

    setState(() {
      cameraImage;
    });
  }

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: "assets/ssd_mobilenet.tflite",
        labels: "assets/ssd_mobilenet.txt");
  }

  @override
  void dispose() {
    super.dispose();

    cameraController.stopImageStream();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();

    loadModel();
    initCamera();
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (recognitionsList == null) return [];

    double factorX = screen.width;
    double factorY = screen.height;

    Color colorPick = Colors.pink;

    return recognitionsList.map((result) {
      return Positioned(
        left: result["rect"]["x"] * factorX,
        top: result["rect"]["y"] * factorY,
        width: result["rect"]["w"] * factorX,
        height: result["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['detectedClass']} ${(result['confidenceInClass'] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.black,
              fontSize: 28.0,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> list = [];

    final deviceSize = MediaQuery.of(context).size;
    final cameraSize = cameraController.value;
    var scale = deviceSize.aspectRatio * cameraSize.aspectRatio;
    if (scale < 1) scale = 1 / scale;

    list.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: size.width,
        height: size.height,
        child: Container(
          child: (!cameraController.value.isInitialized)
              ? new Container()
              : Transform.scale(
                  scale: scale,
                  child: Center(
                    child: Center(
                      child: CameraPreview(
                        cameraController,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );

    if (cameraImage != null) {
      list.addAll(displayBoxesAroundRecognizedObjects(size));
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundContainer(),
            Stack(
              children: list,
            ),
          ],
        ),
      ),
    );
  }
}
