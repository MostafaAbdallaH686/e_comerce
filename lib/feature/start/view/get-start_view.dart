import 'package:flutter/material.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/localization/app_string_keys.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/feature/auth/login/presentation/login_screen.dart';
import 'package:ntigradproject/feature/auth/register/presentation/register_screen.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(
            AppImage.getstart,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.93),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppStringKeys.getstartedfisrst,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.getstartedfirst,
                ),
                SizedBox(height: 24),
                Text(
                  AppStringKeys.getstartedsecond,
                  style: AppTextStyle.getstartedsecond,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => AppRoute.navigateTo(LoginScreen()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: MyColors.red,
                    ),
                    child: Text(
                      AppStringKeys.login,
                      style: AppTextStyle.logintext,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => AppRoute.navigateTo(RegisterScreen()),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(color: MyColors.red),
                    ),
                    child: Text(
                      AppStringKeys.register,
                      style: AppTextStyle.registertext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: [
//           Image.asset(
//             AppImage.getstart,
//             fit: BoxFit.cover,
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//           ),
//           Container(
//             width: double.infinity,
//             height: MediaQuery.of(context).size.height * 0.45,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomCenter,
//                 end: Alignment.topCenter,

//                 colors: [
//                   Colors.black.withAlpha(160),
//                   Colors.black.withAlpha(0),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.75,
//                   child: Text(
//                     'data data data data data data ',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 50, color: Colors.white),
//                   ),
//                 ),
//                 Text(
//                   'data',
//                   style: TextStyle(fontSize: 50, color: Colors.white),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(builder: (context) => TestView()),
//                       // );
//                     },
//                     child: Text(AppStringKeys.login.tr),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await CacheHelper.saveData(
//                       key: CacheHelperKeys.langKey,
//                       value: CacheHelperKeys.keyAR,
//                     );
//                     await Get.updateLocale(AppStringKeys.localeAR);
//                     CacheData.lang = CacheHelperKeys.keyAR;
//                   },
//                   child: Text('register'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
