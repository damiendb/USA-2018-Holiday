import 'package:flutter/material.dart';
import 'baseclasses.dart';
import 'basedata.dart';


makePackingPanels(List<PackingSubCategories> panelNames, int numCategory) {
  final List<String> panelList = <String>[]; 
  int numSubCats = panelNames.length;

  for (var i = 0; i < numSubCats; i++) {
    if (panelNames[i].categoryID == numCategory) {
      panelList.add(panelNames[i].toString());
    }
  }
  return panelList;
}

class PackingListPanels extends StatefulWidget {
  PackingListPanels({Key key, this.catID, this.shape})
    : assert(catID != null),
      super (key: key);

  int catID;
  final ShapeBorder shape;
  
  @override
  _MyPanelState createState() => new _MyPanelState(catID: catID);
}

class _MyPanelState extends State<PackingListPanels>
    with SingleTickerProviderStateMixin  {
      _MyPanelState({Key key, this.catID, this.shape});

  int catID;  
  final ShapeBorder shape;

  var _packItems = new List<PackingSubCategories>();

  @override
  void initState() {
    super.initState();

    int numSubCats = allpackingItems.length;
    int numItems = 0;

    for (var i = 0; i < numSubCats; i++) {
      if (allpackingItems[i].categoryID == catID) {

        _packItems.add(allpackingItems[i]);

        // _packItems[numItems].builder =  (PackingSubCategories item) {
        //   void close() {
        //     setState(() {
        //       item.isExpanded = false;
        //     });
        //   }
        //   return new Form (
        //     child: new Builder(
        //       builder: (BuildContext context) {
        //         return new CollapsibleBody(
        //           margin: const EdgeInsets.symmetric(horizontal: 16.0),
        //           onSave: () { Form.of(context).save(); close(); },
        //           onCancel: () { Form.of(context).reset(); close(); },
        //           child: new Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //             child: new TextFormField(
        //               controller: item.textController,
        //               decoration: new InputDecoration(
        //                 hintText: item.hint,
        //                 labelText: item.packingSubCategory,
        //               ),
        //               onSaved: (String value) { item.value = value; },
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ); 
        //};

        numItems++;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  static const double height = 366.0;

  @override
  Widget build(BuildContext context) {
    
    return new SingleChildScrollView(
   
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new Container(
          margin: const EdgeInsets.all(24.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _packItems[index].isExpanded = !isExpanded;                     
              });
            },
            children: _packItems.map((PackingSubCategories item) {                
              return new ExpansionPanel(
                isExpanded: item.isExpanded,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new DualHeaderWithHint(
                      name: item.packingSubCategory,
                      value: item.value.toString(),
                      hint: item.hint,
                      showHint: item.isExpanded
                    );
                },
                
                //So I think the headerbuilder above works.
                //Now just sort out the body build part.
                //Maybe test first with a simple debug text statement in the body
                body: new Text ('Damien debug statement in the Expansion Panel body')
                // body: item.build()

              );
            }).toList()
          ),
        ),
      ),
    );
  }
}

class PackingListPage extends StatefulWidget {
  const PackingListPage({Key key}) : super(key: key);
  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<PackingListPage>
    with SingleTickerProviderStateMixin  {

  List<Tab> appTabs = makeTabs(packingCategories);
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: appTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: appTabs.length,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: appTabs,
          ),
          title: new Text('Packing List'),
          leading: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                },
              ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: appTabs.map((Tab tab) {
            
            return new PackingListPanels(catID: appTabs.indexOf(tab));
            
          }).toList(),
        ),
      ),
    );
  }
}

