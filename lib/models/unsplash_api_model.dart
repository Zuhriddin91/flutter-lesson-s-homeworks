class UnsplashPhotos {
  int? total;
  int? totalPages;
  List<Results>? results;

  UnsplashPhotos({this.total, this.totalPages, this.results});

  UnsplashPhotos.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];

  }

}

class Results {
  String? id;
  String? createdAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  int? likes;
  bool? likedByUser;
  String? description;
  List<Null>? currentUserCollections;
  Urls? urls;
  Links? links;

  Results(
      {this.id,
      this.createdAt,
      this.width,
      this.height,
      this.color,
      this.blurHash,
      this.likes,
      this.likedByUser,
      this.description,
      this.currentUserCollections,
      this.urls,
      this.links});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    description = json['description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

}

class Links {
  String? self;
  String? html;
  String? photos;
  String? likes;

  Links({this.self, this.html, this.photos, this.likes});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
  }

}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

}

class Link {
  String? self;
  String? html;
  String? download;

  Link({this.self, this.html, this.download});

  Link.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
  }

}