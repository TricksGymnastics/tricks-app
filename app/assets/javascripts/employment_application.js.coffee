$ ->
    $('#college_questions').hide()
    $('#high_school_year_question').hide()
    $('#employment_application_high_school_year').change ->
        if ($(this).find("option:selected").text() == 'Graduated')
            $('#college_questions').show('slow')
            $('#high_school_year_question').show('slow')
        else
            $('#college_questions').hide('slow')
            $('#high_school_year_question').hide('slow')
            
    $('#do_not_contact_reason_question').hide()
    $('#is_it_ok_if_we_contact_your_previous_employer_switch').change ->
        if ($(this).is(":checked") == false)
            $('#do_not_contact_reason_question').show('slow')
        else
            $('#do_not_contact_reason_question').hide('slow')
            
    $('#convictions_question').hide()
    $('#have_you_been_convicted_of_a_crime_in_the_last_7_years_switch').change ->
        if ($(this).is(":checked") == true)
            $('#convictions_question').show('slow')
        else
            $('#convictions_question').hide('slow')