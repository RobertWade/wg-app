import 'package:flutter/material.dart';
import 'screens/shoppinglist.dart';
import 'screens/finances.dart';
import 'screens/cleaningplan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Roommate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  List<Widget> _tabList = [
    Container(
      child: Center(
        child: CleaningPlan(),
      ),
    ),
    Container(
      child: Center(child: ShoppingList()),
    ),
    Container(
      child: FinanceList(),
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });

          _tabController.animateTo(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.event_note),
            title: new Text('Putzplan'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('Einkaufliste'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.euro_symbol),
            title: Text('Finanzen'),
          )
        ],
      ),
    );
  }
}
