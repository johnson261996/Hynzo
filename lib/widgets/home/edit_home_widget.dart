import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/edit_home_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/search_bar/search_bar.dart';

class EditHomeWidget extends StatefulWidget {
  @override
  _EditHomeWidgetState createState() => _EditHomeWidgetState();
}

class _EditHomeWidgetState extends State<EditHomeWidget> {
  String search = '';
  bool _isLoading = true;
  Map<String,dynamic> PinnedMapItems ={};
  late final VoidCallback onClicked;
  String pinned_items='';
  List<EditHomeModel> _items = [];
  List<EditHomeModel> display_items = [];

  //check the internet connection
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () =>
          StorePinnedItemsInLocaStorage(),
      child: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: ()async {
                StorePinnedItemsInLocaStorage();
                Navigation.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                  left: 10.0,
                ),
                child: Image.asset(
                  'assets/images/top_back.png',
                  width: 15,
                  height: 15,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: mediaQuery.width * 0.02,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
              ),
              child: Text(
                Strings.EDIT_HOME_SCREEN,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: AppColors.greyBlack,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
              ),
              const SizedBox(
          height: 20,
              ),
              SearchBar(
          hintText: Strings.SEARCH_GAMES,
          onchangeFunc: (val) {
            setState(() {
              search = val.toString().toLowerCase();
              log("search text:" + search + "\nval:" + val + "");
            });
          },
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
              ),
              const SizedBox(
                  height: 10,
              ),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Colors.transparent,shadowColor: Colors.transparent,),
                child: ReorderableListView.builder(
                  buildDefaultDragHandles: true,
                  onReorder:(oldIndex, newIndex) {
                    setState(() {
                      //display_items[newIndex].isSelected ? Image.asset("assets/images/push_pin_on.png") : Image.asset("assets/images/push_pin_off.png");
                      display_items[oldIndex].isSelected = ! display_items[oldIndex].isSelected;
                      if (newIndex > oldIndex) {
                        newIndex = newIndex - 1;
                      }

//                      if(display_items[newIndex].isSelected){
//                        display_items.sort((a,b)=>compare(a.isSelected,b.isSelected));
//                      }
                      final element = display_items.removeAt(oldIndex);
                      display_items.insert(newIndex, element);
                      log("newIndex:$newIndex\noldIndex:$oldIndex");
                      StorePinnedItemsInLocaStorage();
                    });
                  },


                //physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: display_items.length,
                itemBuilder: (context, index) {
                  return display_items[index].title
                      .toLowerCase()
                      .contains(search)?
                  Card(
                    key: ValueKey(index),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),

                    elevation: 5,
                    //color: Colors.grey[200],
                    margin: EdgeInsets.all(10),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10.0),
                              child: Text(
                                display_items[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: mediaQuery.width * 0.02,
                            ),

                             const Spacer(),

                            Container(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                                top: 5.0,
                                bottom: 5.0,
                                left: 10.0,
                              ),
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: mediaQuery.width * 0.005,
                                  ),
                              GestureDetector(
                                child:
                                display_items[index].isSelected ? Image.asset("assets/images/push_pin_on.png") : Image.asset("assets/images/push_pin_off.png"),
                                onTap: () {
                                setState(() {
                                  display_items[index].isSelected = ! display_items[index].isSelected;
                                  log("index:$index");
                                  display_items.sort((a,b)=>compare(a.isSelected,b.isSelected));
                                });
                              },)
                                ],
                              ),
                            )
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Padding(
                                padding: const EdgeInsets.only(left:20, bottom: 20,top: 10),
                                child: Image.asset(display_items[index].img,width: mediaQuery.width * 0.7,fit: BoxFit.fitWidth,),
                              ),

                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset('assets/images/more_dot.png',height: 25,width: 12,),
                          ),
                        ],
                      )
                    ]),
                  ):
                  Container(decoration: BoxDecoration(color: Colors.grey),
                    key: ValueKey(index),);
                },

                ),

                ),
              ),
            ]),
        ),
      ),
    );
  }

  int compare(bool a, bool b) {
    //print("Bool: b" + b.toString() + "\nBool: a" + a.toString());
    if(b) {
      return 1;
    }
    return -1;
  }

  _getListData() async{
    await LocalStorage.getPinnedStatus().then((value) =>  pinned_items=value! );
    if(pinned_items!='') {
      PinnedMapItems = json.decode(pinned_items);
    }

//    log("length value:" +selectd!.length.toString(),);
    log("Map get pinned" + PinnedMapItems.toString(),);
    Future.delayed(Duration(milliseconds: 500));

    setState(() {
      _items.add(EditHomeModel("New Messages","assets/images/new_message_img.PNG", false));
      _items.add(EditHomeModel("Special Events","assets/images/event_img.PNG", false));
      _items.add(EditHomeModel("Covid 19","assets/images/covid_19_img.PNG", false));
      _items.add(EditHomeModel("Games","assets/images/games_img.PNG", false));
      _items.add(EditHomeModel("Todays News","assets/images/news_img.PNG", false));
      _items.add(EditHomeModel("Games by Categories","assets/images/games_categories.PNG", false));
      _items.add(EditHomeModel("Recent games","assets/images/games_img.PNG", false));
      _items.add(EditHomeModel("Top News","assets/images/news_img.PNG", false));

      display_items.clear();

        PinnedMapItems.forEach((key, value) {

          if(value) {
            for(int i=0;i<_items.length;i++){
            if(_items[i].title == key) {
              _items[i].isSelected = true;
              display_items.add(_items[i]);
            }

          }
          }
        });

        PinnedMapItems.forEach((key, value) {
          if(!value) {
            for(int i=0;i<_items.length;i++) {
              if (_items[i].title == key) {
                display_items.add(_items[i]);
              }
            }
          }
        });


      if(display_items.isEmpty){
          display_items = _items;
        }

      for(int i=0;i<display_items.length;i++){
        log("items:" +  display_items[i].title);
      }
      _isLoading = false;
    });

  }


  @override
  void initState() {
    _getListData();
  }



  Future<bool> StorePinnedItemsInLocaStorage() {
    PinnedMapItems.clear();
    for(int i=0;i<display_items.length;i++){
      PinnedMapItems[display_items[i].title] = display_items[i].isSelected;
      print('items store in map:${display_items[i].title}');
    }
    log("map storing :" + PinnedMapItems.toString());
    pinned_items = jsonEncode(PinnedMapItems);
    LocalStorage.setPinnedStatus(pinned_items);
    return Future.value(true);
  }


}

