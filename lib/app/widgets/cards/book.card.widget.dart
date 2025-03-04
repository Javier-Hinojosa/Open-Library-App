import 'package:flutter/material.dart';
import 'package:open_library/app/utils/config.utils.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/cache_Image.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:open_library/data/models/entities/search/search.model.dart';

class CustomBookCard extends StatelessWidget{
  final SearchResultsModel model;
  final void Function()? onTap;
  late final String _urlComplete;

  CustomBookCard(this.model,{this.onTap}){
    _urlComplete = ConfigUtils.convertURKBookImage(model.coverI.toString());
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCacheImage(url: _urlComplete),
            SizedBox(height: 10),
            CustomText(model.title??"",style: bodyLarge.apply(fontWeightDelta: FontWeight.bold.value)),
            CustomText(ConfigUtils.formatAuthors(model.authorName??[]), maxLines: 3)
          ])).marginAll(10));
  }

}