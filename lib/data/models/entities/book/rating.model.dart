class RatingModel {
  RatingModel({
      this.summary
  });

  RatingModel.fromJson(dynamic json) {
    summary = json['summary'] != null ? Summary.fromJson(json['summary']) : null;

  }
  Summary? summary;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (summary != null) {
      map['summary'] = summary?.toJson();
    }
    return map;
  }

}

class Summary {
  Summary({
      this.average, 
      this.count, 
      this.sortable,});

  Summary.fromJson(dynamic json) {
    average = json['average'];
    count = json['count'];
    sortable = json['sortable'];
  }
  double? average;
  num? count;
  num? sortable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['average'] = average;
    map['count'] = count;
    map['sortable'] = sortable;
    return map;
  }

}