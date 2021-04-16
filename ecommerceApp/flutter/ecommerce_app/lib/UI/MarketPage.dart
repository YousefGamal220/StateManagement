import 'package:ecommerce_app/BLoCs/MarketBloc.dart';
import 'package:ecommerce_app/Models/Market.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    marketBloc.fetchAllMobiles();
    return StreamBuilder<Market>(
        stream: marketBloc.allMobiles,
        builder: (context, AsyncSnapshot<Market> snapshot) =>
            snapshot.connectionState != ConnectionState.waiting
                ? _mainWidget(context, snapshot)
                : Center(
                    child: CircularProgressIndicator(),
                  ));
  }

  Widget _mainWidget(BuildContext context, AsyncSnapshot<Market> snapshot) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Market"),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.shopping_cart), label: "market"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_fill), label: "profile"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2), label: "chat")
            ],
          ),
          tabBuilder: (context, index) {
            if (index == 0)
              return _storeWidget(context, snapshot);
            else
              return Container();
          },
        ),
      ),
    );
  }

  Widget _storeWidget(BuildContext context, AsyncSnapshot<Market> snapshot) =>
      _gridView(context, snapshot);

  Widget _gridView(BuildContext context, AsyncSnapshot<Market> snapshot) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: snapshot.data!.numPhones,
        itemBuilder: (BuildContext context, int index) =>
            _mobileComponentGrid(context, snapshot, index));
  }

  Widget _mobileComponentGrid(
      BuildContext context, AsyncSnapshot<Market> snapshot, int index) {
    return Card(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 80,
                child: Image(
                  image:
                      NetworkImage("${snapshot.data!.phones[index].imageUrl}"),
                  fit: BoxFit.fill,
                )),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${snapshot.data!.phones[index].model}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              "EGP${snapshot.data!.phones[index].price}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CupertinoButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.cart_fill),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Add to Cart")
                  ],
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
