autoSizeText = ->
    elements = $('.resize')
    return if elements.length < 0
    
    magic_scaling_number = 0.7
    for element in elements
        do (element) ->
            $(element).css('visibility', "hidden")
            $(element).css('font-size', max + "px")
            min = 0
            max = parseInt($(element).data("maxFontSize")) / magic_scaling_number
            current_test_size = max
            next_test_size = max
            resizeText = ->
                current_test_size = next_test_size
                if (element.offsetHeight > 0 and element.scrollHeight > element.offsetHeight) or (element.offsetWidth > 0 and element.scrollWidth > element.offsetWidth)
                    max = current_test_size
                    next_test_size = (current_test_size + (min - current_test_size) / 2)
                else
                    min = current_test_size
                    next_test_size = (current_test_size + (max - current_test_size) / 2)
                    
                $(element).css('font-size', next_test_size)
                console.log "Trying font-size: " + next_test_size

            while (parseInt(max) != parseInt(min))
                resizeText()
            
            new_font_size = (parseInt($(element).css('font-size').slice(0, -2)) * magic_scaling_number) + 'px'
            $(element).css('font-size', new_font_size)
            $(element).css('visibility', "visible")

$(document).ready -> autoSizeText()

# for some reason, resize is doing funny things: size gets set to max at the end
doit = undefined
window.onresize = ->
  clearTimeout doit
  doit = setTimeout(autoSizeText, 200)