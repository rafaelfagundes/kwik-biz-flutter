import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/screens/Home/home_screen.dart';
import 'package:kwik_biz_flutter/screens/Orders/orders_screen.dart';
import 'package:kwik_biz_flutter/widgets/Drawer/drawer_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_secondary_text.dart';

class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<TabbedScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return OrdersScreen();
      default:
        return HomeScreen();
    }
  }

  String _getTitle(int index, String homeTitle) {
    switch (index) {
      case 0:
        return homeTitle;
      case 1:
        return 'Pedidos';
      case 2:
        return 'Produtos';
      case 3:
        return 'Chat';
      case 4:
        return 'Relatórios';
      default:
        return homeTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: _getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        backgroundColor: Theme.of(context).cardColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              SFSymbols.house_fill,
              color: Theme.of(context).primaryColor,
            ),
            icon: Icon(
              SFSymbols.house,
              color: Theme.of(context).primaryColor.withOpacity(.4),
            ),
            title: ItemLabel('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.tray_arrow_down,
              color: Theme.of(context).primaryColor.withOpacity(.4),
            ),
            activeIcon: Icon(
              SFSymbols.tray_arrow_down_fill,
              color: Theme.of(context).primaryColor,
            ),
            title: ItemLabel('Pedidos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.rectangle_stack,
              color: Theme.of(context).primaryColor.withOpacity(.4),
            ),
            activeIcon: Icon(
              SFSymbols.rectangle_stack_fill,
              color: Theme.of(context).primaryColor,
            ),
            title: ItemLabel('Produtos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.text_bubble,
              color: Theme.of(context).primaryColor.withOpacity(.4),
            ),
            activeIcon: Icon(
              SFSymbols.text_bubble_fill,
              color: Theme.of(context).primaryColor,
            ),
            title: ItemLabel('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              SFSymbols.chart_bar,
              color: Theme.of(context).primaryColor.withOpacity(.4),
            ),
            activeIcon: Icon(
              SFSymbols.chart_bar_fill,
              color: Theme.of(context).primaryColor,
            ),
            title: ItemLabel('Relatórios'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.05))
            ],
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).cardColor,
            leading: Builder(builder: (context) {
              return IconButton(
                key: ValueKey('menuDrawerIcon'),
                icon: Icon(SFSymbols.text_justifyleft,
                    color: Theme.of(context).primaryColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            title: CustomSecondaryText(
              _getTitle(_selectedIndex, 'Boston Burger Co.'),
              weight: FontWeight.normal,
              size: 18,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(SFSymbols.bell_fill,
                    color: Theme.of(context).primaryColor),
                onPressed: () {},
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
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
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
