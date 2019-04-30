class EmploymentHistory < ActiveRecord::Base
    has_one :address, :as => :addressable
    accepts_nested_attributes_for :address
    
    belongs_to :history, :polymorphic => true
end
