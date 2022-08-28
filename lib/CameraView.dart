import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CameraView extends StatefulWidget {
  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    // 192.168.84.77

    return Container(
        margin: EdgeInsets.only(bottom: 32),
        width: size.width * .85,
        height: size.height * .33,
        child: Stack(
          children: [
            WebView(
              initialUrl: 'http://192.168.84.77/mjpeg/1',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ],
        ));
  }
}

// class CameraView extends StatefulWidget {
//   const CameraView({Key key}) : super(key: key);

//   @override
//   State<CameraView> createState() => _CameraViewState();
// }

// class _CameraViewState extends State<CameraView> {
//   ConnectivityResult _connectionStatus = ConnectivityResult.none;
//   final Connectivity _connectivity = Connectivity();
//   StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   @override
//   void initState() {
//     super.initState();
//     initConnectivity();

//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initConnectivity() async {
//     ConnectivityResult result;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       result = await _connectivity.checkConnectivity();
//     } catch (e) {
//       return;
//     }
//     if (!mounted) {
//       return Future.value(null);
//     }

//     return _updateConnectionStatus(result);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     setState(() {
//       _connectionStatus = result;
//     });
//   }

//   void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Column(
//       children: [
//         Center(
//             child: Text('Connection Status: ${_connectionStatus.toString()}')),
//         Container(
//           margin: EdgeInsets.only(bottom: 32),
//           width: size.width * .9,
//           height: size.height * .3,
//           child: WebView(
//             initialUrl: 'https://www.wikipedia.org/',
//             javascriptMode: JavascriptMode.unrestricted,
//             navigationDelegate: (NavigationRequest request) {
//               if (request.url.startsWith('https://www.wikipedia.org/')) {
//                 print('blocking navigation to $request}');
//                 _launchURL('https://www.wikipedia.org/');
//                 return NavigationDecision.prevent;
//               }

//               print('allowing navigation to $request');
//               return NavigationDecision.navigate;
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
