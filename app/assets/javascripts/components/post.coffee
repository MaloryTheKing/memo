# ready_post = ->
#   # Display the image to be uploaded.
#   $('.photo_upload').on 'change', (e) ->
#     readURL(this);
#
#   readURL = (input) ->
#     if (input.files && input.files[0])
#       reader = new FileReader()
#
#   reader.onload = (e) ->
#     $('.image_to_upload').attr('src', e.target.result).removeClass('hidden');
#     $swap = $('.swap')
#     if $swap
#       $swap.removeClass('hidden')
#
#   reader.readAsDataURL(input.files[0]);
#
# $(document).ready(ready_post)
# $(document).on('page:load', ready_post)
# https://codepen.io/asommer70/post/rails-image-upload-preview
