import 'package:excel/excel.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:webtest/utils/styles.dart';
import 'package:webtest/widgets/history_table.dart';
import 'package:webtest/widgets/primary_button.dart';
import 'package:webviewx/webviewx.dart';
import '../../demo/filter_model.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
  //static List<User> selectedUserList = [];
   List<User> selectedUserList=[];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewXController webviewController;
  @override
  Widget build(BuildContext context) {
    void openFilterDialog() async {

      await FilterListDialog.display<User>(
        context,
        onApplyButtonClick: (list) {
          setState(() {
            widget.selectedUserList.clear();
            widget.selectedUserList = List.from(list!);
            print( widget.selectedUserList.first.name);
          });
          Navigator.pop(context);
        },
        listData: userList,
        backgroundColor: mainColor,
        enableOnlySingleSelection: true,
        width: 600,
        hideSelectedTextCount: true,
        selectedListData:  widget.selectedUserList,
        choiceChipLabel: (user) => user!.name,
        validateSelectedItem: (list, val) => list!.contains(val),
        onItemSearch: (user, query) {
          return user.name!.toLowerCase().contains(query.toLowerCase());
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Queue History',
                    style: TextStyles.headerStyle,
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                'Flutter\'s default behavior is resize'
                ' which Responsive Framework respects.'
                ' AutoScale is off by default and can be '
                'enabled at breakpoints by setting autoScale'
                ' to true.',
                style: TextStyles.blackTextStyle,
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          openFilterDialog();
                        },
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.mainColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            shape: BoxShape.rectangle,
                            color: mainColor,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(Feather.filter,color: Colors.white,size: 12,),
                                ),
                                Center(
                                    child: Text('Filter',
                                        style: TextStyles.whiteTextStyle)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (widget.selectedUserList.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,

                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  //offset: Offset(3, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(14),
                              shape: BoxShape.rectangle,
                              //gradient: Gradients.blueGradient,
                              color: AppColors.mainColor.withOpacity(0.1),
                              border: Border.all(
                                color: AppColors.mainColor,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.values[2],
                                children:  [
                                  Text( widget.selectedUserList.single.name??"",
                                      // HomePage.selectedUserList.first.name.toString(),
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         widget.selectedUserList.clear();
                                       });
                                     },
                                    child: const Icon(
                                      Icons.close,
                                      color: mainColor,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  PrimaryButton(
                      text: "Export",
                      onPressed: () {
                    excelSheet();
                  })
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const HistoryTable(),
            ],
          ),
        ),
      ),
    );
  }

  void excelSheet() {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['SheetName'];
    excel.delete('Sheet1');
    List<Data>? cell3 = [];
    CellStyle cellStyle = CellStyle(
        backgroundColorHex: "#C0D6E4",
        bold: true,
        fontFamily: getFontFamily(FontFamily.Calibri));
    for(int i = 0; i<6;i++){
      cell3.add(sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i,rowIndex: 0)));
    }

    for (var element in cell3) {
      element.cellStyle = cellStyle;
    }
    List<String> dataList = [
      "Date",
      "Vehicle No",
      "Student Name",
      "Class",
      "Parents Name",
      "Entry time",
    ];
    sheetObject.insertRowIterables(dataList, 0);
    sheetObject.appendRow(["10/09/2022", "SHB-2345", "Alex","LKG-A","Richie","16:30"]);
    sheetObject.appendRow(["10/09/2022", "SHB-2345", "Alex","LKG-A","Richie","16:30"]);
    sheetObject.appendRow(["10/09/2022", "SHB-2345", "Alex","LKG-A","Richie","16:30"]);
    sheetObject.appendRow(["10/09/2022", "SHB-2345", "Alex","LKG-A","Richie","16:30"]);
    sheetObject.appendRow(["10/09/2022", "SHB-2345", "Alex","LKG-A","Richie","16:30"]);
    var file= excel.save(fileName: "My_Excel_File_Name.xlsx");
  }

  CellStyle cellStyle1 = CellStyle(
    bold: true,
    italic: true,
    textWrapping: TextWrapping.WrapText,
    fontFamily: getFontFamily(FontFamily.Comic_Sans_MS),
    rotation: 0,
  );
}
