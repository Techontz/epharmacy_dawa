import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditAddPrescriptionMedicineScreen extends StatefulWidget {
  @override
  _EditAddPrescriptionMedicineScreenState createState() =>
      _EditAddPrescriptionMedicineScreenState();
}

class _EditAddPrescriptionMedicineScreenState
    extends State<EditAddPrescriptionMedicineScreen> {
  List<File> _images = [];

  Future<void> _getImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    setState(() {
      if (pickedImage != null && _images.length < 4) {
        _images.add(File(pickedImage.path));
      }
    });
  }

  Widget _buildImageThumbnail(File image) {
    return GestureDetector(
      onTap: () {
        // Show image in larger size
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Image.file(image),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: FileImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit/Add Prescription Medicine'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Edit/Add Prescription Medicine',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.camera),
                child: Text('Add Image from Camera',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 136, 102),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.gallery),
                child: Text('Add Image from Gallery',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 136, 102),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _images.isNotEmpty
                  ? SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return _buildImageThumbnail(_images[index]);
                  },
                ),
              )
                  : SizedBox.shrink(),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Medicine Name'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Disease Name'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dosage'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prescription Number'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save prescription medicine data
                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 136, 102),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
