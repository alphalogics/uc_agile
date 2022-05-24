class ExclusiveModel {
  ExclusiveModel({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final List<Data> data;

  ExclusiveModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.id,
    required this.materialName,
    required this.materialDescription,
    required this.materialImage,
    required this.materialContent,
    required this.materialIsDeleted,
    required this.materialOrder,
    required this.materialContentType,
  });
  late final int id;
  late final String materialName;
  late final String materialDescription;
  late final String materialImage;
  late final List<MaterialContent> materialContent;
  late final int materialIsDeleted;
  late final int materialOrder;
  late final MaterialContentType materialContentType;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    materialName = json['material_name'];
    materialDescription = json['material_description'];
    materialImage = json['material_image'];
    materialContent = List.from(json['material_content']).map((e)=>MaterialContent.fromJson(e)).toList();
    materialIsDeleted = json['material_is_deleted'];
    materialOrder = json['material_order'];
    materialContentType = MaterialContentType.fromJson(json['material_content_type']);
  }
}

class MaterialContent {
  MaterialContent({
    required this.type,
    required this.title,
    required this.description,
    required this.audioUrl,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.iframe,
    required this.imageUrl,
    required this.pdfUrl,
    required this.question,
    required this.answer,
  });
  late final String type;
  late final String title;
  late final String description;
  late final String audioUrl;
  late final String date;
  late final List<String> startTime;
  late final List<String> endTime;
  late final String iframe;
  late final String imageUrl;
  late final String pdfUrl;
  late final List<String> question;
  late final List<String> answer;

  MaterialContent.fromJson(Map<String, dynamic> json){
    type = json['type'];
    title = json['title'];
    description = json['description'];
    audioUrl = json['audio_url'] ?? '';
    date = json['date'] ?? '';
    startTime = (json['start_time'] != null) ? json['start_time'].cast<String>() : [];
    endTime = (json['end_time'] != null) ? json['end_time'].cast<String>() : [];
    // if(json['start_time'] != null){
    //   startTime = json['start_time'].cast<String>() ?? [];
    // }
    // else {
    //   startTime = [];
    // }
    // if(json['end_time'].cast<String>() != null){
    //   endTime = json['end_time'].cast<String>() ?? [];
    // }
    // else {
    //   endTime = [];
    // }
    iframe = json['iframe'] ?? '';
    imageUrl = json['image_url'] ?? '';
    pdfUrl = json['pdf_url'] ?? '';
    question = (json['question'] != null) ? json['question'].cast<String>() : [];
    answer = (json['answer'] != null) ? json['answer'].cast<String>() : [];
    // if(json['question'].cast<String>() != null){
    //   question = json['question'].cast<String>() ?? [];
    // }
    // else {
    //   question = [];
    // }
    // if(json['answer'].cast<String>() != null){
    //   answer = json['answer'].cast<String>() ?? [];
    // }
    // else {
    //   answer = [];
    // }
  }
}

class MaterialContentType {
  MaterialContentType({
  required this.str1,
  required this.str2,
  required this.str3,
  required this.str4,
  required this.str5,
  required this.str6,
});
late final String str1;
late final String str2;
late final String str3;
late final String str4;
late final String str5;
late final String str6;

MaterialContentType.fromJson(Map<String, dynamic> json){
  str1 = json['1'];
  str2 = json['2'];
  str3 = json['3'];
  str4 = json['4'];
  str5 = json['5'];
  str6 = json['6'];
}
}