# kilian_openbills

A simple ESX-based police utility that allows police officers to view all players with outstanding bills and check their detailed billing history via a user-friendly menu.

## Features

- `/bills` command to access the billing menu (police only)
- View all players who have open invoices
- See detailed bills (label + amount) for each player
- Organized ESX UI menu interface
- Clean server/client code separation

## Requirements

- [ESX Legacy](https://github.com/esx-framework/esx-legacy)
- MySQL (with a `billing` and `users` table)
- A police job defined via ESX

## Usage

- Log in as a police officer (job name must be `police`)
- Use the `/bills` command
- Select a player to view their open bills
- Optionally extend the script to allow payment, deletion, or issuing of bills

## License

MIT License – Feel free to use and modify this resource.

## Author

**Kilian**
