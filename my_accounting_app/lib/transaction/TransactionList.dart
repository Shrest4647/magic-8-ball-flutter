
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white10.withOpacity(0.1),
                  ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,            
                children: [
                  Text('Transactions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      print('Button Pressed');
                  }, 
                  child: Text('See All', style: TextStyle(color: Colors.blue),),
                  )

            ],),
              ),
          ),
          Expanded(
            flex: 5,
              child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Dismissible(
                  key: ValueKey(items),
                    onDismissed: (direction) {
                      setState(() {
                      items.removeAt(index);
                    });

                    Scaffold.of(context)
                        .showSnackBar(
                          SnackBar(
                            content: Text("$item dismissed")
                          ),
                        );
                  },
                  child: ListTile(
                    title: Text(item),
                    subtitle: Text('$item Date'),
                    leading: Icon(Icons.leaderboard_outlined),
                    trailing: Text('100', style: TextStyle(fontSize: 16.0)),
                    onTap: () => {
                      print('Tapped $item')
                    },
                    onLongPress: () => {
                      print('$item long presssed')
                    },
                    hoverColor: Colors.green,
                    ),
                    background: Container(
                      color: Colors.red
                    ),
                    
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}