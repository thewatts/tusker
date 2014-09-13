require 'tusker/version'
require 'tusker/config'
require 'tusker/client'
require 'tusker/note_store'

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
    client.note_store.listNotebooks #.map { |notebook| notebook.name }
  end

  def self.client
    token = Config.read.token
    @client ||= Client.new(token: token)
  end

  def self.create_note
    NoteStore.create(client: client, notebook: notebooks.first)
  end

end
