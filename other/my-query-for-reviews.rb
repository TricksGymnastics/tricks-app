departments = ["gymnastics", "dance", "swim", "tag", "hospitality"]
EmploymentApplication.where(archived: nil).each do |app|
    has_loc = false
    Location.all.each do |loc|
        loc = loc.name.downcase.gsub(" ", "_")
        if (app.send loc)
            has_loc = true
            has_dep = false
            departments.each do |dep|
                if ((app.send dep) && !(loc != "folsom" && dep == "swim"))
                    has_dep = true
                    review = EmploymentApplicationReview.new
                    review.employment_application_id = app.id
                    review.status = app.status.to_i
                    review.last_edited_by = app.interviewed_by
                    review.created_at = app.created_at
                    review.updated_at = app.interview_date.nil? ? app.updated_at : app.interview_date
                    review.notes = app.comment
                    review.location = loc
                    review.department = dep
                    review.save
                end
            end
            # valid location, but no departments
            if (!has_dep)
                review = EmploymentApplicationReview.new
                review.employment_application_id = app.id
                review.status = app.status.to_i
                review.last_edited_by = app.interviewed_by
                review.created_at = app.created_at
                review.updated_at = app.interview_date.nil? ? app.updated_at : app.interview_date
                review.notes = app.comment
                review.location = loc
                review.department = "none"
                review.save
            end
        end
    end    
    if (!has_loc)
        # no locations given, check for departments
        has_dep = false
        departments.each do |dep|
            if (app.send dep)
                has_dep = true
                review = EmploymentApplicationReview.new
                review.employment_application_id = app.id
                review.status = app.status.to_i
                review.last_edited_by = app.interviewed_by
                review.created_at = app.created_at
                review.updated_at = app.interview_date.nil? ? app.updated_at : app.interview_date
                review.notes = app.comment
                review.location = "nowhere"
                review.department = dep
                review.save
            end
        end
        if (!has_dep)
            # no department or location
            review = EmploymentApplicationReview.new
            review.employment_application_id = app.id
            review.status = app.status.to_i
            review.last_edited_by = app.interviewed_by
            review.created_at = app.created_at
            review.updated_at = app.interview_date.nil? ? app.updated_at : app.interview_date
            review.notes = app.comment
            review.location = "nowhere"
            review.department = "none"
            review.save
        end
    end
end