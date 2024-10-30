import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Tic Tac Toe, please choose the game mode :-');
  print('1: Play Vs. Your Friend');
  print('2: Play Vs. BOT');
  int mode = int.parse(stdin.readLineSync()!);
  String Player1 = 'X';
  String Player2 = 'O';
  int moves = 0;
  if (mode == 1) {
    List<List<String>> Grid = [
      [' 1 ', ' 2 ', ' 3 '],
      [' 4 ', ' 5 ', ' 6 '],
      [' 7 ', ' 8 ', ' 9 '],
    ];
    bool game = true;
    String currentPlayer = 'X';
    while (game) {
      print('Player ${currentPlayer == 'X' ? "1" : "2"} Play :-');
      for (int i = 0; i < 3; i++) {
        print(' ${Grid[i][0]} | ${Grid[i][1]} | ${Grid[i][2]} ');
        if (i < 2) {
          print('-----|-----|-----');
        }
      }
      stdout.write('Box number : ');
      int bnum = int.parse(stdin.readLineSync()!);
      if (bnum < 1 || bnum > 9) {
        print('Invalid Number');
      } else {
        int row = (bnum - 1) ~/ 3;
        int col = (bnum - 1) % 3;
        if (Grid[row][col] == 'X' || Grid[row][col] == 'O') {
          print('Already Taken Box');
          continue;
        } else {
          Grid[row][col] = ' $currentPlayer ';
          moves++;
          if (wincheck(Grid, currentPlayer)) {
            printGrid(Grid);
            print('Player ${currentPlayer == Player1 ? "1" : "2"} Won');
            game = false;
          } else if (moves == 9) {
            printGrid(Grid);
            print('Draw');
            game = false;
          } else {
            currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
          }
        }
      }
    }
  } else if (mode == 2) {
    print('Choose Difficulty');
    print('1: Easy');
    print('2: Hard');
    int Difficulty = int.parse(stdin.readLineSync()!);
    if (Difficulty == 1) {
      List<List<String>> Grid = [
        [' 1 ', ' 2 ', ' 3 '],
        [' 4 ', ' 5 ', ' 6 '],
        [' 7 ', ' 8 ', ' 9 '],
      ];
      bool game = true;
      String currentPlayer = 'X';
      while (game) {
        if (currentPlayer == 'X') {
          print('Player 1 Play :-');
          printGrid(Grid);
          stdout.write('Box number : ');
          int bnum = int.parse(stdin.readLineSync()!);
          if (bnum < 1 || bnum > 9) {
            print('Invalid Number');
            continue;
          }
          int row = (bnum - 1) ~/ 3;
          int col = (bnum - 1) % 3;
          if (Grid[row][col] == 'X' || Grid[row][col] == 'O') {
            print('Already Taken Box');
            continue;
          } else {
            Grid[row][col] = ' $currentPlayer ';
            moves++;
            if (wincheck(Grid, currentPlayer)) {
              printGrid(Grid);
              print('Player ${currentPlayer == Player1 ? "1" : "2"} Won');
              game = false;
            } else if (moves == 9) {
              printGrid(Grid);
              print('Draw');
              game = false;
            } else {
              currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
            }
          }
        } else {
          print('BOT Choosing Box...');
          botEasy(Grid);
          moves++;
          printGrid(Grid);
          if (wincheck(Grid, 'O')) {
            printGrid(Grid);
            print('BOT Won');
            game = false;
          } else if (moves == 9) {
            printGrid(Grid);
            print('Draw');
            game = false;
          } else {
            currentPlayer = 'X';
          }
        }
      }
    } else if (Difficulty == 2) {
      print('Coming Soon');
    } else {
      print('Wrong Choise , Try Again');
    }
  } else {
    print('Wrong Choise , Try Again');
  }
}

void printGrid(List<List<String>> grid) {
  for (int i = 0; i < 3; i++) {
    print(' ${grid[i][0]} | ${grid[i][1]} | ${grid[i][2]} ');
    if (i < 2) {
      print('-----|-----|-----');
    }
  }
}

bool wincheck(List<List<String>> grid, String currentPlayer) {
  if ((grid[0][0] == ' $currentPlayer ' &&
          grid[0][1] == ' $currentPlayer ' &&
          grid[0][2] == ' $currentPlayer ') ||
      (grid[1][0] == ' $currentPlayer ' &&
          grid[1][1] == ' $currentPlayer ' &&
          grid[1][2] == ' $currentPlayer ') ||
      (grid[2][0] == ' $currentPlayer ' &&
          grid[2][1] == ' $currentPlayer ' &&
          grid[2][2] == ' $currentPlayer ') ||
      (grid[0][0] == ' $currentPlayer ' &&
          grid[1][1] == ' $currentPlayer ' &&
          grid[2][2] == ' $currentPlayer ') ||
      (grid[0][2] == ' $currentPlayer ' &&
          grid[1][1] == ' $currentPlayer ' &&
          grid[2][0] == ' $currentPlayer ') ||
      (grid[0][0] == ' $currentPlayer ' &&
          grid[1][0] == ' $currentPlayer ' &&
          grid[2][0] == ' $currentPlayer ') ||
      (grid[0][1] == ' $currentPlayer ' &&
          grid[1][1] == ' $currentPlayer ' &&
          grid[2][1] == ' $currentPlayer ') ||
      (grid[2][0] == ' $currentPlayer ' &&
          grid[2][1] == ' $currentPlayer ' &&
          grid[2][2] == ' $currentPlayer ')) {
    return true;
  } else {
    return false;
  }
}

void botEasy(List<List<String>> grid) {
  bool moveMade = true;
  while (moveMade) {
    int move = Random().nextInt(9) + 1;
    int row = (move - 1) ~/ 3;
    int col = (move - 1) % 3;
    print('BOT Choosing...)');
    if (grid[row][col] != ' X ' && grid[row][col] != ' O ') {
      grid[row][col] = ' O ';
      moveMade = false;
      print('BOT successfully moved $move');
    } else {
      print('Cell $move is already taken, BOT will try again.');
    }
  }
}
