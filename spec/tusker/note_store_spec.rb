require 'spec_helper'

module Tusker
  describe NoteStore do
    let(:client) { EvernoteOAuth::Client.new }
    let(:store)  { NoteStore.new(client: client) }

    describe "#client" do
      it "has a client" do
        expect(store.client).to eq client
      end
    end

    describe "#store" do
      it "has a store" do
        note_store = double
        allow(client).to receive(:note_store).and_return(note_store)
        expect(store.store).to eq note_store
      end
    end

    describe "#create_note" do

    end

    describe "#new_note" do
      it "can create a new note note instance" do
        note = store.new_note
        expect(note.class.ancestors).to include Evernote::EDAM::Type::Note
      end
    end
  end
end


