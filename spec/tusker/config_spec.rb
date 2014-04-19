require 'spec_helper'

module Tusker
  describe Config do
    describe "Token" do
      it "is nil w/out being set" do
        config = Tusker::Config.read(nil)
        expect(config.token).to be_nil
      end
    end

    def config_file
    end
  end
end
