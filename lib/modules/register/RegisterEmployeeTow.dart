import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'thanksPage.dart';

class RegisterEmployeeTow extends StatefulWidget {
  RegisterEmployeeTow({super.key});

  @override
  State<RegisterEmployeeTow> createState() => _RegisterEmployeeTowState();
}

class _RegisterEmployeeTowState extends State<RegisterEmployeeTow> {
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController companyTypeController = TextEditingController();

  PlatformFile? file;

  Future<void> _uploadCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = result.files.first;

      // You can now use the file, for example, display its name
      print('File picked: ${file!.name}');
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Upload your CV',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: file == null ? ElevatedButton(
                onPressed: ()async{
                  setState(() {
                  _uploadCV();

                  });
                } ,
                child: Text('Upload CV'),
              ) : Text(file!.name),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Phone Number",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: "Enter your phone number",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Work field",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: companyTypeController,
              decoration: const InputDecoration(
                hintText: "Enter your work field",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            
            const SizedBox(
              height: 20,
            ),
            kdefultButtom(
              title: 'Next',
              borderColor: primaryColor,
              width: double.infinity,
              height: 55,
              onPressed: () {
                // Handle the onPressed action
                navigateAndFinish(context, ThanksPage());
              },
            ),
          ],
        ),
        ),
      ),
    );
  }
}
