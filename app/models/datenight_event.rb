class DatenightEvent < ActiveRecord::Base
  #attr_accessible :description, :fol_date, :gb_date, :sac_date, :title
  belongs_to :datenight
end
