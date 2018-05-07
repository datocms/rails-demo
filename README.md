# Rails DatoCMS template

This repo contains a working Rails website integrated with content coming from this [DatoCMS administrative area](https://dashboard.datocms.com/account/sites/template?name=Rails+demo&siteId=5546).

## Usage

First, install the dependencies of this project:

```
bundle install
```

Add an `.env` file containing the read-only API token of your DatoCMS site:

```
echo 'DATO_API_TOKEN=abc123' >> .env
```

Then, to run this website in development mode:

```
bundle exec rails server
```
