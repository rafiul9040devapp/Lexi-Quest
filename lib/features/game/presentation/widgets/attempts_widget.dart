import 'package:flutter/material.dart';

class AttemptsWidget extends StatelessWidget {
  const AttemptsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context,index){
      return SizedBox();
    }, separatorBuilder: (context, index) {
      return SizedBox();
    }, itemCount: 9);
  }
}
