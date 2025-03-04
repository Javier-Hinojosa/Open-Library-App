enum RequestMethod { get, post, put, patch, delete }
enum TypeImageContain { network, asset, file }

enum FilterSorts {
  relevance("","Relevancia"),
  numEditions("editions","Ediciones"),
  datePublished("old","Fecha Publicación"),
  recently("new","Recientes"),
  mostValued("rating","Valorados"),
  readingLog("currently_reading","Visto"),
  random("random","Aleatorio");
  final String value;
  final String title;
  const FilterSorts(this.value, this.title);
}
