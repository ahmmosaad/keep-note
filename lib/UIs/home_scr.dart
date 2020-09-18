import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keep/UIs/drawer.dart';
import 'package:keep/UIs/note_page.dart';
import 'package:keep/components/list_silver.dart';
import 'package:keep/components/staggred_grid.dart';
import 'package:keep/components/text_divider.dart';
import 'package:keep/repo/repo.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool staggered = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWi(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              elevation: 3,
              forceElevated: true,
              automaticallyImplyLeading: true,
              title: TextFormField(
                onChanged: (v) {},
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  hintText: 'Search for note',
                ),
              ),
              actions: [
                IconButton(
                    icon: Icon(staggered ? Icons.view_list : Icons.table_chart),
                    onPressed: () {
                      setState(() {
                        staggered = !staggered;
                      });
                    }),
                CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          // pinned
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            sliver: Text_Divider(
              section: 'Pinned',
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: staggered
                ? Staggered_grid(
                    list: Provider.of<ListRepo>(context).pins,
                  )
                : List_sliver(
                    list: Provider.of<ListRepo>(context).pins,
                  ),
          ),
          // others
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              sliver: Text_Divider(
                section: 'others',
              )),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: staggered
                ? Staggered_grid(
                    list: Provider.of<ListRepo>(context).general,
                  )
                : List_sliver(
                    list: Provider.of<ListRepo>(context).general,
                  ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotePage(
                          index: null,
                        )));
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// ignore: camel_case_types

// ignore: camel_case_types

// ignore: camel_case_types
