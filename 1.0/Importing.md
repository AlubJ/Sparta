# Importing Sparta
Importing is as simple as downloading the latest `.yymps` [here](https://github.com/AlubJ/Sparta/releases/latest), and then importing into GameMaker. The assets will be directed to `Sparta`.

Sparta includes a series of subfolders which includes the API - the interface that you'll need to execute Sparta code in your game. The `(Backend)` folder holds code that Sparta requires to operate and has to be there but otherwise you can forget it exists. You will also see a script called `__SpartaConfig`, this contains values that are used to control how Sparta functions.

# Updating Sparta
Sparta will be supported with updates to add new features or fix bugs.
1. Create a backup of your configuration script.
2. Delete the Sparta folder from your project.
3. Import the new Sparta `.yymps`.
4. Restore the configuration. Some macros may have changed between versions so take extra care when restoring values.