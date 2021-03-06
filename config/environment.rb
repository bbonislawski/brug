require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/brug'
require_relative '../lib/user_authentication'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/brug_development.sqlite3'
    #    adapter :sql, 'postgres://localhost/brug_development'
    #    adapter :sql, 'mysql://localhost/brug_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/brug/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery do
      development :test
      test        :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
    end
  end
end
