import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateOrEditCategory extends StatefulWidget {
  const CreateOrEditCategory({super.key});

  @override
  State<CreateOrEditCategory> createState() => _CreateOrEditCategoryState();
}

class _CreateOrEditCategoryState extends State<CreateOrEditCategory> {
  final _nameCategoryTextController = TextEditingController();
  final List<Color> _colorDataSouce = [];
  Color? colorSelected ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _colorDataSouce.addAll({
      const Color(0xffC9CC41),
      const Color(0xff66CC41),
      const Color(0xff41CCA7),
      const Color(0xff4181CC),
      const Color(0xff41A2CC),
      const Color(0xffCC8441),
      const Color(0xff9741CC),
      const Color(0xffCC4173),
      const Color(0xffb15e5e),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'create_category_page_title'.tr(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: _buildBodyPageScreen(),
    );
  }

  Widget _buildBodyPageScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategoryNameField(),
        _buildCategoryChooseIconField(),
        _buildCategoryChooseBackgroundColorField(),
        const Spacer(),
        _buildCategoryCancelAndCreateButton(),
      ],
    );
  }

  Widget _buildCategoryNameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle('create_category_form_category_name_label'.tr()),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: TextFormField(
              controller: _nameCategoryTextController,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  hintText:
                      'create_category_form_category_name_placeholder'.tr(),
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0xffAFAFAF)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: Color(0xff979797), width: 1))),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryChooseIconField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle('create_category_form_category_icon_label'.tr()),
          GestureDetector(
            onTap: () {
              print('Hello, Choosen item from other screen');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffFFFFFF).withOpacity(0.21)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'create_category_form_category_choose_icon_label'.tr(),
                  style: TextStyle(
                      fontSize: 12, color: Colors.white.withOpacity(0.87)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryChooseBackgroundColorField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle('create_category_form_category_color_label'.tr()),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 36,
            child: ListView.builder(
               itemCount: _colorDataSouce.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                 final color = _colorDataSouce.elementAt(index);
                 final isSelected = colorSelected == color;
                  return GestureDetector(
                    onTap: (){
                      print('index: $index');
                      setState(() {
                        colorSelected = color;
                      });
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36 / 2),
                          color: color),
                      child: isSelected ? const Icon(Icons.check, color: Colors.white,size: 20,) : null,
                    ),

                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryCancelAndCreateButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 60) ,
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('common_cancle'.tr(),
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Lato",
                    color: Color(0xff8687E7))),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: () {
                _onHandleCreateCategory();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff8875FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: Text('create_category_create_button'.tr(),
                  style: const TextStyle(
                      fontSize: 16, fontFamily: "Lato", color: Colors.white)))
        ],
      ),
    );
  }


  Widget _buildFieldTitle(String titleLabel) {
    return Text(titleLabel,
        style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.87)));
  }

  void _onHandleCreateCategory(){
    final categoryName = _nameCategoryTextController.text;
    print(categoryName);
  }


}
