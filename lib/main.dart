import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/generated/l10n.dart';
import 'package:i18n/pages/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: MyHomePage(null),
      routes: {
        'info_page': (context) => InfoPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(Key? key) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deligate = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(deligate.appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Text(
                  deligate.CounterText(_counter),
                  style: const TextStyle(fontSize: 20),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      S.load(Locale('en', "US"));
                    });
                  },
                  child: const Text('Chanage to English 🏴󠁧󠁢󠁥󠁮󠁧󠁿',style: TextStyle(color: Colors.blue),),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      S.load(const Locale('ru', "RU"));
                    });
                  },
                  child:const Text('Сменить на русский 🇷🇺',style: TextStyle(color: Colors.blue),),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      S.load(const Locale('uz', "UZ"));
                    });
                  },
                  child: const Text('O\'zbekchaga o\'zgartiring 🇺🇿',style: TextStyle(color: Colors.blue),),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                          Navigator.pushNamed(context, 'info_page',arguments: _counter);
                    });
                  },
                  child: const Text('Next page',style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
