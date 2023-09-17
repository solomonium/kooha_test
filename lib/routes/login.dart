import 'package:flutter/material.dart';
import 'package:kooha_test/export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FormMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = false;
  String? email;
  String? password;

  bool isEmailValid = false;

  void handlePasswordChange(String? text) {
    setState(() {
      obscurePassword = text == null || text.isEmpty;
      passwordController.text = text!;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        68.verticalSpace,
                        CustomAppBar(
                            isWidget: true,
                            middleOrEndWidget: PrimaryButton(
                                width: 200.w,
                                height: 39,
                                color: theme.grey.withOpacity(0.5),
                                buttonText: R.S.switchToCreate,
                                buttonTextColor: theme.secondary,
                                onPressed: () {})),
                        32.verticalSpace,
                        PrimaryText(text: R.S.welcomeBack),
                        8.verticalSpace,
                        SecondaryText(text: R.S.beReady),
                        47.verticalSpace,
                        CustomTextField(
                          textInputType: TextInputType.emailAddress,
                          labelText: R.S.email,
                          textController: emailController,
                          hintText: 'john@email.com',
                          autoFocus: true,
                          validate: Validator.email,
                          textInputAction: TextInputAction.next,
                          onChanged: (newValue) {
                            setState(() {
                              email = newValue;
                              isEmailValid = Validator.isEmailValid(newValue);
                              print(isEmailValid);
                            });
                          },
                          suffixIcon: isEmailValid
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 0, right: 17, bottom: 10),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: theme
                                        .secondary, // Color for the checkmark icon
                                  ),
                                )
                              : null, // Display the checkmark icon when email is valid
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          isPassword: true,
                          textInputType: TextInputType.emailAddress,
                          labelText: R.S.password,
                          hintText: R.S.passwordMin,
                          textController: passwordController,
                          suffixIcon: passwordController.text.isEmpty
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () => setState(() {
                                    obscurePassword = !obscurePassword;
                                  }),
                                  // togglePasswordVisibility, // Use the toggle function directly
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        left: 0,
                                        right: 17,
                                        bottom: 10),
                                    child: PrimaryText(
                                      text: obscurePassword ? 'Show' : 'Hide',
                                      color: theme.secondary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                          obscure: false,
                          autoFocus: false,
                          validate: Validator.password(minLength: 8),
                          textInputAction: TextInputAction.done,
                          onChanged: handlePasswordChange,
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Wrap(children: [
                              SecondaryText(
                                text: R.S.forgotPassword,
                                color: theme.grey,
                              ),
                              SecondaryText(
                                text: R.S.resetIt,
                                color: theme.secondary,
                                fontWeight: FontWeight.w600,
                              )
                            ]).rippleClick(() {
                              // context.pushOff(const SignUpScreen());
                            }),
                          ),
                          10.verticalSpace,
                          PrimaryButton(
                              isLoading: isLoading,
                              buttonText: 'Log me in',
                              onPressed: () {
                                validate(() {
                                  load(() => AuthCmd(context).login({
                                            "email": emailController.text,
                                            "password": passwordController.text,
                                          })
                                      //  context.push(const MainScreen())
                                      );
                                });
                                // context.push(const MainScreen());
                              }),
                          30.verticalSpace,
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
