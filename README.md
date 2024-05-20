# Simple Pastebin Loader (spbl)

Simple Pastebin Loader (spbl) is a command-line tool designed to fetch and execute scripts hosted on Pastebin. It provides a convenient way to automate the installation or execution of scripts from Pastebin URLs.

## Features

- Fetches scripts from Pastebin URLs and executes them locally.
- Supports both interactive and silent modes of execution.
- Verbose mode for detailed output during script execution.
- Option to clear the screen before running the script.
- Can be integrated into automated or unattended install processes.

## Installation

No installation is required for the `spbl` script. Simply download the `spbl.exe` file and place it in a directory accessible from the command line.

## Usage

The `spbl` script can be used from the command line with the following syntax:
```
spbl <pastebin_url> [--silent] [--verbose] [--clearscreen]
```
- `<pastebin_url>`: The URL of the Pastebin script to fetch and execute.
- `--silent`: Run the script silently without user interaction.
- `--verbose`: Display detailed output during script execution.
- `--clearscreen`: Clear the screen before running the script.

Example:
```
spbl https://pastebin.com/raw/abcdefg --silent
```
## Security Considerations

- Exercise caution when executing scripts from unknown sources.
- Verify the trustworthiness of the Pastebin URL and its contents before executing.
- Consider using whitelisting, digital signatures, and other security measures to mitigate risks.

## License

This project is licensed under the [Drewcotech Open Source License](LICENSE.md)
