import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:docx_template/docx_template.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';
import '../models/user_data.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

class CVGenerator {
  UserData data;

  CVGenerator(this.data);

  Future<void> generateWordCV() async {
    File file = File("assets/resume_template.docx");
    final docx = await DocxTemplate.fromBytes(await file.readAsBytes());

    // final listNormal = ['Foo', 'Bar', 'Baz'];
    // final listBold = ['ooF', 'raB', 'zaB'];
    //
    // final contentList = <Content>[];
    //
    // final b = listBold.iterator;
    // for (var n in listNormal) {
    //   b.moveNext();
    //
    //   final c = PlainContent("value")
    //     ..add(TextContent("normal", n))
    //     ..add(TextContent("bold", b.current));
    //   contentList.add(c);
    // }

    Content c = Content();
    c..add(TextContent("Name", data.name));
    // ..add(TextContent("phone", data.phoneNumber))
    // ..add(TextContent("your_job", data.currentPosition))
    // ..add(TextContent("Email", data.email))
    // ..add(TextContent("first_skill", data.skills[0]))
    // ..add(TextContent("second_skill", data.skills[1]));

    // ..add(ListContent("list", [
    //   TextContent("value", "Engine")
    //     ..add(ListContent("listnested", contentList)),
    //   TextContent("value", "Gearbox"),
    //   TextContent("value", "Chassis")
    // ]))
    // ..add(ListContent("plainlist", [
    //   PlainContent("plainview")
    //     ..add(TableContent("table", [
    //       RowContent()
    //         ..add(TextContent("key1", "Paul"))
    //         ..add(TextContent("key2", "Viberg"))
    //         ..add(TextContent("key3", "Engineer")),
    //       RowContent()
    //         ..add(TextContent("key1", "Alex"))
    //         ..add(TextContent("key2", "Houser"))
    //         ..add(TextContent("key3", "CEO & Founder"))
    //         ..add(ListContent("tablelist", [
    //           TextContent("value", "Mercedes-Benz C-Class S205"),
    //           TextContent("value", "Lexus LX 570")
    //         ]))
    //     ])),
    //   PlainContent("plainview")
    //     ..add(TableContent("table", [
    //       RowContent()
    //         ..add(TextContent("key1", "Nathan"))
    //         ..add(TextContent("key2", "Anceaux"))
    //         ..add(TextContent("key3", "Music artist"))
    //         ..add(ListContent(
    //             "tablelist", [TextContent("value", "Peugeot 508")])),
    //       RowContent()
    //         ..add(TextContent("key1", "Louis"))
    //         ..add(TextContent("key2", "Houplain"))
    //         ..add(TextContent("key3", "Music artist"))
    //         ..add(ListContent("tablelist", [
    //           TextContent("value", "Range Rover Velar"),
    //           TextContent("value", "Lada Vesta SW Sport")
    //         ]))
    //     ])),
    // ]))
    // ..add(ListContent("multilineList", [
    //   PlainContent("multilinePlain")
    //     ..add(TextContent('multilineText', 'line 1')),
    //   PlainContent("multilinePlain")
    //     ..add(TextContent('multilineText', 'line 2')),
    //   PlainContent("multilinePlain")
    //     ..add(TextContent('multilineText', 'line 3'))
    // ]))
    // ..add(TextContent('multilineText2', 'line 1\nline 2\n line 3'));

    // ..add(ImageContent('img', testFileContent));

    final d = await docx.generate(c);
    final of = File('assets/generated.docx');
    if (d != null) {
      await of.writeAsBytes(d);
    } else {
      if (kDebugMode) {
        print("there is no changes");
      }
    }
  }

  Future<Uint8List> generateResume(UserData data) async {
    final doc = pw.Document(
        title: 'My Résumé', author: /*data.author*/ "Abdelrhman Yaseen");

    final profileImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/profile.jpg')).buffer.asUint8List(),
    );

    final pageTheme = await _myPageTheme(PdfPageFormat.a4);

    doc.addPage(
      pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
          pw.Partitions(
            children: [
              pw.Partition(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: <pw.Widget>[
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Text(data.name,
                              textScaleFactor: 2,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(fontWeight: pw.FontWeight.bold)),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 10)),
                          pw.Text(data.currentPosition,
                              textScaleFactor: 1.2,
                              style: pw.Theme.of(context)
                                  .defaultTextStyle
                                  .copyWith(
                                      fontWeight: pw.FontWeight.bold,
                                      color: green)),
                          pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 20)),
                          pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: <pw.Widget>[
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: <pw.Widget>[
                                  pw.Text(data.street),
                                  pw.Text(data.city),
                                  pw.Text(/*data.country*/ "Palestine"),
                                ],
                              ),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: <pw.Widget>[
                                  pw.Text(data.phoneNumber),
                                  _UrlText(data.email,
                                      'mailto:p.charlesbois@yahoo.com'),
                                  // _UrlText('wholeprices.ca',
                                  //     'https://wholeprices.ca'),
                                ],
                              ),
                              pw.Padding(padding: pw.EdgeInsets.zero)
                            ],
                          ),
                        ],
                      ),
                    ),
                    _Category(title: 'Work Experience'),
                    _Block(
                        title: data.experiences[0].jobTitle,
                        icon: null,
                        details: data.experiences[0].details),
                    _Block(
                        title: data.experiences[1].jobTitle,
                        icon: null,
                        details: data.experiences[1].details),
                    _Category(title: 'Education'),
                    _Block(
                      title:
                          "${data.degrees[0].major} at the ${data.degrees[0].schoolName}",
                      details: data.degrees[0].details,
                    ),
                    _Block(
                      title:
                          "${data.degrees[1].major} at the ${data.degrees[1].schoolName}",
                      details: data.degrees[1].details,
                    ),
                    // _Block(title: 'Bachelor Interior Design'),
                  ],
                ),
              ),
              pw.Partition(
                width: sep,
                child: pw.Column(
                  children: [
                    pw.Container(
                      height: pageTheme.pageFormat.availableHeight,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: <pw.Widget>[
                          pw.ClipOval(
                            child: pw.Container(
                              width: 100,
                              height: 100,
                              color: lightGreen,
                              child: pw.Image(profileImage),
                            ),
                          ),
                          pw.Column(
                            children: <pw.Widget>[
                              _Percent(
                                  size: 60,
                                  value: .7,
                                  title: pw.Text(data.skills[0])),
                              _Percent(
                                  size: 60,
                                  value: .4,
                                  title: pw.Text(data.skills[1])),
                              _Percent(
                                  size: 60,
                                  value: .6,
                                  title: pw.Text(data.skills[2])),
                            ],
                          ),
                          // pw.BarcodeWidget(
                          //   data: 'Abdelrhman Yaseen',
                          //   width: 60,
                          //   height: 60,
                          //   barcode: pw.Barcode.qrCode(),
                          //   drawText: false,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
    return doc.save();
  }
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.details,
    required this.title,
    this.icon,
  });

  final String title;

  final pw.IconData? icon;
  final String details;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
          pw.Container(
            decoration: const pw.BoxDecoration(
                border: pw.Border(left: pw.BorderSide(color: green, width: 2))),
            padding: const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
            margin: const pw.EdgeInsets.only(left: 5),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  // pw.Lorem(length: 20),
                  pw.Text(details)
                ]),
          ),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class CustomData {
  const CustomData({this.name = '[your name]'});

  final String name;
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => green;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      ),
    ];

    widgets.add(title);

    return pw.Padding(
        padding: pw.EdgeInsets.only(bottom: 30),
        child: pw.Column(children: widgets));
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
