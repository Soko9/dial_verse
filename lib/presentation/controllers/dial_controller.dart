import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/core/resources/usecase.dart";
import "package:dial_verse/domain/usecases/delete_contact.dart";
import "package:dial_verse/domain/usecases/dial_phone.dart";
import "package:dial_verse/domain/usecases/insert_contact.dart";
import "package:dial_verse/domain/usecases/retrieve_all_contacts.dart";
import "package:dial_verse/domain/usecases/send_sms.dart";
import "package:dial_verse/domain/usecases/update_contact.dart";
import "package:get/get.dart";

class DialController extends GetxController {
  final RetrieveAllContacts _usecaseRetrieveAllContacts;
  final InsertContact _usecaseInsertContact;
  final UpdateContact _usecaseUpdateContact;
  final DeleteContact _usecaseDeleteContact;
  final DialPhone _usecaseDialPhone;
  final SendSms _usecaseSendSms;

  DialController({
    required RetrieveAllContacts retrieveAllContactsUsecase,
    required InsertContact insertContactUsecase,
    required UpdateContact updateContactUsecase,
    required DeleteContact deleteContactUsecase,
    required DialPhone dialPhoneUsecase,
    required SendSms sendSmsUsecase,
  })  : _usecaseRetrieveAllContacts = retrieveAllContactsUsecase,
        _usecaseInsertContact = insertContactUsecase,
        _usecaseUpdateContact = updateContactUsecase,
        _usecaseDeleteContact = deleteContactUsecase,
        _usecaseDialPhone = dialPhoneUsecase,
        _usecaseSendSms = sendSmsUsecase;

  @override
  void onInit() {
    super.onInit();
    _getAllContacts();
  }

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxString _error = "".obs;
  String get error => _error.value;
  set error(String value) => _error.value = value;

  final RxList<Contact> _contacts = RxList.empty(growable: true);
  List<Contact> get contacts => _contacts;
  set contacts(List<Contact> value) => _contacts.value = value;

  void _getAllContacts() async {
    isLoading = true;
    final result = await _usecaseRetrieveAllContacts(params: Noparams());
    result.fold(
      (l) => error = l.message,
      (r) {
        contacts = r;
      },
    );
    _clearMess();
  }

  void callSomeOne({required String number}) async {
    isLoading = true;
    final result = await _usecaseDialPhone(params: number);
    result.fold(
      (l) => error = l.message,
      (r) => r,
    );
    _clearMess();
  }

  void sendSms({
    required String number,
    required String message,
  }) async {
    isLoading = true;
    final result = await _usecaseSendSms(
      params: SmsParams(number: number, message: message),
    );
    result.fold(
      (l) => error = l.message,
      (r) => r,
    );
    _clearMess();
  }

  void insertNewContact({required Contact contact}) async {
    print("controller");
    isLoading = true;
    final result = await _usecaseInsertContact(
      params: ContactParams(contact: contact),
    );
    result.fold(
      (l) => error = l.message,
      (r) => r,
    );
    _clearMess();
  }

  void updateContact({required Contact contact}) async {
    isLoading = true;
    final result = await _usecaseUpdateContact(
      params: ContactParams(contact: contact),
    );
    result.fold(
      (l) => error = l.message,
      (r) => r,
    );
    _clearMess();
  }

  void deleteContact({required Contact contact}) async {
    isLoading = true;
    final result = await _usecaseDeleteContact(
      params: ContactParams(contact: contact),
    );
    result.fold(
      (l) => error = l.message,
      (r) => r,
    );
    _clearMess();
  }

  void _clearMess() {
    isLoading = false;
    error = "";
  }
}
