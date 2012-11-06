class PhotoAPI < Grape::API
  prefix :api
  version 'v1', using: :path, vendor: 'bwphoto'
  format :json
  error_format :json

  rescue_from Mongoid::Errors::DocumentNotFound do |e|
    rack_response({error: e.message}, 404)
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
      photo = Photo.new params[:photo]
      error!({error: photo.errors}, 500) unless photo.save
      photo
    end
  end

end