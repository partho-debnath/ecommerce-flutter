import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black54),
        title: const Text(
          'Create Review',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Form(
            key: form,
            child: Column(
              children: <Widget>[
                customTextFormField(
                  hintText: 'First Name',
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  theme: theme,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                customTextFormField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  theme: theme,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                customTextFormField(
                  hintText: 'Enter Review',
                  controller: reviewController,
                  maxLength: 10,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  theme: theme,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your review';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (form.currentState!.validate() == false) {
                      return;
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField customTextFormField({
    required TextEditingController controller,
    required ThemeData theme,
    required String hintText,
    required TextInputType keyboardType,
    required TextInputAction textInputAction,
    required String? Function(String?) validator,
    int maxLength = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
      ),
      maxLines: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}
