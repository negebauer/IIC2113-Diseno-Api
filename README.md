# IIC2113 Api

[![circleciB]][circleciL]
[![styleB]][styleL]

### Info

  - Repo Web: [IIC2113-Web](https://github.com/negebauer/IIC2113-Web)
  - Repo Api: [IIC2113-Api](https://github.com/negebauer/IIC2113-Api)
  - Framework Web: [React](https://facebook.github.io/react/)
  - Framework Api: [Ruby on Rails](http://rubyonrails.org)
  - Lint Web: [Prettier](https://github.com/prettier/prettier), [Eslint recommended](https://eslint.org), [React](https://github.com/yannickcr/eslint-plugin-react)
  - Lint Api: [Rubocop](https://github.com/bbatsov/rubocop)
  - Versioning system: [Git](https://git-scm.com)

### Servers

  - Production http://iic2113-api.herokuapp.com/
  - Staging: http://iic2113-api-staging.herokuapp.com/

### Development

Copy and run this script

```bash
git clone https://github.com/negebauer/IIC2113-Api.git Api
cd api
bundle install
rake db:create
rake db:schema:load
rails s
```

Usefull comands

```bash
# Run linter and fix
rubocop -Ra
```

<!-- Badges -->

[circleciL]:https://circleci.com/gh/negebauer/IIC2113-Api
[circleciB]:https://circleci.com/gh/negebauer/IIC2113-Api.svg?style=svg&circle-token=ca1e7d6025ff39eff6062d20b26fb6d4745359d8

[styleL]:https://github.com/bbatsov/rubocop
[styleB]:https://img.shields.io/badge/code%20style-rubocop-brightgreen.svg?style=flat
