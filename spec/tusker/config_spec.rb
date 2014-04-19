require 'spec_helper'

module Tusker
  describe Config do

    describe "::read" do
      before do
        store = YAML::Store.new(stub_file)
        store.transaction do
          store['token'] = sample_token
        end
      end

      it "pulls the token from the .tusker file" do
        config = Tusker::Config.read(stub_path)
        expect(config.token).to eq sample_token
      end
    end

    describe "::write" do
      before do
        file = './spec/fixtures/.tusker'
        FileUtils.rm(file) if File.exists?(file)
      end

      it "adds the token to the config file" do
        path   = './spec/fixtures'
        config = Tusker::Config.write(sample_token, path)
        expect(config.token).to eq sample_token
      end
    end

    it "uses the default path when not initialized with a path" do
      config = Tusker::Config.new
      expect(config.path).to eq '~'
    end

    def stub_file
      './spec/fixtures/.tusker'
    end

    def stub_path
      './spec/fixtures'
    end

    def sample_token
      '12345'
    end
  end
end
