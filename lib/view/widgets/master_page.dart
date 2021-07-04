import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:settings/view/pages/menu_items.dart';
import 'package:settings/view/widgets/detail_page.dart';
import 'package:settings/view/widgets/detail_route.dart';
import 'package:settings/view/widgets/menu_item.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  MasterPageState createState() => MasterPageState();
}

class MasterPageState extends State<MasterPage> {
  late MenuItem selectedMenuItem;

  @override
  void initState() {
    selectedMenuItem = menuItems.first;
    super.initState();
    // goToDetail(menuItems.indexOf(selectedMenuItem));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: const Icon(Icons.search),
          title: const Text('Settings'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Icon(menuItems[index].iconData),
                    selected: menuItems[index] == selectedMenuItem,
                    title: Text(menuItems[index].name),
                    onTap: () {
                      setState(() => goToDetail(index));
                    });
              }),
        ));
  }

  void goToDetail(int index) {
    selectedMenuItem = menuItems[index];
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(DetailRoute(
        builder: (context) => DetailPage(
              item: selectedMenuItem,
            )));
  }
}
