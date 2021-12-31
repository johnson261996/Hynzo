import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/core/models/all_games_model.dart';
import 'package:hynzo/core/models/edit_home_model.dart';
import 'package:hynzo/core/models/edit_message_model.dart';
import 'package:hynzo/core/models/events_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/widgets/common/image/circle_image_widget.dart';
import 'package:hynzo/widgets/common/image/rectangle_image_view.dart';
import 'package:hynzo/widgets/common/image/square_image_widget.dart';
import 'package:hynzo/widgets/common/no_data/no_data_error.dart';
import 'package:hynzo/widgets/common/search_bar/search_bar.dart';
import 'package:hynzo/widgets/common/view/event_view_widget.dart';

class EditHomeWidget extends StatefulWidget {
  @override
  _EditHomeWidgetState createState() => _EditHomeWidgetState();
}

class _EditHomeWidgetState extends State<EditHomeWidget> {
  String search = '';
  bool _isLoading = true;
  Map PinnedMapItems ={};
  late final VoidCallback onClicked;
  String pinned_items='';
  List<EditHomeModel> _items = [];

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
      onWillPop: () {
          StorePinnedItemsInLocaStorage();
          return Future.value(true);
      },
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
                Strings.Edit_HOME,
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
              search = val;
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
              child: ReorderableListView.builder(
                buildDefaultDragHandles: true,
                onReorder:(oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > oldIndex) {
                      newIndex = newIndex - 1;
                    }
                    final element = _items.removeAt(oldIndex);
                    _items.insert(newIndex, element);
                  });
                },
              //physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  key: ValueKey(_items[index].title),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),

                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 10.0),
                            child: Text(
                              _items[index].title,
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
                                _items[index].isSelected ? Image.asset("assets/images/push_pin_on.png") : Image.asset("assets/images/push_pin_off.png"),
                              onTap: () {
                              setState(() {
                                _items[index].isSelected = ! _items[index].isSelected;

                                log("index:$index");

                                _items.sort((a,b)=>compare(a.isSelected,b.isSelected));
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
                              child: Image.asset(_items[index].img,width: mediaQuery.width * 0.7,fit: BoxFit.fitWidth,),
                            ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset('assets/images/more_dot.png',height: 25,width: 12,),
                        ),
                      ],
                    )
                  ]),
                );
              }),
            )

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
    PinnedMapItems = json.decode(pinned_items);
//    log("length value:" +selectd!.length.toString(),);
    log("Map get pinned" + PinnedMapItems.toString(),);
    Future.delayed(Duration(milliseconds: 500));

    setState(() {

      _items.add(EditHomeModel("New Messages","assets/images/new_message_img.PNG", false));
      _items.add(EditHomeModel("Special Events","assets/images/event_img.PNG", false));
      _items.add(EditHomeModel("Games","assets/images/games_img.PNG", false));
      _items.add(EditHomeModel("Todays News","assets/images/news_img.PNG", false));
      _items.add(EditHomeModel("Games by Categories","assets/images/games_categories.PNG", false));
      _items.add(EditHomeModel("Recent games","assets/images/games_img.PNG", false));
      _items.add(EditHomeModel("Top News","assets/images/news_img.PNG", false));

      PinnedMapItems.forEach((k, v) {
        for(int i=0;i<_items.length;i++){
          if(k == _items[i].title){
            _items[i].isSelected = v;
            print("title : $k, selected : $v");
          }
        }
      });

      _items.sort((a,b)=>compare(a.isSelected,b.isSelected));
      _isLoading = false;
    });
  }

  @override
  void initState() {

    _getListData();
  }

  void StorePinnedItemsInLocaStorage() {
    for(int i=0;i<_items.length;i++){
      PinnedMapItems[_items[i].title]= _items[i].isSelected ;
    }
    log("map :" + PinnedMapItems.toString());
    pinned_items = jsonEncode(PinnedMapItems);
    LocalStorage.setPinnedStatus(pinned_items);
  }
}
