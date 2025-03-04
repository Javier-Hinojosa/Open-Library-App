import 'package:flutter/material.dart';
import 'package:open_library/app/providers/book_detail.provider.dart';
import 'package:open_library/app/utils/config.utils.dart';
import 'package:open_library/app/widgets/loading.screen.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/appbar/app_bar.widget.dart';
import 'package:open_library/app/widgets/cache_Image.dart';
import 'package:open_library/app/widgets/rating.widget.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:provider/provider.dart';


class BookDetailPage extends StatefulWidget{

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookDetailProvider>().fetchData(context);
    });

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(),
     body: Consumer<BookDetailProvider>(
       builder: (context, provider, child) {
         if(provider.isLoading)
           return LoadingScreen();
         else
           return SingleChildScrollView(
             child: Column(
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(
                         width: MediaQuery.of(context).size.width * 0.4,
                         height: MediaQuery.of(context).size.height * 0.3,
                         child: CustomCacheImage(url: provider.coverI)),
                     SizedBox(width: 10),
                     Flexible(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           CustomText(provider.bookModel.title??"S/N",style: labelLarge),
                           SizedBox(height: 10),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               CustomText("Autor: ",style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
                               Flexible(child: CustomText(provider.bookModel.byStatement??provider.author, style: bodyMedium, maxLines: 3))
                             ]),
                           SizedBox(height: 10),
                           if(provider.bookModel.editionName!=null)...[
                           Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomText("Edición: ",style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
                                 Flexible(child: CustomText(provider.bookModel.editionName??"", style: bodyMedium, maxLines: 3))
                               ]),
                           SizedBox(height: 10)
                           ],
                           if(provider.bookModel.publishers!=null)...[
                             Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   CustomText("publicado: ",style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
                                   Flexible(child: CustomText(ConfigUtils.formatListText(provider.bookModel.publishers??[]), style: bodyMedium, maxLines: 3))
                                 ]),
                           SizedBox(height: 10)
                           ],
                           if(provider.ratingModel.summary!=null)...[
                             CustomText("Calificación: ",style: bodyMedium.apply(fontWeightDelta: FontWeight.bold.value)),
                             RatingWidget(rating: provider.ratingModel.summary?.average??0)
                         ]
                 ]))
                   ]),
                 SizedBox(height: 10),
                 CustomText(provider.bookModel.description??"",
                     maxLines: 100,
                     style: bodyMedium.apply(color: Colors.black87)).paddingAll(5)
               ])).paddingAll(10);
       }));
  }
}