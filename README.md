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
- GameManager is used for game mechanics scalability, but online multiplayer needs to tweek some changes more than expected. This part could have been planned better in designing phase.
