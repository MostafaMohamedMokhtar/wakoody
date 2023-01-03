import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakoody/utils/request_permission.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/strings_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';
import 'package:pdf/widgets.dart' as pw;

class BillDetailsView extends StatefulWidget {
  const BillDetailsView({Key? key}) : super(key: key);

  @override
  State<BillDetailsView> createState() => _BillDetailsViewState();
}

class _BillDetailsViewState extends State<BillDetailsView> {
  final pdf = pw.Document();

  Widget createInvoiceBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: MediaQuery.of(context).size.height * .8,
        padding: const EdgeInsets.only(
            top: AppPadding.p35, left: AppPadding.p10, right: AppPadding.p20),
        // color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.billTo.tr(),
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              Text(
                'Mostafa Mokhtar',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: AppSize.s3,
              ),
              Text(
                '${AppStrings.orderId.tr()}: 123456',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: AppSize.s3,
              ),
              Text(
                '${AppStrings.emailHint.tr()}: mokhtarmostafa13@gmail.com',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: AppSize.s3,
              ),
              Text(
                '${AppStrings.phoneHint.tr()}: 01097977495',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              Text(
                AppStrings.orderDetails.tr(),
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// column for order date
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.orderDate.tr(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: AppSize.s3,
                        ),
                        Text(
                          '20-09-2022',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),

                  /// column for due date
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.dueDate.tr(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: AppSize.s3,
                        ),
                        Text(
                          '22-09-2022',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '${AppStrings.invoiceNumber.tr()}  #13458912',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              Text(
                AppStrings.invoiceDetails.tr(),
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: AppSize.s15,
              ),

              /// column for invoice details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.plateNumber.tr(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: AppSize.s3,
                      ),
                      Text(
                        AppStrings.carType.tr(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: AppSize.s3,
                      ),
                      Text(
                        AppStrings.vat.tr(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'KMN 666',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: AppSize.s3,
                      ),
                      Text(
                        'Aveo',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: AppSize.s3,
                      ),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '200 \$',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: AppSize.s3,
                      ),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: AppSize.s3,
                      ),
                      Text(
                        '50 \$',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Divider(
                  thickness: AppSize.s2,
                  color: ColorManager.grey7,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.total.tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    '250 \$',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// first container for appBar part
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .11,
            /* padding: const EdgeInsets.only(
                top: AppPadding.p28, right: AppPadding.p50),*/
            decoration: BoxDecoration(
              color: ColorManager.primary,
              // color: Colors.greenAccent,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(AppSize.s15),
                bottomLeft: Radius.circular(AppSize.s15),
              ),
            ),
            child: Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(top: AppPadding.p35),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * .4,
                    // color: Colors.blueAccent,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: AppMargin.m10),
                    padding: const EdgeInsets.only(top: AppPadding.p35),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * .6,
                    //  color: Colors.greenAccent,
                    child: Text(AppStrings.invoice.tr()),
                  ),
                )
              ],
            ),
          ),

          /// second container for body of invoice
          createInvoiceBody(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () async {
            createPdfInvoice();
           bool downloaded =  await savePdf() ;
           /* final output = await getTemporaryDirectory();
            //  final output = await getExternalStorageDirectory();
            String fullPath = '${output.path}/invoice.pdf';
            debugPrint('mokh path : $fullPath');
            final file = File(fullPath);
            await file.writeAsBytes(await pdf.save());*/
            if(downloaded){
              Fluttertoast.showToast(
                  msg: 'invoice downloaded', toastLength: Toast.LENGTH_LONG);
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .09,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s15),
                  topRight: Radius.circular(AppSize.s15)),
            ),
            child: Text(
              AppStrings.downloadInvoice.tr(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> savePdf() async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          print(directory);
          List<String>? paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/WakoodyApp";
          directory = Directory(newPath);
          String fullPath = '${directory.path}/invoice.pdf';
          debugPrint('mokh path : $fullPath');
          final file = File(fullPath);
          await file.writeAsBytes(await pdf.save());
        } else {
          return false;
        }
      } else {
        if (await requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
     /* if (await directory.exists()) {
        File saveFile = File(directory.path + "/$fileName");
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
              setState(() {
                progress = value1 / value2;
              });
            });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }*/
    } catch (e) {
      print(e);
    }
    return false;
  }

  createPdfInvoice(){
    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Container(
                //  width: MediaQuery.of(context).size.width * .9,
                //  height: MediaQuery.of(context).size.height * .8,
                padding: const pw.EdgeInsets.only(
                    top: AppPadding.p35,
                    left: AppPadding.p10,
                    right: AppPadding.p20),
                // color: Colors.yellow,
                child: pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                      vertical: AppPadding.p4),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        AppStrings.billTo.tr(),
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: AppSize.s30,
                            color: PdfColor.fromHex("#000000")),
                        //  style: Theme.of(context).textTheme.headline1,
                      ),
                      pw.SizedBox(
                        height: AppSize.s15,
                      ),
                      pw.Text(
                        'Mostafa Mokhtar',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: AppSize.s16,
                            color: PdfColor.fromHex("#797979")),
                        //   style: Theme.of(context).textTheme.headline5,
                      ),
                      pw.SizedBox(
                        height: AppSize.s3,
                      ),
                      pw.Text(
                        '${AppStrings.orderId.tr()}: 123456',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: AppSize.s16,
                            color: PdfColor.fromHex("#797979")),
                        //  style: Theme.of(context).textTheme.headline5,
                      ),
                      pw.SizedBox(
                        height: AppSize.s3,
                      ),
                      pw.Text(
                        '${AppStrings.emailHint.tr()}: mokhtarmostafa13@gmail.com',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: AppSize.s16,
                            color: PdfColor.fromHex("#797979")),
                        //  style: Theme.of(context).textTheme.headline5,
                      ),
                      pw.SizedBox(
                        height: AppSize.s3,
                      ),
                      pw.Text(
                        '${AppStrings.phoneHint.tr()}: 01097977495',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: AppSize.s16,
                            color: PdfColor.fromHex("#797979")),
                        //  style: Theme.of(context).textTheme.headline5,
                      ),
                      pw.SizedBox(
                        height: AppSize.s15,
                      ),
                      pw.Text(
                        AppStrings.orderDetails.tr(),
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: AppSize.s30,
                            color: PdfColor.fromHex("#000000")),
                        //  style: Theme.of(context).textTheme.headline1,
                      ),
                      pw.SizedBox(
                        height: AppSize.s15,
                      ),
                      pw.Row(
                        mainAxisAlignment:
                        pw.MainAxisAlignment.spaceBetween,
                        children: [
                          /// column for order date
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                vertical: AppPadding.p4),
                            child: pw.Column(
                              crossAxisAlignment:
                              pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  AppStrings.orderDate.tr(),
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.normal,
                                      fontSize: AppSize.s16,
                                      color:
                                      PdfColor.fromHex("#797979")),
                                  // style: Theme.of(context).textTheme.headline5,
                                ),
                                pw.SizedBox(
                                  height: AppSize.s3,
                                ),
                                pw.Text(
                                  '20-09-2022',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.normal,
                                      fontSize: AppSize.s16,
                                      color:
                                      PdfColor.fromHex("#797979")),
                                  //  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ),

                          /// column for due date
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                vertical: AppPadding.p4),
                            child: pw.Column(
                              crossAxisAlignment:
                              pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  AppStrings.dueDate.tr(),
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.normal,
                                      fontSize: AppSize.s16,
                                      color:
                                      PdfColor.fromHex("#797979")),
                                  // style: Theme.of(context).textTheme.headline5,
                                ),
                                pw.SizedBox(
                                  height: AppSize.s3,
                                ),
                                pw.Text(
                                  '22-09-2022',
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.normal,
                                      fontSize: AppSize.s16,
                                      color:
                                      PdfColor.fromHex("#797979")),
                                  //  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      pw.Text(
                        '${AppStrings.invoiceNumber.tr()}  #13458912',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: AppSize.s16,
                            color: PdfColor.fromHex("#797979")),
                        // style: Theme.of(context).textTheme.headline5,
                      ),
                      pw.SizedBox(
                        height: AppSize.s15,
                      ),
                      pw.Text(
                        AppStrings.invoiceDetails.tr(),
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: AppSize.s30,
                            color: PdfColor.fromHex("#000000")),
                        //  style: Theme.of(context).textTheme.headline1,
                      ),
                      pw.SizedBox(
                        height: AppSize.s15,
                      ),

                      /// column for invoice details
                      pw.Row(
                        mainAxisAlignment:
                        pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            crossAxisAlignment:
                            pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                AppStrings.plateNumber.tr(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                              pw.SizedBox(
                                height: AppSize.s3,
                              ),
                              pw.Text(
                                AppStrings.carType.tr(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                              pw.SizedBox(
                                height: AppSize.s3,
                              ),
                              pw.Text(
                                AppStrings.vat.tr(),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                          pw.Column(
                            crossAxisAlignment:
                            pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'KMN 666',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                              pw.SizedBox(
                                height: AppSize.s3,
                              ),
                              pw.Text(
                                'Aveo',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                              pw.SizedBox(
                                height: AppSize.s3,
                              ),
                              pw.Text(
                                '',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                          pw.Column(
                            crossAxisAlignment:
                            pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                '200 \$',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                // style: Theme.of(context).textTheme.headline5,
                              ),
                              pw.SizedBox(
                                height: AppSize.s3,
                              ),
                              pw.Text(
                                '',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                              pw.SizedBox(
                                height: AppSize.s3,
                              ),
                              pw.Text(
                                '50 \$',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: AppSize.s16,
                                    color: PdfColor.fromHex("#797979")),
                                //  style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.SizedBox(
                        height: AppSize.s20,
                      ),
                      pw.SizedBox(
                        //   width: MediaQuery.of(context).size.width * .8,
                        child: pw.Divider(
                            thickness: AppSize.s2,
                            color: PdfColor.fromHex("#e9ecef")
                          //  color: pw.ColorManager.grey7,
                        ),
                      ),
                      pw.SizedBox(
                        height: AppSize.s20,
                      ),
                      pw.Row(
                        mainAxisAlignment:
                        pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            AppStrings.total.tr(),
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.normal,
                                fontSize: AppSize.s16,
                                color: PdfColor.fromHex("#797979")),
                            //  style: Theme.of(context).textTheme.headline5,
                          ),
                          pw.Text(
                            '250 \$',
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.normal,
                                fontSize: AppSize.s16,
                                color: PdfColor.fromHex("#797979")),
                            //  style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
