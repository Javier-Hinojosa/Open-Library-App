class SearchModel {
  SearchModel({
      this.numFound, 
      this.start,
      this.offset, 
      this.docs,});

  SearchModel.fromJson(dynamic json) {
    numFound = json['numFound'];
    start = json['start'];
    offset = json['offset'];
    if (json['docs'] != null) {
      docs = [];
      json['docs'].forEach((v) {
        docs?.add(SearchResultsModel.fromJson(v));
      });
    }
  }

  num? numFound;
  num? start;
  int? offset;
  List<SearchResultsModel>? docs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['numFound'] = numFound;
    map['start'] = start;
    map['offset'] = offset;
    if (docs != null) {
      map['docs'] = docs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SearchResultsModel {
  SearchResultsModel({
      this.authorKey, 
      this.authorName, 
      this.coverEditionKey, 
      this.coverI, 
      this.editionCount, 
      this.firstPublishYear, 
      this.hasFulltext, 
      this.ia, 
      this.iaCollectionS, 
      this.key, 
      this.language, 
      this.publicScanB, 
      this.title});

  SearchResultsModel.fromJson(dynamic json) {
    authorKey = json['author_key'] != null ? json['author_key'].cast<String>() : [];
    authorName = json['author_name'] != null ? json['author_name'].cast<String>() : [];
    coverEditionKey = json['cover_edition_key'];
    coverI = json['cover_i'];
    editionCount = json['edition_count'];
    firstPublishYear = json['first_publish_year'];
    hasFulltext = json['has_fulltext'];
    ia = json['ia'] != null ? json['ia'].cast<String>() : [];
    iaCollectionS = json['ia_collection_s'];
    key = json['key'];
    language = json['language'] != null ? json['language'].cast<String>() : [];
    publicScanB = json['public_scan_b'];
    title = json['title'];
  }
  List<String>? authorKey;
  List<String>? authorName;
  String? coverEditionKey;
  num? coverI;
  num? editionCount;
  num? firstPublishYear;
  bool? hasFulltext;
  List<String>? ia;
  String? iaCollectionS;
  String? key;
  List<String>? language;
  bool? publicScanB;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author_key'] = authorKey;
    map['author_name'] = authorName;
    map['cover_edition_key'] = coverEditionKey;
    map['cover_i'] = coverI;
    map['edition_count'] = editionCount;
    map['first_publish_year'] = firstPublishYear;
    map['has_fulltext'] = hasFulltext;
    map['ia'] = ia;
    map['ia_collection_s'] = iaCollectionS;
    map['key'] = key;
    map['language'] = language;
    map['public_scan_b'] = publicScanB;
    map['title'] = title;
    return map;
  }

}