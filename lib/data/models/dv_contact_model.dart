import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";

class DVContactModel extends DVContactEntity {
  DVContactModel({
    super.id,
    super.prefix,
    super.first,
    super.middle,
    super.last,
    super.city,
    super.country,
    required super.emails,
    required super.phones,
  });

  factory DVContactModel.fromEntity({required DVContactEntity entity}) =>
      DVContactModel(
        id: entity.id,
        prefix: entity.prefix,
        first: entity.first,
        middle: entity.middle,
        last: entity.last,
        city: entity.city,
        country: entity.country,
        emails: entity.emails,
        phones: entity.phones,
      );

  Contact toContact() => Contact(
        prefix: prefix,
        givenName: first,
        middleName: middle,
        familyName: last,
        displayName: displayName,
        postalAddresses: [PostalAddress(city: city, country: country)],
        emails: emails.map((e) => Item(value: e)).toList(),
        phones: phones.map((p) => Item(value: p)).toList(),
      )..identifier = id;

  factory DVContactModel.fromContact({required Contact contact}) =>
      DVContactModel(
        id: contact.identifier,
        prefix: contact.prefix,
        first: contact.givenName,
        middle: contact.middleName,
        last: contact.familyName,
        city: contact.postalAddresses?.first.city,
        country: contact.postalAddresses?.first.country,
        emails: contact.emails?.map((e) => e.value).toList() ?? [],
        phones: contact.phones?.map((p) => p.value).toList() ?? [],
      );
}
