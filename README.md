# README

This is an old school project I am slowly updating , refactoring and updating to be a more modern API 



## Back-end-Api
Ruby 3.2.0
Rails  7.0.8.6
## CI/CD
This repo is live and all pull requests and push to master are build on heroku   WIP
## System dependencies
All the dependencies are listed in the gem file.

## Usage

This app gives us the option to search with our license plate & state to check if you have any parking tickets or red-camera violations. The data is "live" and being fetched from **NYC Open Data API**. [Check it out](https://nyc-violation.netlify.app/).  The app was designed with the option to add many more features in the future and fetch additional data . The back-end is a Rails API and PostgreSQL database to persist user data and search query history.Employed cookies /session **cookie is set to http only ** for authentication and Bcrypt for password encryption.The [front-end](https://github.com/gbs4ever/nyc-client-side)  is built using React.js and Redux for state managment. Have fun using or fork this repo.  


## Database initialization
 The db  for this Rails/Ruby app is built on postgresql, but can be changed to other SQL DB.

## Installation
  Fork  and clone the app [here](https://github.com/gbs4ever/-nyc-violation) 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gbs4ever/-nyc-violation
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant [code of conduct.](https://www.contributor-covenant.org/)

## License

This app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
