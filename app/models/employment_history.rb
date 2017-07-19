class EmploymentHistory < ActiveRecord::Base
    has_one :address, :as => :addressable
    belongs_to :history, :polymorphic => true
end
