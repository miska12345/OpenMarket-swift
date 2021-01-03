# Overview

![Status](https://img.shields.io/badge/Status-On%20Development-green)

OpenMarket offers organizations a new way to create, distribute, and exchange virtual currencies through event check-ins and gift shopping, helping organizations to boost their event participation by providing an incentive for their participants. The OpenMarket platform enables organization owners to promote their organizations, attract new members, and retain the loyalty of existing members. With the OpenMarket App, users can collect organization-specific currencies by attending organization-hosted events and scanning the event QR code, which may later be used to redeem gift items in the organization's shop. Depending on the context of usage, an event is simply an opportunity for organizations to award users who participated in some activity (e.g. donating to that organization, being present at a offline event, etc). Additionally, users may follow organizations and receive push notifications when new events have been scheduled.

Although the project was created in response to the observation that student clubs often struggle to find enough participants for their events due to the lack of incentives, it is also useful for small business owners who wish to capture the benefit of such systems. 

This repo contains:
- Source code for OpenMarket App

## How It Works

1. OpenMarket APP uses GRPC to communicate with the backend server [here](https://github.com/miska12345/OpenMarket). 

## Demo
![Alt Text](https://media.giphy.com/media/3dz6cixEZFXjchmh45/giphy.gif)
## Features

### Authentication
Authentication is based on tokens.
When the user login with his/her account, a JWT token issued and signed by the server will be stored and used as the call credential for any future RPC calls to the same server.
### Shopping
Users can browse shops hosted by organization through recommendation only (for now). All items could be add to cart from the it's detail page and checkout with coins specified by the host of the shop. Under each item's page, users can also see recommended items that are most likely either from the same shop and/or similar from items that you bought.
### Event
Both organizations and users may host new events. In order to create a new event, the host must define 1) the currency that will be awarded, 2) the reward amount, 3) the total reward amount, and 4) the expiration date of the event.
The app will generate an QR code when a new event is created.
Partcipants of the event may scan the QR code with this app and receive the reward.

### Wallet
The wallet contains an up-to-date view of the user's current balances for owned currencies as well as a full transaction history.

