# class Users::PasswordsController < Devise::PasswordsController
#     respond_to :json
  
#     def create
#       self.resource = resource_class.send_reset_password_instructions(resource_params)
#       if successfully_sent?(resource)
#         UserMailer.reset_password_instructions(resource).deliver_now
#         render json: { message:'Reset password instructions sent', reset_password_token: resource.reset_password_token}, status: :ok
#       else
#         render json: { error: 'Failed to send reset password instructions' }, status: :unprocessable_entity
#       end
#     end
#     def update
#         self.resource = resource_class.reset_password_by_token(resource_params)
    
#         if resource.errors.empty?
#           resource.unlock_access! if unlockable?(resource)
#         #   bypass_sign_in(resource)
#           render json: { message: 'Password has been reset successfully' }, status: :ok
#         else
#           render json: { error: 'Failed to reset password', errors: resource.errors.full_messages }, status: :unprocessable_entity
#         end
#       end

#   end
  