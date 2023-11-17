import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

Widget kdefultButtom({
  required String title,
  required Color borderColor,
  required double? width,
  required double? height,
  required void Function()? onPressed,
}) =>
    Container(
      width: (width != null) ? width : double.infinity,
      height: (height != null) ? height : 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: borderColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defultButtom({
  double? width = double.infinity,
  double? height = 55.0,
  Color? backgroundcolor = const Color.fromARGB(255, 5, 24, 42),
  double borderRadius = 12,
  String title = 'defult',
  bool isUpperCase = false,
  required Function? function,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundcolor,
      ),
      child: MaterialButton(
        onPressed: function!(),
        child: Text(
          isUpperCase ? title.toUpperCase() : title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  Function(String)? onFieldSubmitted,
  Function(String)? onChanged,
  void Function()? onTap,
  String? Function(String?)? validator,
  required String textlabel,
  required IconData prefixIcon,
  Function()? onPressedSuffix,
  bool isClickable = true,
  IconData? suffixIcon,
  bool isPassWord = false,
}) =>
    TextFormField(
      enabled: isClickable,
      onTap: onTap,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      obscureText: isPassWord,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            )),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPressedSuffix,
                icon: Icon(
                  suffixIcon,
                  color: Colors.grey,
                ))
            : null,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        labelText: textlabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

Widget buildeArticleItem({
  required articles,
  required context,
}) =>
    InkWell(
      onTap: () {
        //navigateTo(context, WebViewScreen(url: articles['url']));
      },
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 20.0, end: 20.0, top: 20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage('${articles['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${articles['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${articles['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articlesBuilder(List<dynamic> list, context, {isSearch = false}) =>
    ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildeArticleItem(articles: list[index], context: context),
        separatorBuilder: (context, index) => const SizedBox(
          height: 0.0,
        ),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );

void navigateTo(context, Widget widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, Widget widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

void notification({
  required String? message,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: message!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choosToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color choosToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
