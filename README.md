### Start the dev enviroment

```bash
bundle exec rails s
```

### HTML Generation

Prefer erb.

### ENV, config, and credential storage

TL;DR

    `rails credentials:edit --environment development`
    `rails credentials:edit --environment production`
    `rails credentials:show --environment development`
    `rails credentials:show --environment production`

### Coding Standards/Practices

Uee Rubocop for standard code practices.

#### Rubocop and Metrics

Run `bundle exec rubocop` before pushing commits to GitHub in order ensure the style
and formatting of the code meets the project's requirements and any reformatting
doesn't introduce new issues.  For example:

```bash
git commit -m "My nice commit Message Here"
bundle exec rubocop
# once it's passing (this is a WIP at the moment)
git push origin master
```

#### Database
Use postgress

### ENV variables
Use .env file for local development

