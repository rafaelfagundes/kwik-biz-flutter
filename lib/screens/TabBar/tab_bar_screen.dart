import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/widgets/Drawer/drawer_screen.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: Center(
        child: Text('Teste'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(SFSymbols.house_fill),
            icon: Icon(
              SFSymbols.house,
              color: Theme.of(context).primaryColor,
            ),
            title: ItemLabel('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.rectangle_stack,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(SFSymbols.rectangle_stack_fill),
            title: ItemLabel('Pedidos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.book,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(SFSymbols.book_fill),
            title: ItemLabel('Produtos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.bubble_left_bubble_right,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(SFSymbols.bubble_left_bubble_right_fill),
            title: ItemLabel('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.chart_pie,
              color: Theme.of(context).primaryColor,
            ),
            activeIcon: Icon(SFSymbols.chart_pie_fill),
            title: ItemLabel('Relatórios'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(SFSymbols.text_justifyleft,
                color: Theme.of(context).primaryColor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Text(
          'Boston Burguer Co.',
          style: TextStyle(fontFamily: 'Sen'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(SFSymbols.bell_fill,
                color: Theme.of(context).primaryColor),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class ItemLabel extends StatelessWidget {
  final String label;

  const ItemLabel(
    this.label, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
