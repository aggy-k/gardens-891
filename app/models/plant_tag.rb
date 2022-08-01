class PlantTag < ApplicationRecord
  belongs_to :tag
  belongs_to :plant
end
