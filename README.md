# H0dor

Rails application & OAuth / OpenID Connect provider

## Setup

### Basic

- Clone this repo
- Run `bin/setup`
- Run `yarn`
- Install [puma-dev](https://github.com/puma/puma-dev) if you don't have it, and redirect `h0dor` to port 8000
  - `echo 8000 > ~/.puma-dev/h0dor`

### Environment variables

- Copy `config/application.yml.example` to `config/application.yml`
- Generate a pair of keys and set the `OPENID_PRIVATE_KEY` and `OPENID_PUBLIC_KEY` environments variables:
  - Private key: `openssl genpkey -algorithm RSA -out oidc_private.pem -pkeyopt rsa_keygen_bits:2048`
  - Public key: `openssl rsa -pubout -in oidc_private.pem -out oidc_public.pem`

## Run

```
bin/dev
```

Access it via https://h0dor.localhost

## Info

This Rails application uses [Devise](https://github.com/heartcombo/devise) and [Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper) to be an identity provider through OAuth2 and OpenID Connect.

If you create a user and set its role to admin, you can create OAuth apps for it, like [Br4n](https://github.com/SebouChu/br4n)