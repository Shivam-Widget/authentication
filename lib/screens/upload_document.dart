import 'dart:convert';
import 'dart:io';

import 'package:authentication/provider/document_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/document_type_model.dart';
import '../sharedprefrences/SharedPrefs.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  final docController = TextEditingController();
  final tagController = TextEditingController();
  bool _isEnable = false;
  File? _image;
  final picker = ImagePicker();

  DateTime selectedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(
        () {
          _selectedDate = picked;
        },
      );
    }
  }

  Future getImageFromCamera() async {
    var pickedFile = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 500, maxHeight: 500);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    });
  }

  Future getImageFromGallery() async {
    var pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxWidth: 500, maxHeight: 500);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    });
  }

  Future getFileFromDoc() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    _image = result.files.first as File?;
    openFile(_image as PlatformFile);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String dropdownValue = list.first;

  static List lists = [];
  String dropdownValues = lists.first;


  Future<void> _fetchDocType() async {
    try {
      await Provider.of<DocumentProvider>(context, listen: false)
          .getDocumentType(context);
      final postMdl = Provider.of<DocumentProvider>(context, listen: false);
      setState(() {
        lists = postMdl.docListModel.data!.modulesList!.map((e) => e.name).toList();
      });
    } catch (error) {
      debugPrint("Error fetching doc data: $error");
    }
  }


@override
  void initState() {
    _fetchDocType();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMd().format(selectedDate);
    String formattedDates = DateFormat.yMd().format(_selectedDate);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1E374F),
        title: const Text(
          'Upload Document',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Document Title',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: docController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 25.0, 20.0),
                            hintText: 'Enter document title',
                            hintStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Document Type',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        child: DropdownButton(
                          isExpanded: true,
                            value: dropdownValues,
                            hint: Text('Select Document Type'),
                            icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey,
                            ),
                      onChanged: (value) {
                      dropdownValues;
                      setState(() {});
                      },
                      // items: snapshot.data!.map((e) {
                      //   return DropdownMenuItem(child: Text(e.data!.modulesList.toString()),
                      //   );
                      //
                      // }).toList(),

                      items: lists
                          .map((values) {
                        return DropdownMenuItem<String>(
                          value: values,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(_fetchDocType().toString()),
                          ),
                        );
                      }).toList(),


                      ),



                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Select User',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Colors.grey,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Document Tag',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: tagController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 25.0, 20.0),
                            hintText: 'Search tag',
                            hintStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Expiry date (Optional)',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(formattedDate),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.grey,
                                )),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Is Shareable',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              activeColor: const Color(0xFF1E374F),
                              inactiveThumbColor: const Color(0xFF1E374F),
                              activeTrackColor: Colors.blue,
                              inactiveTrackColor: Colors.grey.shade400,
                              value: _isEnable,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _isEnable = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _isEnable
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Last Share Date',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(formattedDates),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          selectDate(context);
                                        },
                                        child: const Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              getImageFromCamera();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Take Photo',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              getImageFromGallery();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Chosen From Gallery',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              getFileFromDoc();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Choose a file',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))),
                                title: const Text(
                                  'Select Option',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_file_outlined,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Browse files',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _image != null
                          ? Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF1E374F)),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Color(0xFF1E374F),
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          color: const Color(0xFF1E374F),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
