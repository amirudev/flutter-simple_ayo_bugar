import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/entities/move.dart';

class MoveDetailPage extends StatelessWidget {

  const MoveDetailPage({
    Key? key,
    required this.move,
  }) : super(key: key);

  final Move move;

  @override
  Widget build(BuildContext context) {

    final imagePath = move.imagePath;

    return Scaffold(
      appBar: AppBar(
        title: Text(move.name,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0, vertical: 32.0,
        ),
        child: Column(
          children: [
            if (imagePath != null)
              Image.asset("assets/images/$imagePath",),
            const SizedBox(height: 24.0,),
            const Text("Deskripsi Latihan",),
            Text(move.description,),
            const SizedBox(height: 24.0,),
            Text("Cara Melakukan Gerakan (${move.steps.length} langkah)",),
            for (int i = 0; i < move.steps.length; i++)
              Row(
                children: [
                  Text((i + 1).toString().padLeft(2, '0',),),
                  const SizedBox(width: 12.0,),
                  Expanded(
                    child: Text(
                      move.steps[i],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}