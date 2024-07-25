import 'dart:convert';
import 'dart:io';

import 'package:authentication/models/select_user_model.dart';
import 'package:authentication/provider/document_provider.dart';
import 'package:authentication/provider/selectuser_provider.dart';
import 'package:authentication/services/api_service.dart';
import 'package:authentication/widgets/customdropdownbutton.dart';
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
  String? dropdownValue;

  List<String?> lists = <String>[];
  String? dropdownValues;

  static String? accessToken = SharedPreferencesHelper.accessToken;

  // Future<List<DocumentTypeModel>> getData() async {
  //   try {
  //     final res = await http.get(Uri.parse(
  //         'https://fly-manager-dev-api.azurewebsites.net/api/Document/getDetails?id=00000000-0000-0000-0000-000000000000'));
  //
  //     final body = json.decode(res.body) as List;
  //
  //     if (res.statusCode == 200) {
  //       return body.map((e) {
  //         final map = e as Map<String, dynamic>;
  //
  //         return DocumentTypeModel(
  //           data: map['data']['modulesList']['name'],
  //         );
  //       }).toList();
  //     }
  //   } catch (e) {
  //     debugPrint('-------> $e');
  //   }
  //   throw Exception('Fetch Data Error');
  // }

  // var selectedValue;

  // Future<List<DocumentTypeModel>> getSelectUser() async {
  //   try {
  //     final res = await http.get(
  //         Uri.parse(
  //             'https://fly-manager-dev-api.azurewebsites.net/api/Document/getDetails?id=00000000-0000-0000-0000-000000000000'),
  //         headers: {'accept': '*/*', 'authorization': "$accessToken"});
  //     final body = json.decode('${res.body}') as List;
  //     if (res.statusCode == 200) {
  //       return body.map((e) {
  //         final map = e as Map;
  //         return DocumentTypeModel();
  //       }).toList();
  //     }
  //   } catch (e) {
  //     debugPrint('========> $e');
  //   }
  //   throw Exception('Fetch Data Null');
  // }
  
  Future<List<DocumentTypeModel>> getSelectUser() async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://fly-manager-dev-api.azurewebsites.net/api/Document/getDetails?id=00000000-0000-0000-0000-000000000000',
        ),
        headers: {
          'accept': '*/*',
          'authorization': "$accessToken"
        },
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        if (data is List) {
          return data.map((e) {
            return DocumentTypeModel.fromJson(e as Map<String, dynamic>,);
          }).toList();
        }
      }
    } catch (e) {
      debugPrint('========> $e');
    }
    throw Exception();
  }


  List<DocumentTypeModel> _dataList = [];
  String? _selectedValue;




  Future<void> _loadData() async {
    final posts = await ApiService().getDocumentType(context);
    setState(() {
      _dataList = posts;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMd().format(selectedDate);
    String formattedDates = DateFormat.yMd().format(_selectedDate);
    final postMdl = Provider.of<DocumentProvider>(context);
    debugPrint('--------> $accessToken');

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
                          borderRadius: BorderRadius.circular(3),
                        ),

                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: const Icon(Icons.arrow_drop_down_sharp, color: Colors.grey,),
                            hint: const Row(
                              children: [
                                SizedBox(width: 10,),
                                Text('Select Document Type', style: TextStyle(fontSize: 14),),
                              ],
                            ),
                            isExpanded: true,
                            value: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                            items: _dataList.map((item) {
                              return DropdownMenuItem(
                                value: item.data!.toString(),
                                child: Text('${item.data}'),
                              );
                            }).toList(),
                          ),
                        ),

                        // child: FutureBuilder<List<DocumentTypeModel>>(
                        //   future: getSelectUser(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData) {
                        //       return DropdownButtonHideUnderline(
                        //         child: ButtonTheme(
                        //           alignedDropdown: true,
                        //           child: DropdownButton<String>(
                        //             value: dropdownValues,
                        //             icon: const Icon(
                        //               Icons.arrow_drop_down_sharp,
                        //               color: Colors.grey,
                        //             ),
                        //             hint: const Text('Select Document Type'),
                        //             items: snapshot.data!.map(
                        //               (item) {
                        //                 return DropdownMenuItem(
                        //                   value: item.data!.name.toString(),
                        //                   child:
                        //                       Text(item.data!.name),
                        //                 );
                        //               },
                        //             ).toList(),
                        //             onChanged: (String? value) {
                        //               setState(() {
                        //                 dropdownValues = value;
                        //               });
                        //             },
                        //           ),
                        //         ),
                        //       );
                        //     } else if (snapshot.hasError) {
                        //       return Text('Error: ${snapshot.error}');
                        //     } else {
                        //       return Text('No Data');
                        //     }
                        //   },
                        // ),

                        //  child: DropdownButton<String>(
                        //    isExpanded: true,
                        //    value: dropdownValues,
                        //    icon: const Icon(
                        //      Icons.arrow_drop_down_sharp,
                        //      color: Colors.grey,
                        //    ),
                        //    onChanged: (String? values) {
                        //      setState(() {
                        //        dropdownValues = values;
                        //      });
                        //    },
                        // items: [],
                        // items: lists
                        //     .map<DropdownMenuItem<String>>((values) {
                        //   return DropdownMenuItem<String>(
                        //     value: values,
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 10),
                        //       child: Text(values ?? ""),
                        //     ),
                        //   );
                        // }).toList(),
                        //  ),
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
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            child: DropdownButton<String>(
                              hint: const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Select User',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
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
                      width: 155,
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
                      width: 155,
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
