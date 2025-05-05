import 'package:flutter/material.dart';
import 'package:lifehero/View/ChallengeView.dart';

import '../Widget/Navigation.dart';
import '../colors.dart';
import 'LoginView.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/solofit.png"),
              SizedBox(height: 40,),
              const SizedBox(height: 5),
              Text(
                "Зарегистрируйтесь, чтобы продолжить!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  color: AppColors.greyText,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.face, color: AppColors.greyText),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.borderLight),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.borderLight),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.primary, width: 2),
                      ),
                      labelText: "Имя пользователя",
                      labelStyle: TextStyle(
                        color: AppColors.greyText,
                        fontFamily: 'Inter',
                      ),
                      filled: true,
                      fillColor: AppColors.cardLight,
                    ),
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.email_outlined, color: AppColors.greyText),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.borderLight),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.borderLight),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.primary, width: 2),
                      ),
                      labelText: "Почта",
                      labelStyle: TextStyle(
                        color: AppColors.greyText,
                        fontFamily: 'Inter',
                      ),
                      filled: true,
                      fillColor: AppColors.cardLight,
                    ),
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 1,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.lock_outline, color: AppColors.greyText),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.greyText,
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.borderLight),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.borderLight),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: AppColors.primary, width: 2),
                      ),
                      labelText: "Пароль",
                      labelStyle: TextStyle(
                        color: AppColors.greyText,
                        fontFamily: 'Inter',
                      ),
                      filled: true,
                      fillColor: AppColors.cardLight,
                    ),
                    style: TextStyle(
                      color: AppColors.darkText,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigationView()));},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Зарегистрироваться",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Уже есть аккаунт?",style: TextStyle(
                      color: AppColors.greyText,),),
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Войти", style: TextStyle(color: AppColors.primary),))
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cardLight,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: AppColors.darkText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cardLight,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/mac.png",
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Apple",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: AppColors.darkText,
                            ),
                          ),
                        ],
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
