# Disclaimer 
Source code written to follow udemy course https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial


# Discuss

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * create new app in github
  * copy secret and client id into config/config.exs
   * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Deploy in prod
Do some db work to make it go smooth
`MIX_ENV=prod PORT=4001 elixir --detached -S mix do compile, phoenix.server`

Skip the --detached if you'd like to see it running


# Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


