require 'tusker/version'
require 'tusker/client'
require 'tusker/config'

begin
  require 'pry'
rescue
end

module Tusker

  def self.add_token(token)
    Config.write(token)
  end

  def self.notebooks
    token  = Config.read.token
    client = Client.new(token: token)
    client.note_store.listNotebooks.map { |notebook| notebook.name }
  end

end
