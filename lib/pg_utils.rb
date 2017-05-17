require 'pg_utils/version'
require 'pg_utils/configuration'
require 'pg_utils/backup'
require 'pg_utils/restore'
require 'yaml'

# main module
module PgUtils
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  # Configure through yaml file
  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML::load(IO.read(path_to_yaml_file))
      config.each {|k,v| configuration.instance_variable_set("@#{k}", v) }
    rescue Errno::ENOENT
      raise "YAML configuration file couldn't be found. Using defaults."
    end
  end
end
