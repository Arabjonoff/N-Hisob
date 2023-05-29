// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:n_hisob/src/theme/color/colors.dart';
//
// import '../../utils/utils.dart';
// import '../../widget/textfield/textfield_widget.dart';
// import 'category_model.dart';
//
//
// class UpdateCategoryDialog {
//   static void showUpdateCategoryDialog(BuildContext context,CategoryModel categoryModel) {
//     TextEditingController controller = TextEditingController(text: categoryModel.name);
//     showDialog(
//         context: context,
//         builder: (context) {
//           return StatefulBuilder(builder: (context, setState) {
//             double h = Utils.getHeight(context);
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),),
//               backgroundColor: AppColor.background,
//               title: Text('Agent turini ozgartirish'),
//               content: SizedBox(
//                 height: 100 * h,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       TextFieldWidget(
//                         horizontal: true,
//                         controller: controller,
//                         icon: 'assets/icons/category.svg',
//                         hint: 'Turini kiriting',
//                         type: false,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Bekor qilish')),
//                 TextButton(
//                     onPressed: () async {
//                       Repository repo = Repository();
//                       HttpResult res = await repo.categoryUpdate(categoryModel.id,controller.text);
//                       if(res.result["status"] == 'ok'){
//                         Navigator.pop(context);
//                         categoryBloc.getCategories();
//                       }
//                     },
//                     child: Text('Ozgartirish')),
//               ],
//             );
//           });
//         });
//   }
// }
