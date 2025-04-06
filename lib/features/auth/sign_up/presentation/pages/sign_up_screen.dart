import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/local/prefs_helper.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/manager/sign_up_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

late TextEditingController nameController;
late TextEditingController emailController;
late TextEditingController passwordController;
late TextEditingController phoneController;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    phoneController=TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => getIt.get<SignUpViewModelCubit>(),
  child: Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s40.h,
                  ),
                  BuildTextField(
                    controller: nameController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: phoneController,
                    hint: 'enter your mobile number',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: emailController,

                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    controller: passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s50.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery.of(context).size.width * .9,
                        child: BlocConsumer<SignUpViewModelCubit,
                            SignUpViewModelState>(
                          listener: (context, state) {
                            if(state is SignUpErrorState){
                             showDialog(context: context,

                                 builder: (context) => AlertDialog(
                                   alignment: Alignment.bottomCenter,
                                   content: Column(
                                     mainAxisSize: MainAxisSize.min,


                                     children: [
                                       Text(state.massage,style: getSemiBoldStyle(color: ColorManager.black),),
                                     ],
                                   ),
                                 ),);
                            }
                            else if(state is SignUpSuccessState){

                              PrefsHelper.saveToken(state.signUpEntity.token!);
                              Navigator.pushReplacementNamed(context,Routes.mainRoute );
                            }
                          },
                          builder: (context, state) {
                            var cubit=BlocProvider.of<SignUpViewModelCubit>(context);
                            return CustomElevatedButton(
                              isLoading: state is SignUpLoadingState,
                              // borderRadius: AppSize.s8,
                              label: 'Sign Up',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20.sp),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.registerNewUser(name:nameController.text ,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      rePassword: passwordController.text,
                                      phone: phoneController.text);
                                }

                              },
                            );
                          },
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
);
  }
}
