$ ->
    locations_selected = 0
    $('#hidden_required_location').prop('required', true)
    $('#select-location-container').find('.switch-button').each ->
        obj = $(@)
        obj.click ->
            if obj.prev().is ':checked'
                locations_selected--
                if locations_selected == 0
                    $('#hidden_required_location').prop('required', true)
            else
                locations_selected++
                $('#hidden_required_location').prop('required', false)

    departments_selected = 0
    $('#hidden_required_department').prop('required', true)
    $('#select-department-container').find('.switch-button').each ->
        obj = $(@)
        obj.click ->
            if obj.prev().is ':checked'
                departments_selected--
                if departments_selected == 0
                    $('#hidden_required_department').prop('required', true)
            else
                departments_selected++
                $('#hidden_required_department').prop('required', false)

            

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
                $("#coach_questions textarea").attr("required", true)
            else
                $('#coach_questions').hide()
                $("#coach_questions textarea").removeAttr("required")
                
        else if (id.indexOf("employment_application_hospitality") >= 0)
            if (button.is(':checked'))
                $('#hospitality_questions').show()
                $("#hospitality_questions textarea").attr("required", true)
            else
                $('#hospitality_questions').hide()
                $("#hospitality_questions textarea").removeAttr("required")

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
        
    $('#employment_application_resume').change ->
        $('#employment_application_resume').prev().addClass('success')
        $('#employment_application_resume').prev().html "Change Resume"

    autoResizeImageContainers()

    # this enables live search of profiles, but it is currently not working super well with the other filters.
    # even if one filter is selected, the results returned here are without filters on, even though it appears
    # that filters are being applied (highlighted buttons)
    # timeout = null
    # $('#applicant_search input').keyup ->
    #     clearTimeout(timeout)
    #     timeout = setTimeout((->
    #         $.get $('#applicant_search').attr('action'), $('#applicant_search').serialize(), null, 'script'
    #     ), 200)
    #     false

autoResizeImageContainers = ->
    $('.applicant_image_frame').each ->
        obj = $(@)
        obj.height obj.width() * 1.3712

$(window).resize -> autoResizeImageContainers()

$(document).ajaxComplete -> autoResizeImageContainers()