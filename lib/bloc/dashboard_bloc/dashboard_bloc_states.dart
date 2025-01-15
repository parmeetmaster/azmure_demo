

import 'package:equatable/equatable.dart';
//https://github.com/axiftaj/Flutter-Bloc-Clean-Coding/blob/94b969e0b9ea501c9be28a8bd793abad04f9647b/lib/bloc/movies_bloc/movies_state.dart
import 'package:meta/meta.dart';
import 'dart:convert';

class DashBoardBlocState extends Equatable{
  final String title;
  final List<Slider> sliders;
  final List<Filter> filters;

  DashBoardBlocState({
    required this.sliders,
    this.title="Training",
    required this.filters,
  });

  DashBoardBlocState copyWith({
    List<Slider>? sliders,
    List<Filter>? filters,
  }) =>
      DashBoardBlocState(
        sliders: sliders ?? this.sliders,
        filters: filters ?? this.filters,
      );

  factory DashBoardBlocState.fromRawJson(String str) => DashBoardBlocState.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashBoardBlocState.fromJson(Map<String, dynamic> json) => DashBoardBlocState(
    sliders: List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
    "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
  };

  factory DashBoardBlocState.initial() {
    return DashBoardBlocState(sliders: [], filters: [
      Filter(id: 1, title: "Location", subFilters: [
        SubFilter(isActive: false, id: 1, title: "Wes Des Moines"),
        SubFilter(isActive: false, id: 2, title: "Chicago, IL")
      ])
    ]);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [sliders,filters];
}

class Filter {
  final int id;
  final String title;
  final List<SubFilter> subFilters;

  Filter({
    required this.id,
    required this.title,
    required this.subFilters,
  });

  Filter copyWith({
    int? id,
    String? title,
    List<SubFilter>? subFilters,
  }) =>
      Filter(
        id: id ?? this.id,
        title: title ?? this.title,
        subFilters: subFilters ?? this.subFilters,
      );

  factory Filter.fromRawJson(String str) => Filter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    id: json["id"],
    title: json["title"],
    subFilters: List<SubFilter>.from(json["subFilters"].map((x) => SubFilter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subFilters": List<dynamic>.from(subFilters.map((x) => x.toJson())),
  };
}

class SubFilter {
  final bool isActive;
  final int id;
  final String title;

  SubFilter({
    required this.isActive,
    required this.id,
    required this.title,
  });

  SubFilter copyWith({
    bool? isActive,
    int? id,
    String? title,
  }) =>
      SubFilter(
        isActive: isActive ?? this.isActive,
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory SubFilter.fromRawJson(String str) => SubFilter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubFilter.fromJson(Map<String, dynamic> json) => SubFilter(
    isActive: json["isActive"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "isActive": isActive,
    "id": id,
    "title": title,
  };
}

class Slider {
  final String imageUrl;
  final String title;
  final String subTitle;

  Slider({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  Slider copyWith({
    String? imageUrl,
    String? title,
    String? subTitle,
  }) =>
      Slider(
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
      );

  factory Slider.fromRawJson(String str) => Slider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    imageUrl: json["imageUrl"],
    title: json["title"],
    subTitle: json["subTitle"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "title": title,
    "subTitle": subTitle,
  };
}
