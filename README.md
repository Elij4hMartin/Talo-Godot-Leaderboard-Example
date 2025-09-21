# Talo-Godot-Leaderboard-Example
## This is an example leaderboard using the [Talo Game Services API](https://docs.trytalo.com/) for Godot 4.
## How to use the example project:
### Setup in Godot editor and Talo Dashboard:
- Create an account on the [Talo Dashboard](https://dashboard.trytalo.com/) - required to use Talo.
- Download this repository and add it to your project or import it using the Godot Project manager.
- Install the [Talo plugin to your project](https://docs.trytalo.com/docs/godot/install?utm_source=landing&utm_medium=header-link) 
- Enable the addon in your Godot project's settings
- Create an API key for your game on the Talo dashboard, go to Services -> Access Keys -> Create. Your API key needs to be able to read/write to the leaderboard and read/write to players for your game.
- Example of creating API key:
- Change Talo settings.cfg file in your Godot project to your game API key.
- Example of API Key in settings:
- Create a leaderboard for your game in the dashboard, click Services -> Leaderboard -> (Plus Button), and create an internal leaderboard name.
- Example of internal leaderboard name:
- Change the internal leaderboard name variable in the Godot editor in the leaderboard menu scene to the internal name on the leaderboard on the Talo dashboard you created.
- Example in editor:
#### Using Player Example Menu
- Score is decided by the "generate_score()" function replace this with your project's score
- Enter player username in the name field
- Click submit
#### Using Admin Tool Menu
Talo has no way to manually enter scores using UI or on the dashboard so this example lets you manually enter scores to test your leaderboard 
- Enter score
- Chose to submit the score as an integer or floating point number
- Add player username to manually populate the leaderboard with the entry
## Additional Notes
- Make sure to turn off Dev data when your game is live to hide developer submissions (there is no way to delete entries currently in Talo)
- If your game is time trial game (lower = better score) use ascending in the sort mode.
- If your game is a highscore game (higher = better score) use descending sort mode which is the default:
- Photo
