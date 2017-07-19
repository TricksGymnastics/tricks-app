class EmploymentApplication < ActiveRecord::Base
    has_one :address, :as => :addressable
    has_many :employment_histories, :as => :history
end
