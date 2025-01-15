import 'package:equatable/equatable.dart';

//https://github.com/axiftaj/Flutter-Bloc-Clean-Coding/blob/94b969e0b9ea501c9be28a8bd793abad04f9647b/lib/bloc/movies_bloc/movies_state.dart
import 'package:meta/meta.dart';
import 'dart:convert';

class DashBoardModel extends Equatable {
  final String title;
  final List<SliderClousalModel> sliders;
  final List<Filter> filters;

  DashBoardModel({
    required this.sliders,
    this.title = "Training",
    required this.filters,
  });

  DashBoardModel copyWith({
    List<SliderClousalModel>? sliders,
    List<Filter>? filters,
  }) =>
      DashBoardModel(
        sliders: sliders ?? this.sliders,
        filters: filters ?? this.filters,
      );

  factory DashBoardModel.fromRawJson(String str) =>
      DashBoardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        sliders: List<SliderClousalModel>.from(
            json["sliders"].map((x) => SliderClousalModel.fromJson(x))),
        filters:
            List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
        "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
      };

  factory DashBoardModel.initial() {
    return DashBoardModel(sliders: [
      SliderClousalModel(
          imageUrl:
              "https://media.istockphoto.com/id/136192949/photo/university-of-tennessee-hill.jpg?s=612x612&w=0&k=20&c=KF6ujCeGT1tIseDHm6dsQ5LeoiXnl5v3MhHj_wuQ5fA=",
          title: "Safe Scrum Masters",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          subTitle: "West DES Moines, IA 30 Oct - 31 Oct",
          strikePrice: 885,
          price: 628),
      SliderClousalModel(
          imageUrl:
              "https://img.freepik.com/free-vector/hand-drawn-study-abroad-horizontal-banner_23-2150272554.jpg",
          title: "Abroad Mba",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          subTitle: "Study in Washinton",
          strikePrice: 250,
          price: 225, ),
      SliderClousalModel(
          imageUrl:
              "https://c8.alamy.com/comp/2ARJ2XA/promotional-cover-for-travel-article-for-visiting-tallinn-estonia-with-5-images-2ARJ2XA.jpg",
          title: "Abroad MCA",
          subTitle: "Study in Utopia",
          strikePrice: 280,
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",

          price: 200),
      SliderClousalModel(
          imageUrl:
              "https://www.shutterstock.com/image-photo/radcliffe-quadrangle-the-quad-harvard-260nw-396023383.jpg",
          title: "Haward B.TECH",
          subTitle: "Study in Vegas",
          strikePrice: 660,
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",

          price: 662),
    ], filters: [
      Filter(
        id: 1,
        isActive: true,
        title: "Sort By",
        subFilters: [
          SubFilter(isActive: false, id: 1, title: "Sort by name"),
          SubFilter(isActive: false, id: 2, title: "Sort by Subscription")
        ],
      ),
      Filter(id: 2, title: "Location", subFilters: [
        SubFilter(isActive: false, id: 1, title: "Wes Des Moines"),
        SubFilter(isActive: false, id: 2, title: "Chicago, IL")
      ]),
      Filter(id: 3, title: "Training Name", subFilters: [
        SubFilter(isActive: false, id: 1, title: "BCA"),
        SubFilter(isActive: false, id: 2, title: "MCA")
      ]),
      Filter(id: 4, title: "Trainer", subFilters: [
        SubFilter(isActive: false, id: 1, title: "Sanjeev"),
        SubFilter(isActive: false, id: 2, title: "Madhav")
      ])
    ]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sliders, filters];
}

class Filter {
  final int id;
  final String title;
  bool isActive;
  final List<SubFilter> subFilters;

  Filter({
    required this.id,
    required this.title,
    this.isActive = false,
    required this.subFilters,
  });

  Filter copyWith({
    int? id,
    String? title,
    bool? isActive,
    List<SubFilter>? subFilters,
  }) =>
      Filter(
        id: id ?? this.id,
        title: title ?? this.title,
        isActive: isActive ?? this.isActive,
        subFilters: subFilters ?? this.subFilters,
      );

  factory Filter.fromRawJson(String str) => Filter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        id: json["id"],
        title: json["title"],
        isActive: json["isActive"],
        subFilters: List<SubFilter>.from(
            json["subFilters"].map((x) => Filter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isActive": isActive,
        "subFilters": List<dynamic>.from(subFilters.map((x) => x.toJson())),
      };
}

class SubFilter {
  bool isActive;
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

  factory SubFilter.fromRawJson(String str) =>
      SubFilter.fromJson(json.decode(str));

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

class SliderClousalModel {
  final String imageUrl;
  final String title;
  final String subTitle;
  final int strikePrice;
  final int price;
  final String description;

  SliderClousalModel(
      {required this.imageUrl,
      required this.title,
      required this.subTitle,
      required this.strikePrice,
      required this.price,
      required this.description});

  SliderClousalModel copyWith({
    String? imageUrl,
    String? title,
    String? subTitle,
    int? strikePrice,
    int? price,
  }) =>
      SliderClousalModel(
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        description: description ?? this.description,
        subTitle: subTitle ?? this.subTitle,
        strikePrice: strikePrice ?? this.strikePrice,
        price: price ?? this.price,
      );

  factory SliderClousalModel.fromRawJson(String str) =>
      SliderClousalModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderClousalModel.fromJson(Map<String, dynamic> json) =>
      SliderClousalModel(
        imageUrl: json["imageUrl"],
        title: json["title"],
        description: json["description"],
        subTitle: json["subTitle"],
        strikePrice: json["strikePrice"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "title": title,
        "subTitle": subTitle,
        "strikePrice": strikePrice,
        "price": price,
        "description": description
      };
}
