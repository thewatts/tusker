require "tusker/note"
require "tusker/note_parser"

module Tusker
  class NoteStore
    attr_reader :client, :notebook

    def initialize(options = {})
      @client   = options[:client]
      @notebook = options[:notebook]
    end

    def new_note
      open_tempfile

      raw_data  = File.read(temp_filepath)
      note_data = NoteParser.new(raw_data).data
      note      = Note.new(data: note_data, notebook: notebook)

      begin
        note = store.createNote(note.data)
      rescue Evernote::EDAM::Error::EDAMUserException => edue
        ## Something was wrong with the note data
        ## See EDAMErrorCode enumeration for error code explanation
        ## http://dev.evernote.com/documentation/reference/Errors.html#Enum_EDAMErrorCode
        puts "EDAMUserException: #{ edue }"
      rescue Evernote::EDAM::Error::EDAMNotFoundException => ednfe
        ## Parent Notebook GUID doesn't correspond to an actual notebook
        puts "EDAMNotFoundException: Invalid parent notebook GUID #{ ednfe }"
      end
    end

    def store
      @store ||= client.note_store
    end

    def self.create(options = {})
      new(options).new_note
    end

    private

    def commands
      Shellwords.split(invocation)
    end

    def invocation
      "vim #{ tempfile.path }"
    end

    def new_note_base
      base =  "--------------------\n"
      base += "Title:\n"
      base += "Tags:\n"
      base += "--------------------\n"
      base
    end

    def open_tempfile
      system(*commands)
    end

    def temp_filepath
      base = File.expand_path("~/.tusker")
      @temp_filepath ||= "#{ base }/tmp-#{ Time.now.to_i }.md"
    end

    def tempfile
      if !File.exists?(temp_filepath)
        File.open(temp_filepath, "w+") { |f| f.write(new_note_base) }
      end

      File.open(temp_filepath)
    end
  end
end
