# Talo-Godot-Leaderboard-Example
## This is an example leaderboard using the [Talo Game Services API](https://docs.trytalo.com/) for Godot 4.
## How to use the example project:
### Prerequisites:
- Create an account on the [Talo Dashboard](https://dashboard.trytalo.com/) - required to use Talo.
- Download repository and store it in an easy to access location on your machine.
- In the Godot Project manager import the project.
### Setup in Godot editor and Talo Dashboard:
- Create an API key for your game on the Talo dashboard, it's under Services -> Access Keys -> Create. Your API key should be able to read/write to the leaderboard and read/write to players for your game.
- Example of creating API key:
- Change Talo settings.cfg file to your game API key.
- Example of API Key in settings:
- Create a leaderboard for your game, click Services -> Leaderboard -> (Plus Button), and copy the internal name you decided on.
- Example of internal leaderboard name:
- Change global script leaderboard name variable to the internal name of the leaderboard on the Talo dashboard
- Example in the global script:
### Using the example
#### Player example
- Enter player username in the name field
- Click submit
#### Admin tool
Talo has no way to manually enter scores using UI or on the dashboard so this example let's you manually enter scores to test your leaderboard 
- Enter score
- Select wether the score is an integer or floating point number
- Add player username to manually populate the leaderboard with the entry
## Additional Notes
- Make sure to turn off Dev data when your game is live to hide developer submissions (there is no way to delete entries currently in Talo)
- If your game is time trial game (lower = better score) use ascending in the sort mode: (picture)
- If your game is a highscore game (higher = better score) use descending sort mode which is the default
