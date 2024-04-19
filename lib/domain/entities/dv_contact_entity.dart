class DVContactEntity {
  final String? id;
  final String? prefix;
  final String? first;
  final String? middle;
  final String? last;
  final String? city;
  final String? country;
  final List<String?> emails;
  final List<String?> phones;

  DVContactEntity({
    this.id,
    this.prefix,
    this.first,
    this.middle,
    this.last,
    this.city,
    this.country,
    required this.emails,
    required this.phones,
  });

  String get displayName =>
      "${first ?? ""}${first == null ? "" : " "}${middle ?? ""}${middle == null ? "" : " "}${last ?? ""}";

  String get address =>
      "${city ?? ""}${city == null ? "" : " "}${country ?? ""}";

  @override
  String toString() {
    return "DVContactEntity(id: $id, prefix: $prefix, first: $first, middle: $middle, last: $last, city: $city, country: $country, emails: $emails, phones: $phones)";
  }
}
