require "spec_helper"
require "./lib/tusker/note_parser"

module Tusker
  describe NoteParser do
    let(:filepath) { "./spec/fixtures/note.md" }
    let(:raw_data) { File.read(filepath) }
    let(:parser)   { NoteParser.new(raw_data) }

    describe "#data" do
      it "decodes the data correctly" do
        expected = {
          title: "My New Note",
          tags: %w( Programming Life Fun ),
          content: expected_html,
        }

        expect(parser.data).to eq expected
      end
    end

    let(:expected_html) do
      html = ""
      html += "<h1>This is my title</h1>\n\n"
      html += "<h2>This is my subtitle</h2>\n\n"
      html += "<ul>\n"
      html += "<li>list item 1</li>\n"
      html += "<li>list item 2</li>\n"
      html += "<li>list item 3</li>\n"
      html += "</ul>\n\n"
      html += "<p><a href=\"http://google.com\">Google</a></p>\n"
      html
    end
  end
end
