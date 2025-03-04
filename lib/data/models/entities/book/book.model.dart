class BookModel {
  BookModel({
      this.title, 
      this.key, 
      this.authors, 
      this.type, 
      this.description, 
      this.covers, 
      this.subjectPlaces, 
      this.subjects, 
      this.subjectPeople, 
      this.subjectTimes,
      this.latestRevision, 
      this.revision, 
      this.created,
      this.byStatement,
      this.editionName,
      this.publishers,
      this.lastModified,});

  BookModel.fromJson(dynamic json) {
    title = json['title'];
    key = json['key'];
    if (json['authors'] != null) {
      authors = [];
      json['authors'].forEach((v) {
        authors?.add(Authors.fromJson(v));
      });
    }
    byStatement= json['by_statement'];
    editionName= json['edition_name'];

    if (json['publishers'] != null) {
      publishers = [];
      json['publishers'].forEach((v) {
        publishers?.add(v);
      });
    }

    type = json['type'] != null ? Type.fromJson(json['type']) : null;

    description = json['description'] != null
        ? json['description'].runtimeType==Null || json['description'].runtimeType==String
          ? json['description']
          : json['description']["value"]
        : null;
    covers = json['covers'] != null ? json['covers'].cast<num>() : [];
    subjectPlaces = json['subject_places'] != null ? json['subject_places'].cast<String>() : [];
    subjects = json['subjects'] != null ? json['subjects'].cast<String>() : [];
    subjectPeople = json['subject_people'] != null ? json['subject_people'].cast<String>() : [];
    subjectTimes = json['subject_times'] != null ? json['subject_times'].cast<String>() : [];

    latestRevision = json['latest_revision'];
    revision = json['revision'];
    created = json['created'] != null ? Created.fromJson(json['created']) : null;
    lastModified = json['last_modified'] != null ? LastModified.fromJson(json['last_modified']) : null;
  }

  String? title;
  String? key;
  List<Authors>? authors;
  Type? type;
  String? description;
  List<num>? covers;
  List<String>? subjectPlaces;
  List<String>? subjects;
  List<String>? subjectPeople;
  List<String>? subjectTimes;
  num? latestRevision;
  num? revision;
  Created? created;
  LastModified? lastModified;
  String? byStatement;
  String? editionName;
  List<String>? publishers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['key'] = key;
    if (authors != null) {
      map['authors'] = authors?.map((v) => v.toJson()).toList();
    }
    if (type != null) {
      map['type'] = type?.toJson();
    }
    map['description'] = description;
    map['covers'] = covers;
    map['subject_places'] = subjectPlaces;
    map['subjects'] = subjects;
    map['subject_people'] = subjectPeople;
    map['subject_times'] = subjectTimes;
    map['latest_revision'] = latestRevision;
    map['revision'] = revision;
    if (created != null) {
      map['created'] = created?.toJson();
    }
    if (lastModified != null) {
      map['last_modified'] = lastModified?.toJson();
    }
    return map;
  }

}

class LastModified {
  LastModified({
      this.type, 
      this.value,});

  LastModified.fromJson(dynamic json) {
    type = json['type'];
    value = json['value'];
  }
  String? type;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['value'] = value;
    return map;
  }

}

class Created {
  Created({
      this.type, 
      this.value,});

  Created.fromJson(dynamic json) {
    type = json['type'];
    value = json['value'];
  }
  String? type;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['value'] = value;
    return map;
  }

}

class Type {
  Type({
      this.key,});

  Type.fromJson(dynamic json) {
    key = json['key'];
  }
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    return map;
  }

}

class Authors {
  Authors({
      this.author, 
  });

  Authors.fromJson(dynamic json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;

  }
  Author? author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (author != null) {
      map['author'] = author?.toJson();
    }

    return map;
  }

}

class Author {
  Author({
      this.key,});

  Author.fromJson(dynamic json) {
    key = json['key'];
  }
  String? key;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    return map;
  }

}