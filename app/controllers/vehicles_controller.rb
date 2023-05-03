class VehiclesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    vehicles = current_user.vehicles
    render json: {
      status: { code: 200, message: 'Success' },
      data: vehicles
    }, status: :ok
  end


  def create
    vehicle = current_user.vehicles.build(vehicle_params)

    if vehicle.save
      render json: {
        status: { code: 200, message: 'Vehicle added successfully' },
        data: vehicle
      }, status: :ok
    else
      render json: {
        status: { message: 'Failed to add vehicle', errors: vehicle.errors.full_messages },
        status: :unprocessable_entity
      }
    end
  end

  def update
    vehicle = current_user.vehicles.find(params[:id])
    # vehicle = current_user.vehicles

    if vehicle.update(vehicle_params)
      render json: {
        status: { code: 200, message: 'Vehicle updated successfully' },
        data: vehicle
      }, status: :ok
    else
      render json: {
        status: { message: 'Failed to update vehicle', errors: vehicle.errors.full_messages },
        status: :unprocessable_entity
      }
    end
  end

  def destroy
    vehicle = current_user.vehicles.find(params[:id])
    vehicle.destroy
    render json: {
      status: { code: 200, message: 'Vehicle deleted successfully' }
    }, status: :ok
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:country, :vehicle_number, :vehicle_brand, :vehicle_name, :vehicle_type, :vehicle_color, :vehicle_model_year)
  end
end
