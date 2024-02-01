import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

import 'modal_item.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({
  super.key,
  });

  @override
  State<SearchAndFilter> createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            SearchField(),
            SizedBox(width: 12),
            FilterButton(),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: 56,
        height: 56,
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color:Colors.teal,
        ),
        child:Icon(Icons.filter_list_sharp,color: Colors.white,size: 25,),
        ),
      );

  }
}

class SearchField extends StatefulWidget {
  const SearchField({
  super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    searchFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer(
      builder: (context, value, child) => Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 56,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:Colors.white,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            focusNode: searchFocusNode,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search',
              hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize:20,
                  fontWeight: FontWeight.w500),
              icon: Icon(CupertinoIcons.search,color: Colors.white,size: 30,),
              ),
            ),
          ),
        ),
      );

  }
}


