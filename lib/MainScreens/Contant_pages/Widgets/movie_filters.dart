import 'package:flutter/material.dart';



class MovieFilters extends StatefulWidget {
  int? selectedIndex;

  MovieFilters({
  super.key,
  this.selectedIndex,
  });

  @override
  State<MovieFilters> createState() => _MovieFiltersState();
}

class _MovieFiltersState extends State<MovieFilters> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              if (widget.selectedIndex != null) {
                widget.selectedIndex = index;
              }
            });
          },
          child: GestureDetector(
            onTap: (){},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              margin: EdgeInsets.only(
                  right: index == 4 ? 24 : 0, left: index == 0 ? 24 : 12),
              decoration: BoxDecoration(
                color:Colors.teal,
                borderRadius: BorderRadius.circular(100),
                border: widget.selectedIndex != null
                    ? Border.all(
                    width: 2,
                    color: Colors.teal)
                    : null,
              ),
              child: Center(
                child: Text(
                  "hassanola",
                  style: theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}