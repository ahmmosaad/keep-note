import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keep/UIs/drawer.dart';
import 'package:keep/UIs/note_page.dart';
import 'package:keep/repo/repo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;




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
                IconButton(icon: Icon(Icons.view_list), onPressed: () {}),
                CircleAvatar(),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Text('PINNED', style: TextStyle(fontSize: 12),),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemCount: ListRepo().pins.length,
              itemBuilder: (BuildContext context, int index) => HomeNoteBox(
                title: ListRepo().pins[index].title,
                note: ListRepo().pins[index].note,
                i: index,
              ),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Text('OTHERS', style: TextStyle(fontSize: 12),),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              itemCount: ListRepo().general.length,
              itemBuilder: (BuildContext context, int index) => HomeNoteBox(
                title: ListRepo().general[index].title,
                note: ListRepo().general[index].note,
                i: index,
              ),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,

            ),
          ),

        ],
      ),
    );
  }
}

class HomeNoteBox extends StatelessWidget {
  final String title;
  final String note;
  final int i;

  const HomeNoteBox({this.title, this.note, this.i});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotePage(
          index: i,
        )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.withOpacity(.3))),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.5)),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(),
            Text(
              note,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(.7),
              ),
              maxLines: 10,
            )
          ],
        ),
      ),
    );
  }
}


