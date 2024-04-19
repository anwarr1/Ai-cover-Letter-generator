import 'package:cover_letter_generator/Provider/PersonalInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneratedLetter extends ConsumerWidget {
  const GeneratedLetter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.read(personalInforDataProvider);
    return Scaffold(
        body: Center(child: Text(data.firstName + " " + data.lastName)));
  }
}
