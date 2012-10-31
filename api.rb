class PhotoAPI < Grape::API
  prefix :api
  version 'v1', using: :path, vendor: 'bwphoto'
  
  format :json

  resource :photos do
    desc 'listing photos'
    get do
      Photo.all
    end

    desc 'show photo'
    get :id do
      Photo.find params[:id]
    end

    desc 'create photo'
    post do
      'not implemented yet'
    end
  end

end