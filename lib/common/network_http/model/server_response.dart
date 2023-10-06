class ServerResponse {
  String? message;
  Paging? paging;
  Map<String, dynamic>? data;
  late int statusCode;

  ServerResponse({
    this.message,
    this.paging,
    this.data,
    required this.statusCode,
  });

  ServerResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    statusCode = json['statusCode'];
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map<String, dynamic>();
    map['message'] = message;
    map['data'] = data;
    map['statusCode'] = statusCode;
    map['paging'] = paging?.toJson();
    return map;
  }
}

class Paging {
  int? totalRecords;
  int? pageIndex;
  int? pageSize;
  int? totalPages;

  Paging({this.totalRecords, this.pageIndex, this.pageSize, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    totalRecords = json['totalRecords'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalRecords'] = this.totalRecords;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
