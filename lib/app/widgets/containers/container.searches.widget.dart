import 'package:flutter/material.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/config.utils.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/cards/book.card.widget.dart';
import 'package:open_library/app/widgets/containers/container.shimmer.widget.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/routes/routes.dart';
import 'package:open_library/core/values/paths.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:open_library/data/models/entities/search/search.model.dart';

class ContainerSearches extends StatelessWidget{
  final String? title;
  final List<SearchResultsModel> searchResults;
  final bool isLoading;

  ContainerSearches({required this.searchResults,this.isLoading=false, this.title });
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(title!=null)
                CustomText(title!,style: labelLarge),
                //CustomText("Mostrar mas",style: bodyMedium.apply(decoration: TextDecoration.underline))
              ]),
          Visibility(
              visible: !isLoading,
              replacement: Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => CustomShimmer(
                          width: MediaQuery.of(context).size.width*0.4,
                          height: MediaQuery.of(context).size.height*0.25))),
              child: Visibility(
                  visible: searchResults.isNotEmpty,
                  replacement: Container(
                      height: MediaQuery.of(context).size.height*0.37,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(Paths.notFoundResults)),
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.37,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: ListTile.divideTiles(
                              color: Colors.transparent,
                              tiles: searchResults.map((e) => CustomBookCard(e,
                                  onTap: ()=> NavigationService.navigateTo(Routes.bookDetail,
                                      arguments: "${e.key},${e.coverI},${ConfigUtils.formatAuthors(e.authorName??[])}")
                              ))).toList()))))
        ]).paddingAll(20);
  }

}