
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_upward_outlined,
        size: 40.0,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return 
              BottomSheetWidget();
            });
      },
      tooltip: 'Increment',
    );
  }
}


class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  FloatingActionButton(
                    tooltip: 'Add New Transaction',
                    onPressed: () {
                      Navigator.pushNamed(context, '/transactionform');
                    },
                    child: Container(child: Icon(Icons.book_online)),
                  ),
                  Text('New Transaction'),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  FloatingActionButton(
                    tooltip: 'Add New Account',
                    onPressed: () {
                      Navigator.pushNamed(context, '/accountform');
                    },
                    child: Container(
                      child: Icon(Icons.account_balance),
                    ),
                  ),
                  Text('New Account'),
                ],
              ),
            ),
          ],
        ));
  }
}
