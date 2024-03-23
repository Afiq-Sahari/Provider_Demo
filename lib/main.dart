import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/design/theme_provider.dart';
import 'package:task/name/text_provider.dart';
import 'package:task/sec_page.dart';
import 'package:task/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>TextProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, th, _){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: th.isDarkMode
                ? ThemeData.dark()
                : ThemeData(
                    cardColor: Colors.cyanAccent,
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

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
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Consumer<TextProvider>(builder: (context, te, _){
          return Text(te.title);
        },)
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                width: 200,
                color: Colors.blueAccent,
              ),
            ),
            Flexible(
              child: Container(
                width: 200,
                color: Colors.cyan,
              ),
            ),
            Text(
              theme.status,
              style: TextStyle(fontSize: 30),
            ),
            Image.network(
                "https://images4.alphacoders.com/134/thumb-350-1347180.webp"
            ),
            TextFormField(),
            ElevatedButton(
                onPressed: (){
                  go(context, SecSample());
                },
                child: const Text("Second Page")
            ),
            Flexible(
              child: Container(
                width: 200,
                color: Colors.indigo,
              ),
              ),
            Flexible(
              child: Container(
                  width: 200,
                  color: Theme.of(context).cardColor
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          theme.toggleDarkMode();
          },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
