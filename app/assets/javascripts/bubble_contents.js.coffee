autoSizeText = ->
    # console.log "Starting autoSizeText"
    elements = $('.resize')
    return if elements.length <= 0
    
    magic_scaling_number = 0.7
    for element in elements
        do (element) ->
            $(element).css('font-size', max + "px")
            min = 0
            max = parseInt($(element).data("maxFontSize")) / magic_scaling_number
            current_test_size = Math.min(Math.max(parseFloat($(element).css('font-size').slice(0, -2)), 0), max)
            # console.log "Element Begin - min: " + min + " - max: " + max
            # iterations = 0
            resizeText = ->
                # console.log "resizeText"
                if (element.offsetHeight > 0 and element.scrollHeight > element.offsetHeight) or (element.offsetWidth > 0 and element.scrollWidth > element.offsetWidth)
                    max = current_test_size
                    next_test_size = (current_test_size + (min - current_test_size) / 2)
                else
                    min = current_test_size
                    next_test_size = (current_test_size + (max - current_test_size) / 2)
                # console.log next_test_size
                current_test_size = next_test_size
                    
                $(element).css('font-size', current_test_size)
                # iterations++
                # console.log "resizeText - min: " + min + " - max: " + max
                # console.log "Trying font-size: " + current_test_size
                
            # console.log "About to ender while loop: " + (parseInt(max) != parseInt(min)).toString()
            while (Math.abs(max - min) > 1)
                resizeText()
            
            # console.log "Iteration count: " + iterations
            new_font_size = (parseInt($(element).css('font-size').slice(0, -2)) * magic_scaling_number) + 'px'
            # console.log "Updating font-size to " + new_font_size
            $(element).css('font-size', new_font_size)

$(document).ready -> autoSizeText()
$(window).resize -> autoSizeText()