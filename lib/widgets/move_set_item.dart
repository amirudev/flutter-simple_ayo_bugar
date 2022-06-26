import 'package:flutter/material.dart';
import 'package:simple_ayo_bugar/entities/move.dart';
import 'package:simple_ayo_bugar/entities/move_set.dart';

class MoveSetItem extends StatelessWidget {

  const MoveSetItem({
    Key? key,
    required this.moveSet,
    this.onMoveSelected,
    this.onMoveSetSelected,
    this.icon,
  }) : super(key: key);

  final MoveSet moveSet;
  final ValueChanged<Move>? onMoveSelected;
  final ValueChanged<MoveSet>? onMoveSetSelected;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {

    final move = moveSet.move;
    final imagePath = move.imagePath;
    final repetition = moveSet.repetition;

    return Row(
      children: [
        if (imagePath != null)
          ...[
            SizedBox(
              width: MediaQuery.of(context,).size.width * 0.2,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  "assets/images/$imagePath",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8.0,),
          ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(move.name,),
              if (repetition != null)
                Text("${repetition}x",),
            ],
          ),
        ),
        const SizedBox(width: 8.0,),
        TextButton(
          child: Container(
            padding: const EdgeInsets.all(8.0,),
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
            child: icon ?? const Icon(Icons.chevron_right,),
          ),
          onPressed: () {
            onMoveSelected?.call(move,);
            onMoveSetSelected?.call(moveSet,);
          },
        ),
      ],
    );
  }
}