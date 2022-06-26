import 'package:flutter/foundation.dart';
import 'package:simple_ayo_bugar/data/dummies.dart';

import '../entities/move.dart';
import '../entities/move_set.dart';

@immutable
class Moves {

  const Moves._();

  static const Move crunchKick = Move(
    name: "Crunch Kick",
    imagePath: "crunch_kick.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move hollowHold = Move(
    name: "Hollow Hold",
    imagePath: "hollow_hold.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move mountainClimbers = Move(
    name: "Mountain Climbers",
    imagePath: "mountain_climbers.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move legRaises = Move(
    name: "Leg Raises",
    imagePath: "leg_raises.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move squat = Move(
    name: "Squat",
    imagePath: "squat.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move singleLegDeadLift = Move(
    name: "Single Leg Deadlift",
    imagePath: "single_leg_deadlift.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move singleLegBridge = Move(
    name: "Single Leg Bridge",
    imagePath: "single_leg_bridge.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const Move kneeUp = Move(
    name: "Knee Up",
    imagePath: "knee_up.png",
    description: Dummies.paragraph01,
    steps: Dummies.steps,
  );

  static const List<Move> allMoves = [
    crunchKick,
    hollowHold,
    mountainClimbers,
    legRaises,
    squat,
    singleLegDeadLift,
    singleLegBridge,
    kneeUp,
  ];
  
  static const List<MoveSet> allMoveSets = [
    MoveSet(move: crunchKick, repetition: 15,),
    MoveSet(move: hollowHold, repetition: 20,),
    MoveSet(move: mountainClimbers, repetition: 15,),
    MoveSet(move: legRaises, repetition: 15,),
    MoveSet(move: squat, repetition: 12,),
    MoveSet(move: singleLegDeadLift, repetition: 15,),
    MoveSet(move: singleLegBridge, repetition: 20,),
    MoveSet(move: kneeUp, repetition: 15,),
  ];
}