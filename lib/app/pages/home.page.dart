import 'package:flutter/material.dart';
import 'package:open_library/app/providers/home.provider.dart';
import 'package:open_library/app/providers/search.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/widgets/appbar/appbar_search.widget.dart';
import 'package:open_library/app/widgets/containers/container.searches.widget.dart';
import 'package:open_library/core/routes/routes.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
     super.initState();

     WidgetsBinding.instance.addPostFrameCallback((_) {
       context.read<HomeProvider>()
         ..fetchDataPrincipalResults()
         ..fetchDataBestSheller()
         ..fetchDataEditorChoice();
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBarSearch(),
      floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Icon(Icons.person_outline),
          onPressed: ()=> NavigationService.navigateTo(Routes.persons)),
      body: RefreshIndicator(
        onRefresh: () async =>
        context.read<HomeProvider>()
          ..fetchDataPrincipalResults()
          ..fetchDataBestSheller()
          ..fetchDataEditorChoice(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
              children: [
                _searchingContainer(),
                Consumer<HomeProvider>(
                    builder: (context, homeProvider, child) {
                      return Column(
                        children: [
                          ContainerSearches(
                        title: "Recomendaciones",
                        isLoading: homeProvider.loadingPrincipalResults,
                        searchResults: homeProvider.principalResults),
                          ContainerSearches(
                              title: "Best Sheller",
                              isLoading: homeProvider.loadingBestSheller,
                              searchResults: homeProvider.bestSheller),
                          ContainerSearches(
                              title: "Editor's Choice",
                              isLoading: homeProvider.loadingEditorChoice,
                              searchResults: homeProvider.editorChoice)
                    ]
                  );})
              ])
        ),
      ));
  }

 Widget _searchingContainer(){
    return Consumer<SearchProvider>(
        builder: (context, searchProvider, child) {
        return  Visibility(
          visible: searchProvider.isActive,
          child: ContainerSearches(
            title: "Resultados",
            searchResults: searchProvider.searchResults,
            isLoading: searchProvider.loadingSearch
          ));
        });
    }
}
