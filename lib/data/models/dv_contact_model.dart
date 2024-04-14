import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";

class DVContactModel extends DVContactEntity {
  DVContactModel({
    super.id,
    super.first,
    super.last,
    required super.emails,
    required super.phones,
  });

  factory DVContactModel.fromEntity({required DVContactEntity entity}) =>
      DVContactModel(
        id: entity.id,
        first: entity.first,
        last: entity.last,
        emails: entity.emails,
        phones: entity.phones,
      );

  Contact toContact() => Contact(
        givenName: first,
        familyName: last,
        displayName: "$first $last",
        emails: emails.map((e) => Item(value: e)).toList(),
        phones: phones.map((p) => Item(value: p)).toList(),
      )..identifier = id;

  factory DVContactModel.fromContact({required Contact contact}) =>
      DVContactModel(
        id: contact.identifier,
        first: contact.givenName,
        last: contact.familyName,
        emails: contact.emails?.map((e) => e.value).toList() ?? [],
        phones: contact.phones?.map((p) => p.value).toList() ?? [],
      );
}
