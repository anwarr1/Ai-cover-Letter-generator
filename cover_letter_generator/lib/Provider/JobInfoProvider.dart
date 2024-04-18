import 'package:cover_letter_generator/Model/Person.dart';
import 'package:cover_letter_generator/Widgets/PersonalInfoForm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfoProvider extends StateNotifier<Person> {
  PersonalInfoProvider() : super(Person("", "", "", "", "", ""));
  setPersonInfo(firstName, lastName, phone, address, email, zip) {
    state =  Person(firstName, lastName, phone, address, email, zip);

  }

}

final personalInforDataProvider =
    StateNotifierProvider<PersonalInfoProvider, Person>(
        (ref) => PersonalInfoProvider());
