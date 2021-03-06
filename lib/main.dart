import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:flutter_despesas/widgets/transaction_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './widgets/chart.dart';
import './models/transaction.dart';
import './widgets/transaction_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => DemoLocalizations.of(context).title,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pt', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return Locale('pt', '');
      },
      title: 'Expenses',
      theme: ThemeData(
        errorColor: Colors.red[900],
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
                    
                    textTheme: ThemeData.light().textTheme.copyWith
                    (
                          title:TextStyle(
                            fontFamily: 'QuickSand',
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ) 
                    ))
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    // Transaction(id: '01', title: 'comida', amount: 56.89, date: DateTime.now()),
    // Transaction(id: '02', title: 'tenis', amount: 20.89, date: DateTime.now()),
    // Transaction(id: '03', title: 'remedio', amount: 10.89, date: DateTime.now()),
    // Transaction(id: '04', title: 'despesas', amount: 19.89, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions{
      return _userTransactions.where((transaction){
        var referenceDate = DateTime.now().subtract(Duration(days: 7));
         return transaction.date.isAfter(referenceDate);
      }).toList();
  }

  void _addNewTransaction(String pTitle, double pAmount, DateTime date) {
    final newTx = Transaction(
        title: pTitle,
        amount: pAmount,
        date: date,
        id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransation(String id){
    setState(() {
        _userTransactions.removeWhere((element) {
            return element.id == id;
        });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionAdd(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {

    final _appBar = AppBar(
            title: Text('Expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );


        final _floatActionBtn = FloatingActionButton(
                                      child: Icon(Icons.add),
                                      onPressed: () => _startAddNewTransaction(context),
                                  );
                                


                var scaffold = Scaffold(
                        appBar: _appBar,
                        body: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: (MediaQuery.of(context).size.height  - _appBar.preferredSize.height) * 0.4,
                                child: Chart(_recentTransactions)
                              ),
                              Container(
                                height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height)  * 0.45,
                                child: TransactionList(userTransactions:  _userTransactions, removeTransationFN: _removeTransation)
                              )
                            ],
                          ),
                        ),
                        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                        floatingActionButton:  _floatActionBtn,
              );
        return scaffold;
  }
}

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'pt': {
      'title': 'Hola Mundo',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
