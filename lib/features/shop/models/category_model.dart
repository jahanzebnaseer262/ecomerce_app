class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.isFeatured,
      this.parentId = ''});

  //Empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  //convert to json

Map<String,dynamic> toJson(){
  return {
    'name':name,
    'image':image,
    'isFeatured':isFeatured,
    'parentId': parentId
  };
}


//Map json back to user Model

factory CategoryModel.fromJson(Map<String, dynamic> json){
  if(json.isNotEmpty){
    return CategoryModel(
        id: json['id']?? '',
        name: json['name']?? '',
        image: json['image']??'',
        isFeatured: json['isFeatured']?? false,
       parentId: json['parentId'] ?? ''
    );
  } else{
    return CategoryModel.empty();
  }
}


}
