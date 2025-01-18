class ListDataModel {
  String? title;
  String? description;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? databaseId;
  String? collectionId;

  ListDataModel(
      {this.title,
        this.description,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.databaseId,
        this.collectionId});

  ListDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    id = json['$id'];
    createdAt = json['$createdAt'];
    updatedAt = json['$updatedAt'];
    databaseId = json['$databaseId'];
    collectionId = json['$collectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data["\$id"] = id;
    data['\$createdAt'] = createdAt;
    data['\$updatedAt'] = updatedAt;
    data['\$databaseId'] = databaseId;
    data['\$collectionId'] = collectionId;
    return data;
  }
}
