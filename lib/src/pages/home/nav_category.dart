import 'package:flutter/material.dart';
import 'package:jezreel_app/src/bloc/home_bloc.dart';
import 'package:provider/provider.dart';
const List<String> category = ["Frutas","Verduras","Carnes","Chiles Secos","Lácteos","Golosinas"];

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context,listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: bloc.show,
      builder: (context, value,_) {
        return Positioned.fill(
          top: value?kToolbarHeight*2:0,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              const NavCategory(),
            ],
          ),
        );
      }
    );
  }
}





class NavCategory extends StatelessWidget {
  const NavCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context,listen:false);
     return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
        child:AspectRatio(
              aspectRatio:16/2,
              child: Container(
                child:ValueListenableBuilder<int>(
                  valueListenable: bloc.index,
                  builder: (context,value,_) {
                    return ListView.builder(
                      controller: bloc.categoryController,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (_,i){
                        return GestureDetector(
                          onTap: ()=>bloc.setIndex(i),
                                              child: Container(
                            margin: EdgeInsets.only(right:2),
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 12,right: 12),
                              child: Center(
                                child: Text(
                                  category[i],
                                  style: i==value?
                                    Theme.of(context).textTheme.subhead.copyWith(fontWeight:FontWeight.w600):
                                    Theme.of(context).accentTextTheme.subhead.copyWith(fontWeight:FontWeight.w600),
                                  ),
                              ),
                            ),
                            decoration: BoxDecoration(
                               border: Border(
                                  bottom:i!=value?BorderSide.none:BorderSide(width: 3.0, color: Theme.of(context).accentColor),
                                ),
                            ),
                          ),
                        );
                      });
                  }
                ),
              ),

              ),
      ),
    );
  }
}