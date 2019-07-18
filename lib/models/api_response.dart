///
/// A response object class
///
class ApiResponse {
  String status; // one of 'success', 'fail' or 'error'
  dynamic data; // whatever data that was received
  Links links;

  ApiResponse(this.status, this.data, this.links);

  bool get isSuccessful => status == "success";

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    links = Links.fromJson(json['links']);
  }
}

class Links {
  String self;
  String next;
  String prev;

  Links({this.self, this.next, this.prev});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    next = json['next'];
    prev = json['prev'];
  }
}
