class UserImagesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    user.image.attach(params[:image])
    
    render json: {
      status: { code: 200, message: 'Image uploaded successfully' },
      data: {
        user_id: user.id,
        image_url: url_for(user.image)
      }
    }, status: :ok
  end
end
