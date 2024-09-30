import 'package:cover_letter_generator/model/Job.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobInfoProvider extends StateNotifier<Job> {
  JobInfoProvider() : super(Job("", 0, "", "", ""));
  setJobInfo({title, yearsOfExperience, education, postalCode, skills}) {
    state = Job(title, yearsOfExperience, education, postalCode, skills);
  }
}

final jobInforDataProvider =
    StateNotifierProvider<JobInfoProvider, Job>(
        (ref) => JobInfoProvider());
