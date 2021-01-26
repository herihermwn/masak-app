part of '../models.dart';

class NewRecipesResponse {
  String method;
  bool status;
  List<Recipes> results;

  NewRecipesResponse({String method, bool status, List<Recipes> results}) {
    this.method = method;
    this.status = status;
    this.results = results;
  }

  NewRecipesResponse.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    status = json['status'];
    if (json['results'] != null) {
      results = new List<Recipes>();
      json['results'].forEach((v) {
        results.add(new Recipes.fromJson(v));
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

class Recipes {
  String title;
  String thumb;
  String key;
  String times;
  String portion;
  String dificulty;

  Recipes(
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

  Recipes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    portion = json['portion'];
    dificulty = json['dificulty'];
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
