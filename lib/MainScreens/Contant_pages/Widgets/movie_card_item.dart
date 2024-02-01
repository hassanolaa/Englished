import 'package:elearning/MainScreens/Episode/Episode_screen.dart';
import 'package:elearning/MainScreens/test2.dart';
import 'package:flutter/material.dart';

import '../../../LogInScreen.dart';

class MovieCardItem extends StatelessWidget {
 final int itemIndex;
 final int itemCount;
 final String movieCategory;
 final bool needsSpacing;

  const MovieCardItem({
    Key? key,
    required this.itemIndex,
    required this.itemCount,
    required this.movieCategory,
    required this.needsSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder:
            (contxet)=> test2()));
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
          //  image: AssetImage('images/$movieCategory/$itemIndex.png'),
            image: AssetImage('images/cat-lady.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              'hassanola',
              style: theme.textTheme.labelSmall!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.teal),
            ),
          ),
        ),
      ),
    );
  }
}
