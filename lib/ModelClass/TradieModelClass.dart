class TradieModel {
  List<Data2>? data2;
  Links? links;
  Meta? meta;

  TradieModel({this.data2, this.links, this.meta});

  TradieModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data2 = <Data2>[];
      json['data'].forEach((v) {
        data2!.add(Data2.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data2 = <String, dynamic>{};
    if (this.data2 != null) {
      data2['data'] = this.data2!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data2['links'] = links!.toJson();
    }
    if (meta != null) {
      data2['meta'] = meta!.toJson();
    }
    return data2;
  }
}

class Data2 {
  int? id;
  String? businessName;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? suburb;
  String? city;
  String? region;
  Industry? industry;
  List<Tags>? tags;
  String? logo;
  String? landline;
  String? mobile;
  int? rating;

  Data2(
      {this.id,
      this.businessName,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.suburb,
      this.city,
      this.region,
      this.industry,
      this.tags,
      this.logo,
      this.landline,
      this.mobile,
      this.rating});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessName = json['business_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    suburb = json['suburb'];
    city = json['city'];
    region = json['region'];
    industry =
        json['industry'] != null ? Industry.fromJson(json['industry']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    logo = json['logo'];
    landline = json['landline'];
    mobile = json['mobile'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['business_name'] = businessName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['address'] = address;
    data['suburb'] = suburb;
    data['city'] = city;
    data['region'] = region;
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['logo'] = logo;
    data['landline'] = landline;
    data['mobile'] = mobile;
    data['rating'] = rating;
    return data;
  }
}

class Industry {
  int? id;
  String? name;

  Industry({this.id, this.name});

  Industry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? icon;

  Tags({this.id, this.name, this.icon});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  var prev;
  var next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data2 = <String, dynamic>{};
    data2['first'] = first;
    data2['last'] = last;
    data2['prev'] = prev;
    data2['next'] = next;
    return data2;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data2 = <String, dynamic>{};
    data2['current_page'] = currentPage;
    data2['from'] = from;
    data2['last_page'] = lastPage;
    if (links != null) {
      data2['links'] = links!.map((v) => v.toJson()).toList();
    }
    data2['path'] = path;
    data2['per_page'] = perPage;
    data2['to'] = to;
    data2['total'] = total;
    return data2;
  }
}
