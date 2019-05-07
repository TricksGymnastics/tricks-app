class EmploymentApplicationReview < ActiveRecord::Base
    belongs_to :employment_application
    after_initialize :init

    STATUS = [[0, 'New'], [1, 'Interested'], [2, 'Emailed'], [3, 'Interview Set Up'], [4, 'Not Hired'], [5, 'Maybe Later'], [6, 'Hired']]

    def init
        self.status ||= 0
        self.notes ||= ""
        self.last_edited_by ||= ""
    end    
end
