# Importing Sparta
Importing is as simple as downloading the latest `.yymps` [here](https://github.com/AlubJ/Sparta/releases/latest), and then importing into GameMaker. The assets will be directed to `Sparta`.

Sparta includes a series of subfolders which includes the API - the interface that you'll need to execute Sparta code in your game. The `(Backend)` folder holds code that Sparta requires to operate and has to be there but otherwise you can forget it exists.

# Updating Sparta
Sparta will be supported with updates to add new features or fix bugs.
1. Delete the Sparta folder from your project.
2. Import the new Sparta `.yymps`.

# Versioning
Sparta uses [semantic versioning](https://semver.org/). In short, the version number is laid out as `major.minor.patch`, where a major update has breaking changes, a minor update contains non-breaking changes like a new feature and a patch being for bug fixes. Be mindful when updaing to a new major version.