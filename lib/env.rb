require "env/version"

module Env
  DEVELOPMENT = 'development'.freeze
  PRODUCTION  = 'production'.freeze
  STAGING     = 'staging'.freeze
  DEMO        = 'demo'.freeze
  TEST        = 'test'.freeze

  def self.to_s
    ENV.fetch('APP_ENV') do
      ENV.fetch('GOJI_ENV') do # used internally by our legacy apps
        ENV.fetch('RAILS_ENV') do
          ENV.fetch('RACK_ENV') do
            DEVELOPMENT
          end
        end
      end
    end
  end

  def self.production?
    to_s == PRODUCTION
  end

  def self.development?
    to_s == DEVELOPMENT
  end

  def self.staging?
    to_s == STAGING
  end

  def self.test?
    to_s == TEST
  end

  def self.demo?
    to_s == DEMO
  end

  def self.method_missing(method, *args, &block)
    method_as_string = method.to_s
    method_without_question_mark = method_as_string[0...-1] if method_as_string.end_with?('?')
    if method_without_question_mark && method_without_question_mark.length > 0
      to_s == method_without_question_mark
    else
      super(method, args, block)
    end
  end
end
