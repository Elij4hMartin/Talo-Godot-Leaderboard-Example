# [ WIP Repository ]
# Talo-Godot-Leaderboard-Example
## This is an example leaderboard using the [Talo Game Services API](https://docs.trytalo.com/) for Godot 4.
## How to use the example project:
### Setup in Talo Dashboard and Godot editor:
- Create an account on the [Talo Dashboard](https://dashboard.trytalo.com/) - required to use Talo.
- Create a new game on the using the top right drop down.
- Create an API key for your game on the Talo dashboard, go to Services -> Access Keys -> Create.
  - [PHOTO]:
  - Your API key needs to be able to read/write to the leaderboard and read/write to players for your game.
  - [PHOTO]:
- Create a leaderboard for your game in the dashboard, click Services -> Leaderboard -> (Plus Button), and create an internal leaderboard name.
  - If your game is time trial game (lower = better score) use ascending in the sort mode.
  - If your game is a highscore game (higher = better score) use descending sort mode which is the default:
  - [PHOTO]:
- Download this repository and add the "leaderboard_example" folder to your project.
- Install the [Talo plugin to your project](https://docs.trytalo.com/docs/godot/install?utm_source=landing&utm_medium=header-link) 
- Enable the addon in Godot, under Project -> Project Settings -> Plugins -> Talo Game Services, click the checkbox.
  - [PHOTO]:
- Change Talo settings.cfg file in your Godot project to your game API key, in the addons -> talo folder.
  - [PHOTO]:
- Change the internal leaderboard name variable in the Godot editor in the leaderboard menu scene to the internal name on the leaderboard on the Talo dashboard you created.
  - [PHOTO]:
#### Using Player Example Menu
- Replace the score variable value with your projects score value.
## Additional Notes
- Make sure to turn off Dev data when your game is live to hide developer submissions (there is no way to delete entries currently in Talo)
