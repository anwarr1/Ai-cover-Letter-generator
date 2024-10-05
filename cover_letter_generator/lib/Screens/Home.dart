import 'package:cover_letter_generator/Widgets/listLetters.dart';
import 'package:cover_letter_generator/model/User.dart';
import 'package:cover_letter_generator/provider/authProvider.dart';

import 'package:cover_letter_generator/utils/Ui/custome_stepper.dart';
import 'package:cover_letter_generator/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var width = size.width;
    var height = size.height;
    User currentUser = ref.read(authInfoProvider).currentUser;
    print("Current user" + currentUser.firstName);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Home Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Profile Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
                // Navigate to Settings Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await ref.read(authInfoProvider.notifier).logout(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
      backgroundColor: primaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: primaryColor,
        title: const Text(
          'coverAi',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
            backgroundColor: primaryColor,
            shape: const CircleBorder(),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: primaryColor,
                builder: (BuildContext context) {
                  return LayoutBuilder(
                      builder: (context, constraints) =>
                          ModalContent(constraints));
                },
              );
            },
            child: const FaIcon(
              FontAwesomeIcons.wandMagicSparkles,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome ',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.08),
                        child: Text(
                          '${currentUser.firstName} ! ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ]),
                const Spacer(),
                const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: constraints.maxHeight * 0.10),
                            child: listLetters()),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

// *************************************************************** show Modal **************************************************************

class ModalContent extends StatefulWidget {
  final BoxConstraints constraints;
  const ModalContent(this.constraints, {super.key});
  @override
  _ModalContentState createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  final double _bottomPadding = 0;
  int selectedPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var height = widget.constraints.maxHeight;
    var width = widget.constraints.maxWidth;
    return Container(
        color: primaryColor,
        height: height,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: _bottomPadding + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
              color: Colors.white, child: CustomStepper(width, height)),
        ));
  }
}
