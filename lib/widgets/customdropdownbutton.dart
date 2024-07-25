import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/document_type_model.dart';

class DropDownItemButton extends StatefulWidget {
  const DropDownItemButton({super.key});

  @override
  State<DropDownItemButton> createState() => _DropDownItemButtonState();
}

class _DropDownItemButtonState extends State<DropDownItemButton> {

  Future<List<DocumentTypeModel>> getData() async{
    try {
      final res = await http.get(Uri.parse(
          'https://fly-manager-dev-api.azurewebsites.net/api/Document/getDetails?id=00000000-0000-0000-0000-000000000000'));

      final body = json.decode(res.body) as List;

      if(res.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;

          return DocumentTypeModel(
            data: map['data']['modulesList']['name'],

          );

        }).toList();
      }



    } catch (e) {
      debugPrint('-------> $e');
    }


    throw Exception('Fetch Data Error');


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DocumentTypeModel>>(
        future: getData(),
          builder: (context, snapshot) {
          if(snapshot.hasData){
            return DropdownButton(
              items: snapshot.data!.map((e) {
                return DropdownMenuItem(
                  value: e.data.toString(),
                  child: Text(e.data!.modulesList.toString()),
                );
              }).toList(),
              onChanged: (v) {},);
          } else if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No Data');

          }


          },
      ),

    );
  }
}
