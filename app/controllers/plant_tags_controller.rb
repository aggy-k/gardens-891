class PlantTagsController < ApplicationController
  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
  end

  def create
    @plant = Plant.find(params[:plant_id])
    puts "params=> #{params}"
    params[:plant_tag][:tag].each do |tag_id|
      PlantTag.create(tag_id: tag_id, plant: @plant)
    end

    redirect_to garden_path(@plant.garden)



    # @plant_tag = PlantTag.new(plant_tag_params)
    # @plant_tag.plant = @plant_tag
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   puts @plant_tag.errors.full_messages
    # end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
