# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# below is saying that we want the javascript to load when the page loads  
$ ->
  $('#funnies').imagesLoaded ->
    $('#funnies').masonry
      itemSelector: '.box'
      isFitWidth: true