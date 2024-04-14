class DVContactEntity {
  final String? id;
  final String? first;
  final String? last;
  final List<String?> emails;
  final List<String?> phones;

  DVContactEntity({
    this.id,
    this.first,
    this.last,
    required this.emails,
    required this.phones,
  });

  String get displayName {
    String output = "";
    if (first != null && last != null) {
      output = "${first!} ${last!}";
    } else {
      if (first != null) output += first!;
      if (last != null) output += last!;
    }
    return output;
  }

  @override
  String toString() {
    return "DVContactEntity(id: $id, first: $first, last: $last, emails: $emails, phones: $phones)";
  }
}
