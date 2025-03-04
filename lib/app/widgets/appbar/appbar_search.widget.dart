import 'package:flutter/material.dart';
import 'package:open_library/app/providers/search.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/app/utils/dialog.utils.dart';
import 'package:open_library/app/utils/input_decoration.utils.dart';
import 'package:open_library/app/utils/widget_extensions.dart';
import 'package:open_library/app/widgets/buttons/button.widget.dart';
import 'package:open_library/app/widgets/buttons/icon_button.widget.dart';
import 'package:open_library/app/widgets/reactives/reactive_text_field.widget.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/globals.dart';
import 'package:open_library/core/values/keys.dart';
import 'package:open_library/core/values/text.styles.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms/src/models/models.dart';

class CustomAppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarSearch({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 2,
      actions: [
        CustomIconButton(
          icon: Icons.book_outlined,
          size: 36,
          onPressed: () {}
        ).paddingOnly(right: 16,top: 10)
      ],
      leadingWidth: MediaQuery.of(context).size.width * 0.7,
      leading: CustomText("Listo para leer?", style: titleLarge).paddingOnly(left: 16,top: 10),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(80), // Ajustar la altura del `bottom`
        child: _textField())).paddingAll(10);
  }


 Widget _textField(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Espaciado
        child: Consumer<SearchProvider>(
            builder: (context, searchProvider, child) {
              return Container(
                  height: 45, // Altura definida para evitar compresión
                  child: TextField(
                      controller: searchProvider.searchController,
                      autofocus: false,
                      onSubmitted: searchProvider.onSearch,
                      onChanged: searchProvider.toggleSearch,
                      decoration: InputDecorationUtils.outLineText(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Buscar por autor o título',
                          suffixIcon: searchProvider.isEmpty
                              ? CustomIconButton(icon: Icons.filter_alt_outlined,
                              color: searchProvider.hasFilter?Globals.primaryColor:null,
                              backgroundColor: searchProvider.hasFilter?Globals.primaryColor.withValues(alpha: 0.1):null,
                              onPressed: ()=> onFilterSearch(searchProvider))
                              : CustomIconButton(icon: Icons.close, onPressed: searchProvider.clearSearch))
                      ));
            }));
 }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 80); // Asegurar espacio extra para el TextField

  void  onFilterSearch(SearchProvider searchProvider){
    DialogUtils.screen(NavigationService.context,
        height: 0.52,
        child: ReactiveForm(formGroup: searchProvider.filtersForm,
            child: Column(
             children: [
               Align(
                   alignment: Alignment.centerLeft,
                   child: CustomText("Busqueda por:",
                       style: titleLarge)),
               SizedBox(height: MediaQuery.of(NavigationService.context).size.height*0.01),
               CustomReactiveTextField(Keys.author,
                   paddingAll: 0,
                   labelText: "Autor",
                   hintText: "Ej: Stephen King"),
               SizedBox(height: MediaQuery.of(NavigationService.context).size.height*0.02),
               CustomReactiveTextField(Keys.book,
                   paddingAll: 0,
                   labelText: "Titulo",
                   hintText: "Ej: La llamada de Cthulhu"),
               SizedBox(height: MediaQuery.of(NavigationService.context).size.height*0.02),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   CustomButton(
                       width: MediaQuery.of(NavigationService.context).size.width*0.25,
                       title: "Limpiar",
                       backgroundColor: Globals.backgroundColor,
                       onPressed: searchProvider.clearFilters),
                   CustomButton(
                     width: MediaQuery.of(NavigationService.context).size.width*0.3,
                       title: "Aceptar",
                       onPressed: () {
                       NavigationService.goBack();
                       searchProvider.onSearch("");
                     }),
                 ],
               )
             ])).paddingAll(10));
  }

}
