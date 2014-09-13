require 'fileutils'
require 'yaml/store'

module Tusker
  class Config
    def self.read(path = nil)
      new(path)
    end

    def self.write(token, path = nil)
      config       = new(path)
      config.token = token
      config.save
    end

    attr_reader :path
    attr_writer :token

    def initialize(path = nil)
      @path = path || default_path
    end

    def default_path
      File.expand_path('~/.tusker')
    end

    def save
      FileUtils.mkdir_p(path)
      save_token_to_file
      self
    end

    def token
      @token ||= data_from_file['token']
    end

    private

    def data_from_file
      @data ||= store.load(File.read(file))
    end

    def file
      @file ||= find_or_create_file
    end

    def filename
      '.tusker-config'
    end

    def find_or_create_file
      filepath = File.join(path, filename)

      if File.exists?(filepath)
        filepath
      else
        FileUtils.touch(filepath)[0]
      end
    end

    def save_token_to_file
      store.transaction do
        store['token'] = token
      end
    end

    def store
      @store ||= YAML::Store.new(file)
    end
  end
end
