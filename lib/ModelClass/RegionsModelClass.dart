class RegionsModel {
  List<Data>? data;

  RegionsModel({this.data});

  RegionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? countryId;
  List<Cities>? cities;

  Data({this.id, this.name, this.countryId, this.cities});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  int? regionId;
  List<Suburbs>? suburbs;

  Cities({this.id, this.name, this.regionId, this.suburbs});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionId = json['region_id'];
    if (json['suburbs'] != null) {
      suburbs = <Suburbs>[];
      json['suburbs'].forEach((v) {
        suburbs!.add(Suburbs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['region_id'] = regionId;
    if (suburbs != null) {
      data['suburbs'] = suburbs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suburbs {
  int? id;
  String? name;
  int? cityId;

  Suburbs({this.id, this.name, this.cityId});

  Suburbs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    return data;
  }
}
