# OpenMarket App

OpenMarket is an eCommerce service that is based on virtual currencies.
Organization owners may issue their own currencies and reward users who participate in organization events.
Users may exchange currencies with others or purchase items in organization shop with corresponding currencies.

This repo contains:
- Source code for OpenMarket APP GRPC logic
- Source code for OpenMarket SwiftUI components

## How It Works

1. OpenMarket APP uses GRPC to communicate with the backend server [here](https://github.com/miska12345/OpenMarket). 

## Demo
![Alt Text](https://media.giphy.com/media/3Ss7TFXeTkLQQWZocp/giphy.gif)
## Features
### Authentication
Authentication is based on tokens.
When the user login with his/her account, a JWT token issued and signed by the server will be stored and used as the call credential for any future RPC calls to the same server.
### Shopping
[TODO]
### Event
Both organizations and users may host new events. In order to create a new event, the host must define 1) the currency that will be awarded, 2) the reward amount, 3) the total reward amount, and 4) the expiration date of the event.
The app will generate an QR code when a new event is created.
Partcipants of the event may scan the QR code with this app and receive the virtual currency reward.

### Wallet
The wallet contains an up-to-date view of the user's current balances for owned currencies as well as a full transaction history.
