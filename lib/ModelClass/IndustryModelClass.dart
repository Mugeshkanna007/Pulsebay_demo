class IndustryModel {
  List<Data1>? data1;

  IndustryModel({this.data1});

  IndustryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data1 = <Data1>[];
      json['data'].forEach((v) {
        data1!.add(Data1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data1 != null) {
      data['data'] = this.data1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data1 {
  int? id;
  String? name;
  String? icon;
  String? description;
  List<Tags>? tags;

  Data1({this.id, this.name, this.icon, this.description, this.tags});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['description'] = description;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? tagId;
  String? tagName;

  Tags({this.tagId, this.tagName});

  Tags.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagName = json['tag_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag_id'] = tagId;
    data['tag_name'] = tagName;
    return data;
  }
}
