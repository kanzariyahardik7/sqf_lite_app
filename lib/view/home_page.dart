import 'package:sqf_lite_app/model/user_model.dart';
import 'package:sqf_lite_app/services/db_handler.dart';
import 'package:sqf_lite_app/universal_widget/mytext.dart';
import 'package:flutter/material.dart';
import 'package:sqf_lite_app/universal_widget/textfield.dart';
import 'package:sqf_lite_app/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UserModel> readList = [];
  String name = "";
  String age = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("SQFLite App"),
          actions: [
            IconButton(
                onPressed: () async {
                  await DBHandler().clearTable(DBHandler.tableName);
                },
                icon: const Icon(Icons.cleaning_services_sharp)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // open dialog box
            openDialogBox();
            // await DBHandler.instance
            //     .insertData(UserModel(name: "Name 3", age: 42));
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    readList = await DBHandler.instance.readData();
                    debugPrint("${readList}");
                    setState(() {});
                  },
                  child: const MyText(text: "Read")),
              ElevatedButton(
                  onPressed: () async {
                    await DBHandler.instance.updateData(
                        UserModel(id: 1, name: "Name 1 update", age: 42));
                  },
                  child: const MyText(text: "Update")),
              ElevatedButton(
                  onPressed: () async {
                    await DBHandler.instance.deleteData(2);
                  },
                  child: const MyText(text: "Delete")),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    debugPrint("readList.length -----?? ${readList.length}");
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(border: Border.all(color: red)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "id: ${readList[index].id.toString()}",
                            color: black0,
                            fontsize: 20,
                            fontweight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                            text: "name: ${readList[index].name}",
                            color: black0,
                            fontsize: 20,
                            fontweight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MyText(
                            text: "age: ${readList[index].age.toString()}",
                            color: black0,
                            fontsize: 20,
                            fontweight: FontWeight.bold,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: readList.length)
            ],
          ),
        ));
  }

  openDialogBox() {
    showDialog(
      barrierDismissible: false,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.sizeOf(context).width,
            color: white0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(
                  isfeel: false,
                  label: "Enter name",
                  onChanged: (value) {},
                  text: name,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 8),
                TextFieldWidget(
                  isfeel: false,
                  label: "Enter age",
                  onChanged: (value) {},
                  text: age,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                        child: SizedBox(
                      width: 1,
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            color: white1,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: MyText(
                            text: "Cancle",
                            color: red,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        width: 80,
                        decoration: BoxDecoration(
                            color: white1,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: MyText(
                            text: "Save",
                            color: green,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
