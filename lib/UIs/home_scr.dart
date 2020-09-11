import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keep/repo/repo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      drawer: Container(
        height: size.height,
        width: size.width / 1.5,
        color: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .padding
                  .top,
            ),
          ),
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
                SizedBox(width: 5,)
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
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2 / 2.5
              ),
              delegate: SliverChildBuilderDelegate(
                ((context, i) {
                  return HomeNoteContainer(
                    title: ListRepo().pins[i].title,
                    text: ListRepo().pins[i].note,
                  );
                }),
                childCount: ListRepo().pins.length,
                
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            sliver: SliverToBoxAdapter(
              child: Text('OTHERS', style: TextStyle(fontSize: 12),),
            ),
          ),

         SliverToBoxAdapter(
           child: StaggeredGridView.builder(
               scrollDirection: Axis.vertical,
               shrinkWrap: true,
               gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 staggeredTileBuilder: (int index) =>
                 new StaggeredTile.count(2, index.isEven ? 2 : 1),
               ),
               itemCount: ListRepo().general.length,
               itemBuilder: (context , i){
                 return HomeNoteContainer(
                   text: ListRepo().general[i].note,
                   title:  ListRepo().general[i].title,
                 );
               }),
         ),
        ],
      ),
    );
  }
}






class HomeNoteContainer extends StatelessWidget {
  final String text;
  final String title;

  HomeNoteContainer({this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: Colors.grey.withOpacity(.3)
          )
      ),
      padding: EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, maxLines: 1,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(.5)),
            overflow: TextOverflow.ellipsis,),
          Divider(),
          Expanded(child: Text(text, style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(.7)),),)
        ],
      ),
    );
  }
}
