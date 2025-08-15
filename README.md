# My App

[![Continuous Integration](https://github.com/floriandejonckheere/my-app/actions/workflows/ci.yml/badge.svg)](https://github.com/floriandejonckheere/my-app/actions/workflows/ci.yml)
[![Continuous Deployment](https://github.com/floriandejonckheere/my-app/actions/workflows/cd.yml/badge.svg)](https://github.com/floriandejonckheere/my-app/actions/workflows/cd.yml)

![Release](https://img.shields.io/github/v/release/floriandejonckheere/my-app?label=Latest%20release)
![Deployment](https://img.shields.io/github/deployments/floriandejonckheere/my-app/production?label=Deployment)

My App is a production-ready, deployable Ruby on Rails application, designed to be used as a template for new projects.

## Setup

First, ensure you have a working Docker environment.

Pull the images and start the containers:

```
docker-compose up -d
```

Set up the PostgreSQL database:

```
docker-compose exec app rails db:setup
```

Load sample data into the PostgreSQL database:

```
docker-compose exec app rails database:seed
```

The application is now available at [http://localhost:3000](http://localhost:3000).

## Development

Use the `bin/update` script to update your development environment dependencies.

## Debugging

Call `binding.break` anywhere in the source code to start a debugger.

## Testing

Run the test suite:

```
rspec
```

## Secrets

### Repository secrets

Secrets for release and deployment:

- `GHCR_USER` (Github Container Registry username)
- `GHCR_TOKEN` (Github Container Registry token)

Secrets for deployment:

- `SSH_HOST` (deployment host)
- `SSH_USER` (deployment user)
- `SSH_KEY` (private key)
- `SSH_CERT` (host public key)

### Environment secrets

Secrets for deployment:

- `DATABASE_PASSWORD` (database password)
- `SECRET_KEY_BASE` (application secret)

- `MAILER_SENDER` (email sender address)

- `APP_HOST` (application hostname)

- `GH_KEY` (Github OAuth key)
- `GH_SECRET` (Github OAuth secret)

When adding more application environment variables, don't forget to add them in the following files, as well as on the Github repository:
- `.development.env`
- `.local.env`
- `.github/actions/cd.yml`
- `ops/docker-compose.yml`

## Releasing

Update the changelog and bump the version in `lib/my_app/version.rb`.
Create a tag for the version and push it to Github.
A Docker image will automatically be built and pushed to the registry.

```sh
nano lib/my_app/version.rb
git add lib/my_app/version.rb
git commit -m "Bump version to v1.0.0"
git tag v1.0.0
git push origin master
git push origin v1.0.0
```

## Customization

To customize the application, rename the occurrences of `my_app` in the source code to your application's name.

## License

Copyright 2025 Florian Dejonckheere
