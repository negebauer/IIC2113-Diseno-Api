# IIC2113 Api

[![circleciB]][circleciL]

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

<!-- Badges -->

[circleciL]:https://circleci.com/gh/negebauer/IIC2113-Api
[circleciB]:https://circleci.com/gh/negebauer/IIC2113-Api.svg?style=svg&circle-token=ca1e7d6025ff39eff6062d20b26fb6d4745359d8
