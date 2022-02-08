# Installation

- install [rbenv](https://github.com/rbenv/rbenv)

```bash
\curl -sSL https://get.rvm.io | bash -s stable --ruby
rbenv init
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
```

- install current version and run:

```bash
bundle install
npm i  
```

- config your database environment in file config/database.yml and create db in conlse

```bash
rails db:create
rails db:migrate
rails db:seed
```

- if u have error with db try delete regenerate master.key and credentials.yml.enc


- run server

```bash
rails s 
```

- for build scss use

```bash
npm run-script build:css
```

# Additional

For create db diagrams use [DbSchema](https://dbschema.com/download.html)

For each migration(table) need create a seed

![Scheme](db-scheme.png)

# Version

- ruby 3.0.0
- rails 7.0.1
- bundle 2.1.4
- gem 3.1.2

