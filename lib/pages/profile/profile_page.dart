import 'package:flutter/material.dart';
import 'package:the_movie/values/values.dart';
import 'package:the_movie/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String ava =
      'https://www.meme-arsenal.com/memes/e21e0322937679d2d732dc295b95a282.jpg';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = 'Viet Tran';
    _emailController.text = 'viettranvan2k@gmil.com';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile', style: kTextSize28w500White),
        actions: [
          GestureDetector(
            onTap: () => print('log out'),
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.logout, size: 30.0, color: AppColor.white),
            ),
          )
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.background,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150.0),
                    child: FadeInImage(
                      placeholder: const AssetImage(
                          'assets/images/image_placeholder.gif'),
                      image: NetworkImage(ava),
                      fit: BoxFit.cover,
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () => print('Edit Photo'),
                  child: const Center(
                    child: Text(
                      'Edit Photo',
                      style: kTextSize15w400Blue,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text('Name', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(
                  controller: _nameController,
                  hintText: 'Name',
                ),
                const SizedBox(height: 10.0),
                const Text('Email', style: kTextSize20w400White),
                const SizedBox(height: 10.0),
                ReusableTextField(controller: _emailController, enabled: false),
                const SizedBox(height: 20.0),
                ReusableButton(
                  onTap: () {},
                  buttonTitle: 'Save',
                  buttonColor: AppColor.yellow,
                ),
                const SizedBox(height: 10.0),
                ReusableButton(
                  onTap: () {},
                  buttonTitle: 'Change Password',
                  buttonColor: AppColor.green,
                ),
                const SizedBox(height: 20.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
