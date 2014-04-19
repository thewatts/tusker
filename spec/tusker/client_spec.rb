require 'spec_helper'

module Tusker
  describe Client do
    it "is a subclass of EvernoteOAuth::Client" do
      token  = "12345"
      client = Client.new(token: token)
      expect(client.class.ancestors).to include EvernoteOAuth::Client
    end
  end
end
