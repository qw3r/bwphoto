require 'spec_helper'

describe PhotoAPI do
  include Rack::Test::Methods

  def app
    PhotoAPI
  end

  before :each do
    @photo = Photo.create! title: 'Sunset at Ricse', author: 'Istvan Demeter', camera: 'Sony SLT'
  end
  
  describe 'GET /api/v1/photos' do
    it "returns an empty array of photos" do
      get '/api/v1/photos'
      last_response.status.should == 200
      last_response.body.should == [@photo].to_json
    end
  end

  describe 'GET /api/v1/photos/:id' do
    
    it "returns a photo given a valid id" do
      get "/api/v1/photos/#{@photo.id}"
      last_response.status.should == 200
      last_response.body.should 
    end

    it "returns an error given an invalid id" do
      get "/api/v1/photos/aninvalidid"
      last_response.status.should == 404
    end
  end

  describe 'POST /api/v1/photos' do
    context 'using url' do
    end

    context 'using base64' do
    end

    context 'with invalid attributes' do
    end
  end
end