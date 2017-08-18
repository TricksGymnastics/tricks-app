$ ->
    $('.switch-button').click ->
        checkbox = $(this).prev()
        checkbox.prop('checked', !checkbox.is(':checked'))
        toggle_history_questions(checkbox)
        if checkbox.is(':checked')
            $(this).addClass('active') 
        else
            $(this).removeClass('active')
            
    toggle_history_questions = (button) ->
        id = button.attr('id')
        clicked_coach_button = id.indexOf("employment_application_gymnastics") >= 0
        clicked_coach_button |= id.indexOf("employment_application_dance") >= 0
        clicked_coach_button |= id.indexOf("employment_application_swim") >= 0
        clicked_coach_button |= id.indexOf("employment_application_tag") >= 0
        
        if (clicked_coach_button)
            at_least_one_is_checked = $('#employment_application_gymnastics').is(':checked')
            at_least_one_is_checked |= $('#employment_application_dance').is(':checked')
            at_least_one_is_checked |= $('#employment_application_swim').is(':checked')
            at_least_one_is_checked |= $('#employment_application_tag').is(':checked')
            if (at_least_one_is_checked)
                $('#coach_questions').show()
                #$("#coach_questions textarea").attr("style", "background-color: yellow;")
                #having a lot of problems with setting and removing required
                #$("#coach_questions textarea").prop("required", "required")
                #$("#coach_questions textarea").attr("required", true)
            else
                $('#coach_questions').hide()
                #$("#coach_questions textarea").removeAttr("style")
                #having a lot of problems with setting and removing required
                #$("#coach_questions textarea").prop("required", "")
                #$("#coach_questions textarea").removeAttr("required")
                
        else if (id.indexOf("employment_application_hospitality") >= 0)
            if (button.is(':checked'))
                $('#hospitality_questions').show()
                #$("#hospitality_questions textarea").attr('required',true)
            else
                $('#hospitality_questions').hide()
                #$("#hospitality_questions textarea").attr('required',false)
            
    $('#coach_questions').hide()
    $('#hospitality_questions').hide()
    
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

    $('#employment_application_image').change ->
        $('#employment_application_image').prev().addClass('success')
        $('#employment_application_image').prev().html "Change Image"