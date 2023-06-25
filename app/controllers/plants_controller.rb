
class PlantsController < ApplicationController
  def index
    plants = Plant.all
    render json: plants
  end

  def show
    plant = Plant.find(params[:id])
    render json: plant
  end



  def update
    plant = Plant.find(params[:id])
    if plant.update(plant_params)
      plant.reload
      render json: plant, tatus: :created
    else
      render json: { errors: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end
  



  def create
    plant = Plant.new(plant_params)
    if plant.save
      render json: plant, status: :created
    else
      render json: { errors: plant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  

  def destroy
    plant = Plant.find(params[:id])
    plant.destroy
    head :no_content
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
