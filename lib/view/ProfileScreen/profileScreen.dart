import 'package:flutter/material.dart';
import 'package:todo_app/common/app_color.dart';
import 'package:todo_app/view/EditProfile/editProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.screenbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Spacer(),

                  /// Profile Appbar
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),

                  /// Log out Button
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.logout_rounded,
                      color: AppColor.textColor,
                      size: 26,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),

              /// Profile picture circle
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.textColor.withOpacity(.04),
                      blurRadius: 1,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(.2),
                  radius: 80,
                  child: const CircleAvatar(
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
                ),
              ),
              SizedBox(height: height * 0.02),

              /// Profile Text
              const Text(
                'Subhajit',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.04),

              /// Profile Buttons
              profileButtonsWidget(
                buttontext: 'Edit Profie',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfileScreen()));
                },
              ),
              SizedBox(height: height * 0.02),

              /// how many todo's complete are not
              profileButtonsWidget(
                buttontext: 'Complete Todo',
                onTap: () {},
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  /// profile buttons widget
  Widget profileButtonsWidget(
      {required String buttontext, required Function() onTap}) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: AppColor.todoItemColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            buttontext,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),

          /// Arrow icon button
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.textColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
