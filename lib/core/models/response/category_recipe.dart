part of '../models.dart';

class CategoryRecipesResponse {
  String method;
  bool status;
  List<CategoryRecipes> results;

  CategoryRecipesResponse({this.method, this.status, this.results});

  CategoryRecipesResponse.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = new List<CategoryRecipes>();
      json['results'].forEach((v) {
        results.add(new CategoryRecipes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryRecipes {
  String category;
  String url;
  String key;

  CategoryRecipes({this.category, this.url, this.key});

  CategoryRecipes.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    url = json['url'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['url'] = this.url;
    data['key'] = this.key;
    return data;
  }
}
