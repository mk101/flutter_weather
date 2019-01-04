import 'package:flutter/material.dart';

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

              ],
            ),
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
}
