import 'package:cover_letter_generator/Provider/PersonalInfoProvider.dart';
import 'package:cover_letter_generator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GeneratedLetter extends ConsumerWidget {
  const GeneratedLetter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.read(personalInforDataProvider);

    // Create a Document with initial text
    final doc = Document()..insert(0, data.firstName + data.lastName);

    // Initialize the QuillController with the Document
    QuillController controller = QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white),
          title: const Text("Back", style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: TextButton(
                onPressed: () async {
                  // Navigate to the PDF preview screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      // var c = int.parse();

                      return PdfPreviewScreen(document: controller.document);
                    }),
                  );
                },
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Save"),
              ),
            ),
          ],
          elevation: 2,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Card(
                color: const Color.fromARGB(255, 239, 234, 233),
                elevation: 1,
                child: QuillSimpleToolbar(
                    controller: controller,
                    configurations: const QuillSimpleToolbarConfigurations(
                        color: Colors.purple,
                        showLink: false,
                        showQuote: false)),
              ),
              Expanded(
                child: QuillEditor.basic(
                  controller: controller,
                  configurations: const QuillEditorConfigurations(
                      padding: EdgeInsets.all(10),
                      placeholder: "Add your text here ..."),
                ),
              )
            ],
          ),
        ));
  }
}

class PdfPreviewScreen extends StatelessWidget {
  final Document document;

  const PdfPreviewScreen({super.key, required this.document});

  Future<String> _savePdf() async {
    try {
      final pdf = pw.Document();
      final delta = document.toDelta();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: delta.toList().map((op) {
                if (op.isInsert) {
                  final text = op.data as String;
                  final style = op.attributes ?? {};

                  return pw.Text(
                    text,
                    style: pw.TextStyle(
                      fontWeight: style.containsKey('bold')
                          ? pw.FontWeight.bold
                          : pw.FontWeight.normal,
                      fontStyle: style.containsKey('italic')
                          ? pw.FontStyle.italic
                          : pw.FontStyle.normal,
                      decoration: style.containsKey('underline')
                          ? pw.TextDecoration.underline
                          : pw.TextDecoration.none,
                      fontSize: style.containsKey('size')
                          ? (style['size'] as double)
                          : 12.0,
                    ),
                  );
                } else if (op.isInsert) {
                  return pw.SizedBox(height: 10); // Line break
                }
                return pw.SizedBox();
              }).toList(),
            );
          },
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File("${output.path}/document.pdf");
      await file.writeAsBytes(await pdf.save());
      return file.path;
    } catch (e) {
      throw Exception("Error saving PDF");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: FutureBuilder<String>(
        future: _savePdf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading PDF'));
          } else if (snapshot.hasData) {
            return Container(
              color: const Color.fromARGB(
                  255, 37, 219, 79), // Set your desired background color here
              child: SfPdfViewer.file(
                File(snapshot.data!),
              ),
            );
          } else {
            return const Center(child: Text('No PDF to display'));
          }
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            // Add your save functionality here
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          child: const Text(
            'Download PDF',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
