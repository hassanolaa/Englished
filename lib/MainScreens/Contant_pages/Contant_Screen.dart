import 'package:flutter/material.dart';

import 'package:elearning/MainScreens/Contant_pages/Widgets/filter_title.dart';
import 'package:elearning/MainScreens/Contant_pages/Widgets/movie_filters.dart';
import 'package:elearning/MainScreens/Contant_pages/Widgets/search_and _filter.dart';
import 'package:provider/provider.dart';
import 'package:elearning/MainScreens/Contant_pages/Widgets/movies_grid.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Widget listViewWidget(String name,String date,String image){
    return   Container(
        width: 150,
        height: 130,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
            image:AssetImage('images/cat-lady.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  date,
                  style:TextStyle(fontWeight: FontWeight.w600, color: Colors.teal),
                ),
              ),
            ],
          ),
        ) );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SearchAndFilter(),
              SliverToBoxAdapter(
                child: MovieFilters(),
              ),
              const SliverPadding(
                padding:
                EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                sliver:
                MoviesGrid(
                 childCount: 5,
                  movieCategory: 'new_movies',
               ),

              )

            ],

          ),
        ),
      ),
    );
  }
}
