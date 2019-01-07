import 'package:flutter/material.dart';
import 'package:weather/data/string.dart';
import 'package:weather/server/server.dart';

class SettingsPage extends StatefulWidget {
  final Server server;

  SettingsPage({this.server});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(Strings.getValue('SETTINGS')),
            pinned: true,
            floating: true,
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 14),
                  child: Text(Strings.getValue('GENERAL'), style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25
                  ),),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      widget.server.isC = !widget.server.isC;
                    });
                  },
                  title: Text(Strings.getValue('TEMPERATURE')),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      widget.server.isC? FlatButton(
                        onPressed: () { setState(() {widget.server.isC = true;}); },
                        child: Text('°C'),
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.symmetric(vertical: 11.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), topLeft: Radius.circular(4))),
                      ) : OutlineButton(
                        onPressed: () { setState(() {widget.server.isC = true;}); },
                        child: Text('°C'),
                        textColor: Theme.of(context).accentColor,
                        borderSide: BorderSide(color: Theme.of(context).accentColor, width: 3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), topLeft: Radius.circular(4))),
                        padding: EdgeInsets.all(0),
                      ),
                      widget.server.isC ? OutlineButton(
                        onPressed: () { setState(() {widget.server.isC = false;}); },
                        child: Text('°F'),
                        textColor: Theme.of(context).accentColor,
                        borderSide: BorderSide(color: Theme.of(context).accentColor, width: 3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(4), topRight: Radius.circular(4))),
                      ) : FlatButton(
                        onPressed: () { setState(() {widget.server.isC = false;}); },
                        child: Text('°F'),
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        padding: EdgeInsets.symmetric(vertical: 11.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(4), topRight: Radius.circular(4))),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(Strings.getValue('LANGUAGE')),
                  subtitle: Text(Strings.getValue(Strings.curLang)),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(Strings.getValue('CHOOSELANG')),
                          children: _getLangList(),
                        );
                      }
                    );
                  },
                )
              ]
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getLangList() {
    List<Widget> list = [];
    var w = Strings.getLanguages().map((f) => FlatButton(
      onPressed: () {
        Strings.curLang = f;
        Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
      },
      child: Text(Strings.getValue(f)),
    )).toList();

    list = List.from(w);

    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          onPressed: () {
           Navigator.pop(context);
          },
          child: Text(Strings.getValue('CANSEL'),style: TextStyle(color: Theme.of(context).accentColor),),
        )
      ],
    ));

    return list;
  }
}
