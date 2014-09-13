require "spec_helper"
require "./lib/tusker/note"

module Tusker
  describe Note do
    let(:note)     { Note.new(options) }
    let(:notebook) { double("notebook", guid: "1234") }
    let(:options) {
      {
        title: "My New Note",
        body: "This is the note body",
        notebook: notebook
      }
    }

    describe "#initialization" do
      it "can initialize with a title" do
        expect(note.title).to eq options[:title]
      end

      it "can initialize with a notebook" do
        expect(note.notebook).to      eq options[:notebook]
        expect(note.notebook.guid).to eq notebook.guid
      end
    end

    describe "#data" do
      it "it an instance of Evernote::EDAM::Type::Note" do
        expect(note.data).to be_kind_of Evernote::EDAM::Type::Note
      end
    end
  end
end
