class PhotoAPI < Grape::API
  prefix :api
  version 'v1', using: :path, vendor: 'bwphoto'
  format :json

  rescue_from Mongoid::Errors::DocumentNotFound do
    Rack::Response.new(["Requested Document Not Found"], 404)
  end
  
  resource :photos do
    desc 'listing photos'
    get do
      Photo.all
    end

    desc 'show photo'
    get ':id' do
      Photo.find params[:id]
    end

    desc 'create photo'
    post do
      Photo.create params[:photo]
    end
  end

end