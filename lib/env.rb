require "env/version"

module Env
  def self.to_s
    ENV['GOJI_ENV']
  end

  def self.production?
    to_s == 'production'
  end

  def self.development?
    !to_s || to_s == '' || to_s == 'development'
  end

  def self.staging?
    to_s == 'staging'
  end

  def self.test?
    to_s == 'test' || development?
  end
end
