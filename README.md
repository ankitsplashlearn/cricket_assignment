# Cricket card game in flutter.

## Project Highpoints
- Supports Player vs Computer and Player vs Player mode.
- Code written to handle multiple players (more than 2 player - having multiple computer and human players at once)
- AI difficulty is scalable.
- Game Manager could be over-written with new game mechanics.
- Card attributes scalable.
- Card attribute selection count is scalable.
- Card attribute can handle various types(like dob) with custom compare mechanism.

## Project Blueprint
- GameUI => InputManager (Viewmodel kind of) => GameManager (all logic here)
- GameManager has List<Player>
- Every Player has List<GameCard>, List<SpecialMode>, PlayerHealth
- Every GameCard has List<CardAttribute>
- AiPlayer and HumanPlayer extend Player class
- CricketGameCard extend GameCard
- All card attributes (like Runs, Catches, Wickets, Centuries, Half Centuries) extend CardAttribute

## Project Conventions
- OOPs and SOLID principles are followed.
- Interfaces and absctract classes are used for the scalability.
- Encapsulation is maintained for data security.

## Improvement Areas
- Although it is maintained to use OOPs and SOLID principles as best as possible, there are places where improvements are needed.
- For now AI mode is random, but it could be improved as easy, moderate and difficult one also by using Greedy or Breadth First or Depth First like approaches, and it won't take much effort.
- GameManager is used for game mechanics scalability, but online multiplayer needs to tweek some changes more than expected. This part could have been planned better in designing phase.
- UI could have been improved better, but for time being it is set as bare minimum. Although logs could be used to get more information of the game rounds.

# How to run this application?
- Clone the project using git.
- Flutter should be installed on the system.
- Open the project in vscode or Android Studio.
- Run command flutter run -d chrome or use the run button provided by the respective IDE.
- Enjoy playing game against the Computer or with any colleague.
