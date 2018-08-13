import 'package:flutter/material.dart';
import 'baseclasses.dart';
import 'basedata.dart';



class TravelDestinationItem extends StatelessWidget {
  TravelDestinationItem({ Key key, this.destination, this.shape })
    : assert(destination != null && destination.isValid),
      super(key: key);

  static const double height = 366.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: new Card(
          shape: shape,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.asset(
                        destination.assetName,
                        fit: BoxFit.cover,
                      ),
                    ),
                    new Positioned(

                      child: new Container(
                        child: new Text(destination.title,
                          style: titleStyle,
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          boxShadow: <BoxShadow>[
                            new BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5.0,
                              offset: new Offset(5.0, 5.0),
                              ),
                          ],
                        ),
                      ),
                      left: 16.0,
                      bottom: 16.0,
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            destination.description[0],
                            style: descriptionStyle.copyWith(color: Colors.black54),
                          ),
                        ),
                        new Text(destination.description[1]),
                        new Text(destination.description[2]),
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('MAP'),
                      textColor: Colors.amber.shade500,
                      onPressed: () {
                        new SnackBar(
                          content: const Text('This would open Google Maps')
                          );
                        },
                    ),
                    new FlatButton(
                      child: const Text('WEBSITE'),
                      textColor: Colors.amber.shade500,
                      onPressed: () {
                        new SnackBar(
                          content: const Text('This would open a website')
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiamiTabs extends StatelessWidget {
  final List<Tab> appTabs = makeTabs(usaMiami);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: appTabs.length,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            isScrollable: true,
            tabs: appTabs,
          ),
          title: new Text('South Beach Miami'),
        ),
        body: new TabBarView(
          children: appTabs.map((Tab tab) {
            return new ListView(  
              itemExtent: 366.0,
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              
              children: destinations.map((TravelDestination destination) {
                 return new Container(
                   margin: const EdgeInsets.only(bottom: 8.0),
                   child: new TravelDestinationItem(destination: destination)
                 );

              }).toList()
            );

          }).toList(),
        ),

      ),
    );
  }
}

makeDestinations(BuildContext context) {

  var destTiles = <Widget>[];
  double dividerHeight = 32.0;

  destTiles.add(new Divider(
    height: dividerHeight/2,
  ));
  destTiles.add(new ListTile(
    leading: const Icon(Icons.flight_takeoff),
    isThreeLine: true,
    title: new Text("Travelling to the USA"),
    subtitle: new Text("Going via Sydney and Dallas to Miami\nDepart: Monday 25 June 2018\nArrive: Monday 25 June 2018\n"),
    onTap: () {Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MiamiTabs()),
      );}
  ));
  destTiles.add(new Divider(
    height: dividerHeight,
  ));
  destTiles.add(new ListTile(
    leading: const Icon(Icons.beach_access),
    isThreeLine: true,
    title: new Text("Miami"),
    subtitle: new Text("South Beach Miami, staying at the Betsy Hotel\nArrive: Monday 25 June 2018\nDepart: Sunday 1 July 2018\n"),
    onTap: () {Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MiamiTabs()),
      );}
  ));
  destTiles.add(new Divider(
    height: dividerHeight,
  ));
  destTiles.add(new ListTile(
    leading: const Icon(Icons.camera_alt),
    isThreeLine: true,
    title: new Text("Orlando - DisneyWorld"),
    subtitle: new Text("Staying at The Beach Club Villas\nArrive: Sunday 1 July 2018\nDepart: Thursday 5 July 2018\n"),
    onTap: () {Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MiamiTabs()),
      );}
  ));
  destTiles.add(new Divider(
    height: dividerHeight,
  ));
  destTiles.add(new ListTile(
    leading: const Icon(Icons.camera_alt),
    isThreeLine: true,
    title: new Text("Orlando - Universal Studios"),
    subtitle: new Text("Staying at Cabana Bay Beach Resort\nArrive: Thursday 5 July 2018\nDepart: Monday 9 July\n"),
    onTap: () {Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MiamiTabs()),
      );}
  ));
  destTiles.add(new Divider(
    height: dividerHeight,
  ));
  destTiles.add(new ListTile(
    leading: const Icon(Icons.local_pizza),
    isThreeLine: true,
    title: new Text("New York"),
    subtitle: new Text("The Big Apple, staying at the Stewart Hotel\nArrive: Monday 9 July\nDepart: Saturday 14 July\n"),
    onTap: () {Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MiamiTabs()),
      );}
  ));
  destTiles.add(new Divider(
    height: dividerHeight,
  ));
  destTiles.add(new ListTile(
    leading: const Icon(Icons.flight_land),
    isThreeLine: true,
    title: new Text("Heading Home"),
    subtitle: new Text("The End via LA and Sydney\nDepart: Saturday 14 July\nArrive: Monday 16 July\n"),
    onTap: () {Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MiamiTabs()),
      );}
  ));

  return destTiles;

}

class USA2018Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 
     return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            leading: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                },
              ),
            pinned: true,
            expandedHeight: 256.0,
            flexibleSpace: new FlexibleSpaceBar(
              title: const Text('USA 2018'),
              background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image.asset(
                      'images/usa.jpg',
                      fit: BoxFit.cover,
                      height: 256.0,
                    ),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[const Color(0x60000000), const Color(0x00000000)],
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),
         
          new SliverList(
              delegate: new SliverChildListDelegate(
                makeDestinations(context),
            ), 
          ),
        ],
      ),
      
      floatingActionButton: new FloatingActionButton(
        elevation: 0.0,
        child: new Icon(Icons.add),
          onPressed: (){}
        )
    );
  }

}

