import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController section = TextEditingController();
  var drop = '';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              TextFormField(
                controller: id,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Ex. 2020300482', labelText: 'ID Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'Ex. Adrian', labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: birthday,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    hintText: 'Ex. 02/23/2001', labelText: 'Birthday'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: course,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Ex. BS-IT', labelText: 'Course'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: section,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: 'Ex. IT3R1', labelText: 'Section'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    return null;
                  }
                },
              ),
              DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: Text('Other'),
                    ),
                  ],
                  onChanged: (value) {
                    drop = value.toString();
                  }),
              SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          List data = <Map<String, dynamic>>[
                            {
                              'id': id.text,
                              'name': name.text,
                              'birthday': birthday.text,
                              'course': course.text,
                              'section': section.text,
                              'gender': drop
                            }
                          ];

                          Navigator.pop(context, data);
                        }
                      },
                      child: const Text('Submit')))
            ],
          )),
    );
  }
}
