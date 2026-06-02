import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satria_flutter/models/profile.dart';
import 'package:satria_flutter/provider/profile_provider.dart';
import 'package:satria_flutter/screens/list_profile.dart';
import 'screens/detail_profile.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {

  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  
  runApp(
    ChangeNotifierProvider(create: (_) => ProfileProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListProfile(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int step = 0;
  int variable = 12;
  final TextEditingController namaController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // step without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      step += variable;
    });
  }

  void _decrementCounter () {
    if (step > 0) {
      setState(() {
        step -= variable;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('cannot be negative'))
      );
    }
  }

  void _setCounter () {
    setState(() {
      step = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Satria Cahya Ramadhani - 2415354012'),
            const Text('Step 12'),
            Text(
              '$step',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Masukkan nama",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String nama = namaController.text;
                  final provider = context.read<ProfileProvider>();
                  final index = provider.profiles.indexWhere((p) => p.id12 == 0);
                  final profile = Profile(
                    id12: 0,
                    coverphoto12: 'assets/images/background1.jpg',
                    profilephoto12: 'https://media.licdn.com/dms/image/v2/D5603AQGrhW_98u-Dyg/profile-displayphoto-scale_200_200/B56Zknupc2HkAY-/0/1757312164995?e=2147483647&v=beta&t=hy6wMYr-NMrbuCUWTbuo52ZVTLwwgVMa4OTHv5MZYcg',  
                    name12: nama.isNotEmpty ? nama : "Satria", 
                    bio12: "Developer",
                    desc12: "Saya adalah seorang developer yang berkuliah di PNB",
                    phonenumber12: "121295228281"
                  );
                  if (index != -1) {
                    provider.updateProfile(0, profile);
                  } else {
                    provider.addProfile(profile);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProfile(profileId12: 0),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 49, 113),
                ),
                child: Text('go to detail Profile', style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _setCounter,
            tooltip: 'set to zero',
            child: const Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
