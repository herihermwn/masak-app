part of '../models.dart';

class RecipesResponse {
  String method;
  bool status;
  List<Recipe> results;

  RecipesResponse({String method, bool status, List<Recipe> results}) {
    this.method = method;
    this.status = status;
    this.results = results;
  }

  RecipesResponse.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = new List<Recipe>();
      json['results'].forEach((v) {
        results.add(new Recipe.fromJson(v));
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

class Recipe {
  String title;
  String thumb;
  String key;
  String times;
  String portion;
  String dificulty;

  Recipe(
      {String title,
      String thumb,
      String key,
      String times,
      String portion,
      String dificulty}) {
    this.title = title;
    this.thumb = thumb;
    this.key = key;
    this.times = times;
    this.portion = portion;
    this.dificulty = dificulty;
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    dificulty = json['dificulty'];

    if (json['portion'] == "") {
      this.portion = "- Porsi";
    } else {
      portion = json['portion'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['thumb'] = this.thumb;
    data['key'] = this.key;
    data['times'] = this.times;
    data['portion'] = this.portion;
    data['dificulty'] = this.dificulty;
    return data;
  }
}
