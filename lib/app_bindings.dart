import "package:dial_verse/data/repo/i_dial_repo.dart";
import "package:dial_verse/data/sources/local/data_source.dart";
import "package:dial_verse/data/sources/local/i_data_source.dart";
import "package:dial_verse/domain/repo/dial_repo.dart";
import "package:dial_verse/domain/usecases/delete_contact.dart";
import "package:dial_verse/domain/usecases/dial_phone.dart";
import "package:dial_verse/domain/usecases/insert_contact.dart";
import "package:dial_verse/domain/usecases/retrieve_all_contacts.dart";
import "package:dial_verse/domain/usecases/send_sms.dart";
import "package:dial_verse/domain/usecases/update_contact.dart";
import "package:dial_verse/presentation/controllers/dial_controller.dart";
import "package:get/get.dart";

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // sources
    Get.put<DataSource>(IDataSource());

    // repo
    Get.put<DialRepo>(
      IDialRepo(
        source: Get.find<DataSource>(),
      ),
    );

    // usecases
    Get
      ..put<RetrieveAllContacts>(
        RetrieveAllContacts(
          repo: Get.find<DialRepo>(),
        ),
      )
      ..put<InsertContact>(
        InsertContact(
          repo: Get.find<DialRepo>(),
        ),
      )
      ..put<UpdateContact>(
        UpdateContact(
          repo: Get.find<DialRepo>(),
        ),
      )
      ..put<DeleteContact>(
        DeleteContact(
          repo: Get.find<DialRepo>(),
        ),
      )
      ..put<DialPhone>(
        DialPhone(
          repo: Get.find<DialRepo>(),
        ),
      )
      ..put<SendSms>(
        SendSms(
          repo: Get.find<DialRepo>(),
        ),
      );

    // controller
    Get.put<DialController>(
      DialController(
        retrieveAllContactsUsecase: Get.find<RetrieveAllContacts>(),
        insertContactUsecase: Get.find<InsertContact>(),
        updateContactUsecase: Get.find<UpdateContact>(),
        deleteContactUsecase: Get.find<DeleteContact>(),
        dialPhoneUsecase: Get.find<DialPhone>(),
        sendSmsUsecase: Get.find<SendSms>(),
      ),
    );
  }
}
