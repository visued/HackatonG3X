import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fiscaliza_front/src/screens/home_screen.dart';
import 'package:fiscaliza_front/src/screens/ocorrencia_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();

//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: CameraScreen(
//         // Pass the appropriate camera to the CameraScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }
// A screen that allows users to take a picture using a given camera.
class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  CameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Tire foto da infração')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                  addImage: this.widget.addImage,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final Function addImage;
  const DisplayPictureScreen(
      {Key? key, required this.imagePath, required this.addImage})
      : super(key: key);
  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    String? imagens;

    return Scaffold(
      appBar: AppBar(title: const Text('Foto da infração')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
          padding: EdgeInsets.all(5.0),
          color: Theme.of(context).primaryColor,
          child: Column(children: [
            Expanded(child: Image.file(File(this.widget.imagePath))),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.arrow_back, size: 16),
                    label: Text('Voltar'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                    onPressed: () {
                      Navigator.of(context).pop(this.widget.imagePath != null
                          ? this.widget.imagePath
                          : null);
                      print(this.widget.imagePath);
                    },
                  ),
                )),
                SizedBox(
                  width: 30.0,
                ),
                Expanded(
                    child: Container(
                  child: ElevatedButton.icon(
                    icon: Text('SALVAR'),
                    label: Icon(Icons.save, size: 16),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).highlightColor)),
                    onPressed: () async => {
                      await storage.write(
                          key: 'imagem', value: this.widget.imagePath),
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => OcorrenciaScreen(
                                  image: this.widget.imagePath,
                                )),
                      )
                    },
                  ),
                )),
              ],
            )
          ])),
    );
  }
}

class _ItemImage {
  _ItemImage(this.key, this.value);

  final String key;
  final String value;
}
// A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatefulWidget {
//   final String imagePath;
//   final List images;

//   const DisplayPictureScreen(
//       {Key? key, required this.imagePath, required this.images})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return
//   }

// @override
// State<StatefulWidget> createState() {
//   // TODO: implement createState
//   throw UnimplementedError();
// }
// }
