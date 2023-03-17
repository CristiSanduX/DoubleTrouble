# DoubleTrouble

DoubleTrouble is a simple iOS app that allows two players to play a dice game. Each player rolls the dice three times and the winner is the player with the highest total score.

## How to play

1. Launch the app

2. Press the "Roll" button to start the game.

3. Each player takes turns rolling the dice by pressing the "Roll" button.

4. After three rolls, the app displays the winner and allows the players to start a new game.

## How it works

The app uses Swift and UIKit to create a simple user interface with two text fields for the player scores, two image views to display the dice rolls and a "Roll" button. When a player presses the "Roll" button, the app generates two random numbers between 1 and 6, adds them together, and updates the score for that player. The dice rolls are animated using the UIImageView class's built-in animation features.

The app keeps track of each player's score and the number of rolls remaining. After both players have rolled the dice three times, the app determines the winner and displays a message with the result.

## Demo

https://user-images.githubusercontent.com/97184692/224712653-a830de89-3318-4384-a705-bced192a1324.mov

