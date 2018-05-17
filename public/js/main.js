$(document).ready(function() {

  //Attach Events
  attachEvents();

  // Set countdown
  $('.countdown-styled').countdown({
      date: "May 25, 2018 15:03:26",
      render: function(data) {
        var el = $(this.el);
        el.empty()
          .append("<div>" + this.leadingZeros(data.days, 2) + " <span>days</span></div>")
          .append("<div>" + this.leadingZeros(data.hours, 2) + " <span>hrs</span></div>")
          .append("<div>" + this.leadingZeros(data.min, 2) + " <span>min</span></div>")
          .append("<div>" + this.leadingZeros(data.sec, 2) + " <span>sec</span></div>");
      }
  });

});

/*********************************** Events ***********************************/

function attachEvents(){
  // Select an option Event
  $('li.selectionComponent:not(current)').on('click', selectAnOption );
}

/********************************** Functions *********************************/

function selectAnOption(){
  var $option = $(this);
  var optionText = $option.find('.name').text();
  var type = $option.classParam('type');
  var $parent = $option.parent();

  // Set current option
  $option.addClass('current').siblings().removeClass('current ');
  $option.removeClass('notSelected').siblings().addClass('notSelected');
  // Select an option
  $parent.parent().find('.optionText').html(cutText(optionText, 28)).parent().addClass('selected');
  // Animate icon
  $option.animateCss('flipInX');

  // Count Options
  var nOptions = $('li.selectionComponent.current').length;

  // Check that the 3 select options are selected
  if(nOptions == 3){
    $('.searchBlock .componentsBlock').addClass('dropdown');
    $('.resultsBlock').slideDown();
    var options = {
      'r': $('li.type-role.current').classParam('id'),
      's': $('li.type-stage.current').classParam('id'),
      'c': $('li.type-category.current').classParam('id')
    }
    // Find recomended
    $.ajax({
       url: './api/guidelinesLevels/'+options.r+'/'+options.s+'/'+options.c,
       beforeSend: function(){
         $('.loading').fadeIn();
         // Clear data
         $('.results-query ul').empty();
       },
       success: function(data) {
         var guidelines = jQuery.parseJSON( data);
         // Update result message
         $('.results-query .nDocuments').text(guidelines.length);
         $('.results-query .roleText').text($('li.type-role.current .name').text());
         $('.results-query .stageText').text($('li.type-stage.current .name').text());

         // Add category header
         $('.results-query ul').append('<li class="guidelineHead">'+$('li.type-category.current .name').text()+'</li>');

         //Add guidelines
         $.each(guidelines, function(i, guideline){
           // Create guideline from template
           var $guideline = $('#guideline-template').clone(true).removeAttr('id');
           // Add guideline title
           $guideline.find('.title').text(guideline.code+' '+guideline.name);
           // Add importance level and the style
           $guideline.find('.level').text(guideline.importance_level);
           $guideline.find('.level').addClass(guideline.importance_level);
           // Update inputs:checkboxes
           $guideline.find('input:checkbox').attr('id', 'input-'+i);

           $guideline.find('label').attr('for', 'input-'+i);
           // Add the guideline to the list
           $('.results-query ul').append($guideline);
           $guideline.slideDown();
         });
       },
       complete: function(data) {
         $('.loading').fadeOut();
       }
    });
  }
}

function showResultsBlock(blockName){
  $('.resultsBlock .results-'+blockName).slideDown().siblings().slideUp();
}

/*********************************** Utils ************************************/

function getClassParameter(selector,cssName) {
  var check = cssName + "-";
  var className = $(selector).attr('class') || '';
  var type = $.map(className.split(' '), function(val,i) {
    if(val.indexOf(check) > -1) {
      return val.slice(check.length, val.length);
    }
  });
  return((type.join(' ')) || 'none');
}

function cutText(str, l){
  if (str.length > l){
    str = str.slice(0,l) + '...';
  }
  return str;
}

jQuery.fn.classParam = function(cssName) {
  return getClassParameter(this, cssName)
};

$.fn.extend({
    animateCss: function (animationName) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
            $(this).removeClass('animated ' + animationName);
        });
        return this;
    }
});
