# jwt-auth

### README

A complete Rails 6.1.3 user authentication syste using JWT gem. Read the [documentation](https://documenter.getpostman.com/view/13261568/TzCQbmhQ) for sample code on testing the api endpoints.

## What it does

- Receives request to create new user with valid params
- Updates user with valid params
- Has a confirm password with email delivery feature.
- Has a password recovery with email password recovery generation token
- Has a delete your account feature.

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.3

_Gems used:_

- Jwt
- figaro
- bcrypt
- Jbuilder
- Gems used for testing:

  - Rspec-rails
  - Rubocop
  - factory_bot_rails
  - Shoulda matchers

- Rubocop

## Live Link to api

[Live link to api](https://jauth-keli.herokuapp.com)

## Getting Started

To get a local copy up, clone it and running follow these simple example steps.

### Prerequisites

- Ruby: 2.7.2
- Rails: 6.1.3
- Postgres: >= 9.5

### Setup

Install gems with:

```bash
bundle install
```

Setup database with:

```bash
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```bash
    rails server
```

Test endpoints using postman or you favorites software.

Visit [documentation](https://documenter.getpostman.com/view/13261568/TzCQbmhQ) for sample codes.

### Run tests

```bash
    rpsec
```

### Deployment

- App deployed in Heroku.

## Author

👤 **Kelly Booster**

- Github: [@kelibst](https://github.com/kelibst)
- Twitter: [@keli_booster](https://twitter.com/keli_booster)
- Linkedin: [Kekeli (Jiresse) Dogbevi
  ](https://www.linkedin.com/in/kekeli-dogbevi-958272108/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Start by:

- Forking the project.
- Cloning the project to your local machine.
- cd into the project directory.
- Run git checkout -b your-branch-name.
- Make your contributions.
- Push your branch up to your forked repository.
- Open a Pull Request with a detailed description to the development branch of the original project for a review.

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- [Gregoire Veila](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details)

## 📝 License

No license.
