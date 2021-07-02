import 'package:flutter/material.dart';

class scrollablelistview extends StatefulWidget {
  @override
  _scrollablelistviewState createState() => _scrollablelistviewState();
}

class _scrollablelistviewState extends State<scrollablelistview> with SingleTickerProviderStateMixin {

  TabController _tabcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller=TabController(length: 10, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrollable  Listview"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                children: [
                  Text("Homepage"),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 17,
                    child: ClipOval(
                      child: Image.asset("assets/car.png",height: 30,fit: BoxFit.cover,),
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.green,
              height: 60,
              child: TabBar(
                controller: _tabcontroller,
                indicatorWeight: 0.1,
                isScrollable: true,
                tabs: List.generate(10, (index) => _RappiTabWidget())

              ),
            ),
            Expanded(
                child:  Container(
                  color: Colors.blue,
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: 15,
                      itemBuilder: (context,index){
                        if(index.isOdd){
                          return _RappiCategoryItem();
                        }else{
                          return _RappiProductItem();

                        }
                      }
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}


class _RappiTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Pizza",style: TextStyle(color: Colors.blue),),
      ),
    );
  }
}


class _RappiCategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      height: 55,
      alignment: Alignment.centerLeft,
      child: Text("Category"),
    );
  }
}


class _RappiProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Text("Product"),

    );
  }
}


