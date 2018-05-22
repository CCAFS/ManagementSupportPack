var filterType,  listSelected,
themePath = './vendor/',
guideSelected = new Array(),
filesToZip = new Array(),
ls = localStorage;

function include(file)
{

  var script  = document.createElement('script');
  script.src  = file;
  script.type = 'text/javascript';
  script.defer = true;

  document.getElementsByTagName('head').item(0).appendChild(script);

}

$(document).ready(function() {

  //Attach Events
  attachEvents();

  //Click Events
  ValidateFields();

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




  /**********************Click Events********************************************/
    // selected guideline

    $("input:checkbox").click(function() {
      if($(this).attr("name") == "check-guidelines" ) {
        if($(this).prop('checked')){
          addGuideSelected($(this).attr("data-idbd"));   
        } else{
          removeGuideSelected($(this).attr("data-idbd")); 
        }

      }
    });

    $( "a.download.1" ).click(function() {
      filterType = $(this).attr("id"); 
      if(guideSelected.length > 0){
        $("#step3").show().siblings().hide();
      } else{    
        $("#step1 .error").css("display", "block");
      }


      
    });

    // Step 4 (Terms and conditions) form contact
    $( "a.download.2" ).click(function() {
      var email =$("input[name=mail]").val();
      ls.setItem('email', email);
      if( validateEmail(email)  ) {
            //loadUser(email);
            $("#step4").show().siblings().hide();
            updateDataHeight();
          } else {
            $("#step3-form .error").css("display", "block");
          }

        });

    // Step 5 (Links for download)
    $( "a.download.3" ).click(function() {

      $("#step5").show().siblings().hide();
     printGuidelinesToDownload();
      $('.loading').fadeOut();    

    });
    
    $( "a.download.5" ).click(function() {
      document.getElementsByName("check-guidelines").checked=true;
      
      printGuidelinesToDownload();
    });


/*
      guideSelected = new Array();
      guideSelected[0] = {
        id: 999,
        name: "Data Management Support [Full package]",
        type: 3,
        source: "http://www.reading.ac.uk/ssc/resources/ccafs_data_management_support_pack.pdf",
        importance_level: "Optional"
      }
      $("#step3").show().siblings().hide();
  

      */

    });

/*********************************** Events ***********************************/

function attachEvents(){

  // Select an option Event
  $('li.selectionComponent:not(current)').on('click', selectAnOption );
}

/*****************************************************************************/

function ValidateFields(){

}

function validateEmail(emailField) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  if(emailField == "" || !emailReg.test(emailField)) {
    return false;
  } else {
    return true;
  }
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
           var $guideline = $('#guideline-template').clone(true);

           // Add guideline title
           $guideline.find('.title').text(guideline.code+' '+guideline.name);
           // Add importance level and the style
           $guideline.find('.level').text(guideline.importance_level);
           $guideline.find('.level').addClass(guideline.importance_level);
           // Update inputs:checkboxes
           $guideline.find('input:checkbox').attr('id', 'input-'+i);
           $guideline.find('input:checkbox').attr('data-idbd', JSON.stringify(guideline));
           $guideline.find('input:checkbox').attr('data-idbd.source', JSON.stringify(guideline.source));
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

    // skip-form (Links for download)
    $("#skip-form").on("click", function(event) {
      event.preventDefault();

      $("#step5").show().siblings().hide();
      printGuidelinesToDownload();


    });



    function printGuidelinesToDownload(){
      var content = '<ul>';
      downloadText = ' Download',
      className = '', downloadLink = '';
      var guideline;  

      for (var i = 0; i<guideSelected.length; i++) {   
        console.log(i);
        guideline = guideSelected[i];

        filesToZip.push(guideSelected.source);
        
        downloadLink = location.pathname + '/data/' + guideline.source;
        content += "<li>";
        content += "    <a class='downloadLink "+className+"' href='"+downloadLink+"' >" + guideline.name;
        content += "</li>";
        console.log(content);

        createZipFile();
      }
      content += '</ul>';
      $( "#step5 #guidelines").html(content);


    }

    /* This event is when the Checkbox was Selected or Unselected
    and fill a array guideSelected with new list selected      */
    function addGuideSelected(guide){
     guideSelected.push (JSON.parse(guide));
     console.log(guideSelected.length);
   }

   function removeGuideSelected(guide){
     console.log(guideSelected.length);
     for (var i = guideSelected.length; i<0 ; i++) {       
      if(guideSelected[i].equals(JSON.parse(guide))){
        delete guideSelected[i];
        console.log(guideSelected.length);

      }
    }


  }

  function getWindowHeight(){
    return $("#block-system-main .content").height();
  }

  function updateDataHeight(){
        // Update the attribute data-height in the body tag
        $("body").attr("data-height", getWindowHeight());
      }



function createZipFile(){
  $.ajax({
    type: "POST",
    // url: "./api/zipFile",
    url: "./api/guidelines/download",
    data: {files: filesToZip, destination:"guidelinesDocuments.zip", overwrite:"true"},
    success: function(data){
      alert(data);
    }
  });
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