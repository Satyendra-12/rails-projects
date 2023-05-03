class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  respond_to :json

  before_action :configure_permitted_parameters

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dob, :title, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :postal_address, :title, :dob, :travel_preferences, :phone_number, :image])
  end

 

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed Up successfully',
        data: resource }
      }, status: :ok
    else
      render json: {
        status: {message: 'User could not be created successfully',
        errors: resource.errors.full_messages }, 
        status: :unprocessable_entity

      }  
    end
  end

  def update
    if current_user.update(user_params)
      
      render json: {
        status: { code: 200, message: 'Profile updated successfully' },
        data: current_user
      }, status: :ok
    else
      render json: {
        status: { message: 'Profile could not be updated successfully', errors: current_user.errors.full_messages },
        status: :unprocessable_entity
      }
    end
  end
  
  def show
    render json: { user: current_user }, status: :ok
  end
  

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :postal_address, :title, :dob, :travel_preferences, :phone_number, :image)
  end

end 