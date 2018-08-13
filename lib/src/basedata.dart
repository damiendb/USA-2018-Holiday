import 'baseclasses.dart';
import 'package:flutter/material.dart';

/*

Classes and Data for the USA 2018 Holiday Pages

*/

class USA2018Activity {
  
  int activityID;
  int activityDayNum;
  DateTime activityDate;
  int activitySeq;
  List activityText;

  USA2018Activity(this.activityID, this.activityDayNum, this.activityDate, this.activitySeq, this.activityText);
}

class TravelDestination {
  const TravelDestination({
    this.assetName,
    this.title,
    this.description,
  });

  final String assetName;
  final String title;
  final List<String> description;

  bool get isValid => assetName != null && title != null && description?.length == 3;
}

var usaMiami = <String>[
  'Monday 25 June',
  'Tuesday 26 June',
  'Wednesday 27 June',
  'Thursday 28 June',
  'Friday 29 June',
  'Saturday 30 June',
  'Sunday 1 July'
];

final List<TravelDestination> destinations = <TravelDestination>[
  const TravelDestination(
    assetName: 'images/betsy_morning.jpg',
    title: 'Morning',
    description: const <String>[
      'Staying at the Betsy Hotel',
      'Breakfast Somewhere',
      'Doing something in Miami',
    ],
  ),
  const TravelDestination(
    assetName: 'images/betsy_afternoon.jpg',
    title: 'Afternoon',
    description: const <String>[
      'Staying at the Betsy Hotel',
      'Doing more stuff',
      'And even more stuff',
    ],
  ),
  const TravelDestination(
    assetName: 'images/betsy_evening.jpg',
    title: 'Evening',
    description: const <String>[
      'Staying at the Betsy Hotel',
      'Dinner somewhere',
      'Drinking somewhere',
    ],
  )
];

/*

Classes and Data for the Packing List Pages

*/

var packingCategories = <String>[
  'Clothes',
  'Electronics',
  'Toiletries'
];

//typedef Widget PackItemBodyBuilder<T>(PackingSubCategories<T> item);
typedef Widget PackItemBodyBuilder(PackingSubCategories item);
typedef String ValueToString<T>(T value);

class DualHeaderWithHint extends StatelessWidget {
  const DualHeaderWithHint({
    this.name,
    this.value,
    this.hint,
    this.showHint
  });

  final String name;
  final String value;
  final String hint;
  final bool showHint;

  Widget _crossFade(Widget first, Widget second, bool isExpanded) {
    return new AnimatedCrossFade(
      firstChild: first,
      secondChild: second,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return new Row(
      children: <Widget>[
        new Expanded(
          flex: 2,
          child: new Container(
            margin: const EdgeInsets.only(left: 24.0),
            child: new FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: new Text(
                name,
                style: textTheme.body1.copyWith(fontSize: 15.0),
              ),
            ),
          ),
        ),
        new Expanded(
          flex: 3,
          child: new Container(
            margin: const EdgeInsets.only(left: 24.0),
            child: _crossFade(
              new Text(value, style: textTheme.caption.copyWith(fontSize: 15.0)),
              new Text(hint, style: textTheme.caption.copyWith(fontSize: 15.0)),
              showHint
            )
          )
        )
      ]
    );
  }
}

class CollapsibleBody extends StatelessWidget {
  const CollapsibleBody({
    this.margin: EdgeInsets.zero,
    this.child,
    this.onSave,
    this.onCancel
  });

  final EdgeInsets margin;
  final Widget child;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return new Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            bottom: 24.0
          ) - margin,
          child: new Center(
            child: new DefaultTextStyle(
              style: textTheme.caption.copyWith(fontSize: 15.0),
              child: child
            )
          )
        ),
        const Divider(height: 1.0),
        new Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: new FlatButton(
                  onPressed: onCancel,
                  child: const Text('CANCEL', style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500
                  ))
                )
              ),
              new Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: new FlatButton(
                  onPressed: onSave,
                  textTheme: ButtonTextTheme.accent,
                  child: const Text('SAVE')
                )
              )
            ]
          )
        )
      ]
    );
  }
}

//class PackingSubCategories<T> {
class PackingSubCategories {
  PackingSubCategories({
    this.categoryID,
    this.packingSubCategory,
    this.value,
    this.bag,
    this.hint,
    this.collective,
    //this.builder,
    //this.valueToString,
 // }) : textController = new TextEditingController(text: valueToString(value));
  });

  int categoryID;
  String packingSubCategory;
  int value;
  String bag;
  String hint;
  String collective;
  //final TextEditingController textController;
  //PackItemBodyBuilder<T> builder;
  //PackItemBodyBuilder builder;
  //final ValueToString<T> valueToString;
 
  bool isExpanded = false;

  // ExpansionPanelHeaderBuilder get headerBuilder {
  //     return (BuildContext context, bool isExpanded) {
  //       return new DualHeaderWithHint(
  //         name: packingSubCategory,
  //         //value: valueToString(value),
  //         value: value.toString(),
  //         hint: hint,
  //         showHint: isExpanded
  //       );
  //     };
  //   }
  
  //Widget build() => builder(this);

}

final List<PackingSubCategories> allpackingItems = <PackingSubCategories>[

  PackingSubCategories(categoryID: 0, packingSubCategory: 'Shirts', value: 0, bag: "Suitcase", collective: "shirt", hint: "Taking 0"),
  PackingSubCategories(categoryID: 0, packingSubCategory: 'Pants', value: 0, bag: "Suitcase", collective: "pair", hint: "Taking 0"),
  PackingSubCategories(categoryID: 0, packingSubCategory: 'Shorts', value: 0, bag: "Suitcase", collective: "pair", hint: "Taking 0"),
  PackingSubCategories(categoryID: 0, packingSubCategory: 'Shoes', value: 0, bag: "Suitcase", collective: "pair", hint: "Taking 0"),

  PackingSubCategories(categoryID: 1, packingSubCategory: 'Laptop', value: 0, bag: "Carry On", collective: "laptop", hint: "Taking 0"),
  PackingSubCategories(categoryID: 1, packingSubCategory: 'Chargers', value: 0, bag: "Carry On", collective: "laptop charger", hint: "Taking 0"),

  PackingSubCategories(categoryID: 2, packingSubCategory: 'Toothbrush', value: 0, bag: "Suitcase", collective: "toothbrush", hint: "Taking 0"),
  PackingSubCategories(categoryID: 2, packingSubCategory: 'Tooth Paste', value: 0, bag: "Suitcase", collective: "tube", hint: "Taking 0"),

];

dayList(int daynum, int seq) {

    var thisdayActivities = new List(); 

    switch(daynum) {
    case 1:
      switch(seq) {
        case 1:
          thisdayActivities.add('Get\n out\n of\n bed\n Damien');
          thisdayActivities.add('Depart Perth');
          break;
        case 2:
          thisdayActivities.add(r'Get out of bed');
          thisdayActivities.add(r'Depart Perth');
          break;
        case 3:
          thisdayActivities.add(r'Get out of bed');
          thisdayActivities.add(r'Depart Perth');
          break;
      }
      break;
    case 2:
      switch(seq) {
        case 1:
          thisdayActivities.add(r'Get out of bed');
          thisdayActivities.add(r'Depart Perth');
          break;
        case 2:
          thisdayActivities.add(r'Get out of bed');
          thisdayActivities.add(r'Depart Perth');
          break;
        case 3:
          thisdayActivities.add(r'Get out of bed');
          thisdayActivities.add(r'Depart Perth');
          break;
      }
  }

  return thisdayActivities;

}

