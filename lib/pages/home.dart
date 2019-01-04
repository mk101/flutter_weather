import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/server/server.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Server server;
  HomePage({this.title, Key key, this.server}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String curCity = 'Moscow';

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
              title: Text(curCity),
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
                      Text(getHeaderTime(),
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
                          Text('${widget.server.getCurrentWeather(curCity).dayTemp}°', style: TextStyle(
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
                      Text(widget.server.getCurrentWeather(curCity).type, style: TextStyle(
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

  getHeaderTime() {
    var time = DateTime.now();
    var format = DateFormat("dd.MM.yy");

    String d;

    switch (time.weekday) {
      case 1:
        d = 'Mon';
        break;
      case 2:
        d = 'Tue';
        break;
      case 3:
        d = 'Wed';
        break;
      case 4:
        d = 'Thu';
        break;
      case 5:
        d = 'Fri';
        break;
      case 6:
        d = 'Sat';
        break;
      case 7:
        d = 'Sun';
        break;
    }

    return '$d, ${format.format(time)}';
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

    var wethers = widget.server.getWeatherForNextWeek(curCity);

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
            Text('${wethers[i].dayTemp}°', style: TextStyle(
                fontSize: 20.0
              ),
            ),
            Text('C', style: TextStyle(
                fontSize: 16.0
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 5),),
            Text('${wethers[i].nightTemp}°', style: TextStyle(
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
