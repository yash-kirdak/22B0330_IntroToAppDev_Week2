import 'package:flutter/material.dart';
import 'list_item.dart';

void main() {
  runApp(const MaterialApp(
    home:Home()
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int amount = 46500;
  List<List_item> list = [List_item(Category:'Grocery',Amount:1500),List_item(Category:'Bills',Amount:2000),List_item(Category:'Salary',Amount:50000)] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Budget Tracker'),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0,150, 0, 50),
              child: Column(
                children: [
                  Text('Total Amount :',
                  style: TextStyle(
                    fontSize:25,
                    color: Colors.grey[800]
                  ),
                  ),
                      Text('Rs ${amount}',
                      style:const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    )
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,0),
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context,index){
                      return Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width:2.5,
                            color:Colors.blueAccent
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${list.elementAt(index).category}',
                            style:TextStyle(
                              color: Colors.grey[500],
                              letterSpacing: 2,
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            Text('${list.elementAt(index).amount}',
                             style:TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold
                               ),)
                          ],
                        ),
                      );
                    },
                  ),
                )
            )
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.extended(
              label:const Text('Spend'),
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Spent Money'),
                  content:const SizedBox(
                      height:150,
                      child:Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Category',
                              border: InputBorder.none,
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Amount',
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      )
                  ),
                  actions: [
                    TextButton(
                        onPressed: (){Navigator.of(context).pop();},
                        child: const Text('Done', style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                    )
                  ],
                ),
              ),
          ),

          FloatingActionButton.extended(
            label:const Text('Add'),
            icon: const Icon(Icons.add),
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Added Money'),
                  content:const SizedBox(
                    height:150,
                    child:Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                          labelText: 'Category',
                          border: InputBorder.none,
                        ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                          labelText: 'Amount',
                          border: InputBorder.none,
                        ),
                        ),
                      ],
                    )
                  ),
                  actions: [
                    TextButton(
                        onPressed: (){Navigator.of(context).pop();},
                        child: const Text('Done', style:TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                    )
                  ],
                ),
              ),
          )
        ],
      ),

    );
  }
}
