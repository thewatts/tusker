module Tusker
  class Note
    attr_reader :note_data, :notebook

    def initialize(options = {})
      @note_data = options[:data]
      @notebook  = options[:notebook]

      build_note
    end

    def data
      @data ||= new_evernote_note
    end

    def edit
      system(*commands)
    end

    private

    def build_note
      data.title        = note_data[:title]
      data.content      = note_xml
      data.tagNames     = note_data[:tags]
      data.notebookGuid = guid_from_notebook
    end

    def guid_from_notebook
      notebook.guid if notebook
    end

    def new_evernote_note
      Evernote::EDAM::Type::Note.new
    end

    def note_xml
      headers =  "<?xml version='1.0' encoding='UTF-8'?>"
      headers += "<!DOCTYPE en-note SYSTEM '#{ xml_url }'>"
      headers += "<en-note>#{ note_data[:content] }</en-note>"
    end

    def xml_url
      "http://xml.evernote.com/pub/enml2.dtd"
    end
  end
end
