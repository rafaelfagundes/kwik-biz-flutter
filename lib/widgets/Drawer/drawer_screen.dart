import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/modules/app/app_controller.dart';
import 'package:kwik_biz_flutter/modules/app/app_store.dart';
import 'package:kwik_biz_flutter/modules/app/local_storage_service.dart';
import 'package:kwik_biz_flutter/utils/image_utils.dart';
import 'package:kwik_biz_flutter/widgets/icon_with_background.dart';
import 'package:provider/provider.dart';

import '../rounded_store_logo_widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _appStore = Provider.of<AppStore>(context);
    final AppController _appController =
        new AppController(LocalStorageService());
    return Observer(
      builder: (_) => Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              url:
                  'https://res.cloudinary.com/kardappio/image/upload/v1588298907/tyukddlp3acv7fhicrvj.png',
              name: 'Rafael Fagundes',
              businessName: 'Boston Burger Co.',
            ),
            RatingAndFavorites(rating: 4.3, favorites: 6),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top + 64) -
                  234,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      DrawerItem(
                        icon: SFSymbols.house,
                        label: 'Início',
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                      DrawerItem(
                        icon: SFSymbols.gear,
                        label: 'Ajustes',
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DrawerItem(
                            icon: SFSymbols.moon_circle,
                            label: 'Modo Escuro',
                            onPressed: null,
                          ),
                          Platform.isIOS
                              ? CupertinoSwitch(
                                  value: _appStore.isDark,
                                  onChanged: (value) {
                                    _appStore.setIsDark(value);
                                    _appController.setTheme(value);
                                  },
                                  activeColor: Theme.of(context).accentColor,
                                )
                              : Switch(
                                  value: _appStore.isDark,
                                  onChanged: (value) {
                                    _appStore.setIsDark(value);
                                    _appController.setTheme(value);
                                  },
                                  activeTrackColor:
                                      Theme.of(context).accentColor,
                                  activeColor: Theme.of(context).accentColor,
                                ),
                        ],
                      ),
                      DrawerItem(
                        icon: SFSymbols.question_circle,
                        label: 'Ajuda',
                        onPressed: null,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Divider(),
                      DrawerItem(
                        icon: SFSymbols.escape,
                        label: 'Sair',
                        onPressed: null,
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingAndFavorites extends StatelessWidget {
  final double rating;
  final int favorites;

  const RatingAndFavorites({
    Key key,
    @required this.rating,
    @required this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconWithBackground(
            icon: SFSymbols.star_circle_fill,
            color: Colors.yellow[900],
            size: 22,
          ),
          SizedBox(width: 4),
          Text(
            rating.toString(),
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          IconWithBackground(
            icon: SFSymbols.heart_circle_fill,
            color: Colors.red[900],
            size: 22,
          ),
          SizedBox(width: 4),
          Text(
            favorites.toString(),
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;

  const DrawerItem({
    Key key,
    @required this.label,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  final String url;
  final String name;
  final String businessName;

  const DrawerHeader({
    Key key,
    @required this.url,
    @required this.name,
    @required this.businessName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top + 32),
          RoundedStoreLogoWidget(
            url: ImageUtils.resizeCloudinaryImageFromUrl(
              url,
              64,
              context,
            ),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            businessName,
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).primaryColor.withOpacity(.6)),
          ),
        ],
      ),
    );
  }
}
