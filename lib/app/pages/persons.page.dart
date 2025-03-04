import 'package:flutter/material.dart';
import 'package:open_library/app/providers/person.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/appbar/app_bar.widget.dart';
import 'package:open_library/app/widgets/cards/person.card.widget.dart';
import 'package:open_library/app/widgets/loading.screen.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/routes/routes.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:provider/provider.dart';

class PersonsPage extends StatefulWidget{
  @override
  State<PersonsPage> createState() => _PersonsPageState();
}

class _PersonsPageState extends State<PersonsPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PersonsProvider>().fetchData();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Icon(Icons.person_add_outlined),
          onPressed: ()=>NavigationService.navigateTo(Routes.registerPerson)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText("Mis regsitros",style: titleLarge),
            SizedBox(height: 20),
            Consumer<PersonsProvider>(
                builder: (context, provider, child) {
                  if(provider.loading)
                    return LoadingScreen();
                  else
                    return ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                        children:ListTile.divideTiles(
                            color: Colors.transparent,
                            tiles: provider.persons.map((e) => CustomPersonCard(e))
                        ).toList());
                })
          ])).paddingAll(10));
  }
}