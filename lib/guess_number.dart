// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';
import 'main.dart';





String playGame(var n, var game) {

  var isCorrect = false;
  var text = "";

  do {

    var input = n;
    var guess = int.tryParse(input!);
    if (guess == null) {
      text = 'กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น';
      return text;

    }

    var result = game.doGuess(guess);

    if (result == 1) {
      text =  '$guess มากเกินไป กรุณาลองใหม่';
      return text;
    } else if (result == -1) {
      text =  '$guess น้อยเกินไป กรุณาลองใหม่';
      return text;
    } else if (result == 0) {
      text =  '$guess ถูกต้องนะครับ, คุณทายทั้งหมด : ${game.guessCount} ครั้ง';
      isCorrect = true;
      return text;

    }
  } while (!isCorrect);
  return text;

}