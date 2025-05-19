import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = CurvedAnimation(
      parent: animationController1,
      curve: Curves.bounceIn,
    );
    animationController1.forward().then((value) {
      animationController2.forward().then((value) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => NextScreen()));
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: AnimatedBuilder(
        animation: animationController1,
        builder: (context, child) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animationController1),
            child: child,
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: animation,
                child: Image.asset('assets/images/logo.png'),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0),
                  end: Offset(0, 3),
                ).animate(animationController2),
                child: Text(
                  'Sample Text',
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

//  Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedContainer(
//                 duration: Duration(seconds: duration),
//                 color: Colors.blue,
//                 width: width,
//                 height: height,
//               ),
//             ],
//           ),
//           AnimatedDefaultTextStyle(
//             style: TextStyle(color: Colors.black),
//             duration: Duration(seconds: duration),
//             child: Text('Text'),
//             onEnd:
//                 () => Navigator.of(
//                   context,
//                 ).push(MaterialPageRoute(builder: (context) => NextScreen())),
//           ),
//         ],
//       ),
