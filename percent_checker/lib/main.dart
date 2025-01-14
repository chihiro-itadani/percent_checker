import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? currentPercent;
  int score = 0;

  void _setPercent(int percent) {
    setState(() {
      currentPercent = percent;
    });
  }

  void tapAnswer(bool isFold) {
    if (currentPercent == null) {
      return;
    }

    setState(() {
      if (isFold) {
        score += 10 - currentPercent!;
      } else {
        score -= currentPercent!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        score = 0;
                      });
                    },
                    child: Text('RESET')),
                SizedBox(height: 20),
                Text(
                  'Score: $score',
                ),
                const SizedBox(height: 20),
                Text(
                  'Current Percent: ${currentPercent ?? 'None'}',
                ),
                TextButton(
                  child: const Text('100%'),
                  onPressed: () {
                    _setPercent(10);
                  },
                ),
                TextButton(
                  child: const Text('90%'),
                  onPressed: () {
                    _setPercent(9);
                  },
                ),
                TextButton(
                  child: const Text('80%'),
                  onPressed: () {
                    _setPercent(8);
                  },
                ),
                TextButton(
                  child: const Text('70%'),
                  onPressed: () {
                    _setPercent(7);
                  },
                ),
                TextButton(
                  child: const Text('60%'),
                  onPressed: () {
                    _setPercent(6);
                  },
                ),
                TextButton(
                  child: const Text('50%'),
                  onPressed: () {
                    _setPercent(5);
                  },
                ),
                TextButton(
                  child: const Text('40%'),
                  onPressed: () {
                    _setPercent(4);
                  },
                ),
                TextButton(
                  child: const Text('30%'),
                  onPressed: () {
                    _setPercent(3);
                  },
                ),
                TextButton(
                  child: const Text('20%'),
                  onPressed: () {
                    _setPercent(2);
                  },
                ),
                TextButton(
                  child: const Text('10%'),
                  onPressed: () {
                    _setPercent(1);
                  },
                ),
                TextButton(
                  child: const Text('0%'),
                  onPressed: () {
                    _setPercent(0);
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      child: const Text('Fold'),
                      onPressed: () {
                        tapAnswer(true);
                      },
                    ),
                    TextButton(
                      child: const Text('Not Fold'),
                      onPressed: () {
                        tapAnswer(false);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
