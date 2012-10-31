require 'spec_helper'

describe PhotoAPI do
  include Rack::Test::Methods

  def app
    PhotoAPI
  end

  describe 'GET /api/v1/photos' do
    it "returns an empty array of photos" do
      get '/api/v1/photos'
      last_response.status.should == 200
      JSON.parse(last_response.body).should == []
    end
  end

  describe 'GET /api/v1/photos/:id' do
    let(:photo) { Photo.create title: 'Sunset at Ricse' }
    
    it "returns a photo given a valid id" do
      get "/api/v1/photos/#{photo.id}"
      last_response.status.should == 200
      last_response.body.should =~ photo.to_json
    end

    it "returns an error given an invalid id" do
      get "/api/v1/photos/notexistingid"
      last_response.status.should == 404
    end
  end

  describe '#create' do
    pending
  end
end