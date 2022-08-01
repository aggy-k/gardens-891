class PlantsController < ApplicationController

  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_params)
    @plant.garden = @garden

    if @plant.save
      redirect_to @garden
    else
      render 'gardens/show', status: 422
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to @plant.garden, status: :see_other
  end

  private
    def plant_params
      params.require(:plant).permit(:name, :image_url)
    end
end
