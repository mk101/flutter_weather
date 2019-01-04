import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title, Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            expandedHeight: 350.0,
            actions: getActions(),
            leading: IconButton(
              icon: Icon(Icons.near_me),
              onPressed: () {},
              color: Colors.white,
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Moscow'),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
              background: Container(
                color: Theme.of(context).primaryColor,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text('Now',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Text('FRI, 04.01.19',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 12.0
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 80.0),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('-7°', style: TextStyle(
                              color: Colors.white,
                              fontSize: 54.0
                            ),
                          ),
                          Text('C', style: TextStyle(
                              color: Colors.white,
                              fontSize: 34.0
                            ),
                          ),
                        ],
                      ),
                      Text('Cloudy', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 14.0
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 9.0, left: 10.0),
                  child: Text('Next week', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(getWeekItems()),
          ),
        ],
      ),
    );
  }
  
  getActions() {
    return <Widget> [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.settings),
        color: Colors.white,
      )
    ];
  }

  getWeekItems() {
    var widgets = <Widget>[];

    var time = DateTime.now();
    var format = DateFormat("dd.MM.yy");

    for (int i = 0; i < 7; i++) {
      String d;

      if (i == 0) {
        d = 'Today,';
      } else if (i == 1) {
        d = 'Tomorrow,';
      } else {
        switch (time.weekday) {
          case 1:
            d = 'Monday,';
            break;
          case 2:
            d = 'Tuesday,';
            break;
          case 3:
            d = 'Wednesday,';
            break;
          case 4:
            d = 'Thursday,';
            break;
          case 5:
            d = 'Friday,';
            break;
          case 6:
            d = 'Saturday,';
            break;
          case 7:
            d = 'Sunday,';
            break;
        }
      }

      var timeString = format.format(time);

      time = time.add(Duration(days: 1));

      widgets.add(ListTile(
        title: Text(d, style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20
        ),
        ),
        subtitle: Text(timeString, style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w100,
            color: Colors.black
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('-8°', style: TextStyle(
                fontSize: 20.0
              ),
            ),
            Text('C', style: TextStyle(
                fontSize: 16.0
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 5),),
            Text('-9°', style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300
              ),
            ),
            Text('C', style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
      ));
    }

    return widgets;
  }
}
