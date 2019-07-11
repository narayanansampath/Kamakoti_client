class Notification {
  int id;
  String title;
  String description;
  String payload;

  Notification({
    this.id,
    this.title,
    this.description,
    this.payload,
  });

  @override
  String toString() {
    return 'Notification {\n\tid: $id,\n\ttitle: $title,\n\tdescription: $description,\n\tpayload: $payload\n}';
  }
}
