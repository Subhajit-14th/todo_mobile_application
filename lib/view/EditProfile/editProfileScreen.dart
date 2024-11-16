import 'package:flutter/material.dart';
import 'package:todo_app/common/app_color.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "Subhajit";
    _emailController.text = "subhajitdtt700@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.screenbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),

              /// Profile Heading
              Row(
                children: [
                  /// Back Icon
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.textColor,
                    ),
                  ),
                  SizedBox(width: width * 0.26),

                  /// Profile Appbar
                  const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),

              /// Profile picture edit circle
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.green,
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 8,
                      child: InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: AppColor.todoItemColor,
                          child: Icon(
                            Icons.edit,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),

              /// Name Heading
              const Text(
                'Name',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),

              /// Name text field
              _craeteTodoTextfield(
                controller: _nameController,
                hintText: '',
                onChanged: (value) {},
              ),
              SizedBox(height: height * 0.02),

              /// Email Heading
              const Text(
                'Email',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.01),

              /// Email Text field
              TextFormField(
                controller: _emailController,
                readOnly: true,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintStyle: const TextStyle(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: AppColor.borderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: AppColor.borderColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: AppColor.borderColor,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 18, top: 18, bottom: 18),
                ),
                style: const TextStyle(
                  color:
                      AppColor.textColor, // Change this to your desired color
                  fontSize:
                      16, // Optional: Set the font size or any other style properties
                ),
                maxLines: 1,
                cursorColor: AppColor.cursorColor,
              ),
              SizedBox(height: height * 0.06),

              /// Update Button
              InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Textfield widget
  Widget _craeteTodoTextfield(
      {required TextEditingController controller,
      required String hintText,
      required Function(String)? onChanged}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        focusColor: Colors.white,
        hintStyle: const TextStyle(
          color: AppColor.textColor,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 18, top: 18, bottom: 18),
      ),
      style: const TextStyle(
        color: AppColor.textColor, // Change this to your desired color
        fontSize:
            16, // Optional: Set the font size or any other style properties
      ),
      maxLines: 1,
      cursorColor: AppColor.cursorColor,
      onChanged: onChanged,
    );
  }
}
