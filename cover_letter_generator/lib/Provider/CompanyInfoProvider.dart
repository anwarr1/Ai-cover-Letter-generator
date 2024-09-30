import 'package:cover_letter_generator/model/Company.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompanyInfoProvider extends StateNotifier<Company> {
  CompanyInfoProvider() : super(Company("", "", ""));
  setCompanyInfo({name, address, department}) {
    state = Company(name, address, department);
  }
}

final companyInforDataProvider =
    StateNotifierProvider<CompanyInfoProvider, Company>(
        (ref) => CompanyInfoProvider());
