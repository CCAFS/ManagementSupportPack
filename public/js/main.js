var filterType,
filesToZip = [],
ls = localStorage;

// If this document is in a subdomain of ccafs.cgiar.org change
// the value
if(document.domain.indexOf("ccafs.cgiar.org") != -1){
    document.domain = 'ccafs.cgiar.org';
}

$(document).ready(function() {
  //Attach Events
  attachEvents();

  updateDataHeight();

});

/*********************************** Events ***********************************/

function attachEvents(){
  // Select an option Event
  $('li.selectionComponent:not(current)').on('click', selectAnOption );

  $( "a.download.1" ).on('click', function() {
    filterType = $(this).attr("id");
    if(getCheckedGuidelines().length > 0){
      $("#step3").show().siblings().hide();
    } else{
      $("#step1 .error").css("display", "block");
    }
  });

  // Step 4 (Terms and conditions) form contact
  $( "a.download.2" ).on('click', function() {
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
  $( "a.download.3" ).on('click', function() {
    var verifiedText = verifyFields();
    if (verifiedText.length) {
      $("#step4-form .error").html('Please fill out the information in the following fields :<br>'+ verifiedText);
      $("#step4-form .error").css("display", "block");
    }else {
      setDownload();
      $("#step5").show().siblings().hide();
      printGuidelinesToDownload();
      $('.loading').fadeOut();
    }
  });

  // Download individual files
  $( "a.download.5" ).on('click', function() {
    document.getElementsByName("check-guidelines").checked=true;
    //printGuidelinesToDownload();
    console.log(window.location);
  });

  // Donwload zip file - step5
  $( "a.zipfileDownload" ).on('click', function() {
    var fileName = $(this).attr('href').split('/');
    fileName = fileName[fileName.length-1];
    setTimeout(function(){ deleteZipFile(fileName); }, 3000);
  });

  // New search - step5 to step1
  $("a.newSearch").on('click', function(){
    $("#step1").show().siblings().hide();
  });

  // skip-form (Links for download)
  $("#skip-form").on("click", function(event) {
    event.preventDefault();
    $("#step5").show().siblings().hide();
    //printGuidelinesToDownload();
  });

  $( "a.skip.2" ).on("click", function() {
    var verifiedText = verifyFields();
    setDownload();
    $("#step5").show().siblings().hide();
    printGuidelinesToDownload();
    $('.loading').fadeOut();
  });

}

/********************************** Functions *********************************/

function verifyFields(){
  var verified = '';
  // Validate first name.
  if($("#first_name").is(":visible") && $("#first_name").val() == "") {
    verified += '* First name <br>';
    $("#first_name").css("background-color", "#FF9999");
  } else {
    $("#first_name").css("background-color", "");
  }
  // Validate last name.
  if($("#last_name").is(":visible") && $("#last_name").val() == "") {
    verified += '* Last name <br>';
    $("#last_name").css("background-color", "#FF9999");
  } else {
    $("#last_name").css("background-color", "");
  }
  // Validate institute name.
  if($("#institute-name").val() == "") {
    verified += '* Institute name <br>';
    $("#institute-name").css("background-color", "#FF9999");
  } else {
    $("#institute-name").css("background-color", "");
  }
  // Validate institute locations.
  if($("input[name^='institute-regions']:checked").length == 0) {
    verified += '* Region(s) where your institute is located <br>';
    $(".institute-regions .group-label").css("color", "red");
  } else {
    $(".institute-regions .group-label").css("color", "");
  }
  // Validate research locations.
  if($("input[name^='research-regions']:checked").length == 0) {
    verified += '* Region(s) of your research interes <br>';
    $(".research-regions .group-label").css("color", "red");
  } else {
    $(".research-regions .group-label").css("color", "");
  }
  // Validate intended use.
  if($("#use").val() == "") {
    verified += '* Intended use of data <br>';
    $("#use").css("background-color", "#FF9999");
  } else {
    $("#use").css("background-color", "");
  }
  return verified;

}

function validateEmail(emailField) {
  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  if(emailField == "" || !emailReg.test(emailField)) {
    return false;
  } else {
    return true;
  }
}

function loadUser(email) {
  $.ajax({
    type: "POST",
    dataType: "json",
    url: "./person.php",
    data: {
      context: "person",
      email: email
    },
    beforeSend: function(){
      $("#user-id").val("-1");
    },
    success: function(data) {
      data=data[0];
      if(data.email == null) {
      } else {
       $("#user-id").val(data.id);
       $("#first_name").attr("disabled", "disabled");
       $("#first_name").val(data.first_name);
       $("#last_name").attr("disabled", "disabled");
       $("#last_name").val(data.last_name);
       $("#registered").attr("disabled", "disabled");
       $("#registered").val(data.last_name);
       $("#email").attr("disabled", "disabled");
       $("#email").val(data.email);
     }
   },
   'complete': function(data) {
   }
 });
}


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

    $('#step1').show();
    $('#step3, #step4, #step5').hide();

    // Find recomended
    $.ajax({
     url: './api/guidelinesLevels/'+options.r+'/'+options.s+'/'+options.c,
     beforeSend: function(){
       $('.loading').fadeIn();
         // Clear data
         $('.results-query ul').empty();
         // Clear selected files to ZIP
         filesToZip = [];
       },
       success: function(data) {
         var guidelines = jQuery.parseJSON(data);
         var roleText = $('li.type-role.current .name').text();
         var whenText = $('li.type-stage.current .name').text();
         var whatText = $('li.type-category.current .name').text();
         // Update result message
         $('.results-query .nDocuments').text(guidelines.length);
         $('.results-query .roleText').text(roleText);
         $('.results-query .stageText').text(whenText);
         // Add category header
         $('.results-query ul').append('<li class="guidelineHead">'+whatText+'</li>');

         // Google Analytics custom events
         ga('send', 'event', 'Role', 'interested', roleText);
         ga('send', 'event', 'When', 'interested', whenText);
         ga('send', 'event', 'What', 'interested', whatText);

         //Add guidelines
         $.each(guidelines, function(i, guideline){
           // Create guideline from template
           var $guideline = $('#guideline-template').clone(true).removeAttr('id');

           // Add guideline title
           $guideline.find('.title').text(guideline.code+' '+guideline.name);
           // Add importance level and the style
           $guideline.find('.level').text(guideline.importance_level);
           $guideline.find('.level').addClass(guideline.importance_level);
           // Add type as a class
           $guideline.addClass("type-"+guideline.type);
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
         updateDataHeight();
         $('.loading').fadeOut();
       }
     });
  }
}

function showResultsBlock(blockName){
  $('.resultsBlock .results-'+blockName).slideDown().siblings().slideUp();
}

function setDownload(){
  console.log("setDownload");
  $('input[name="research-regions"]:checked').each(function(i, e){
    var regionName = $(e).next().text();
    ga('send', 'event', 'Region of Research', 'download', regionName);
  });
  $('input[name="institute-regions"]:checked').each(function(i, e){
    var regionName = $(e).next().text();
    ga('send', 'event', 'Region Institute located', 'download', regionName);
  });
  ga('send', 'event', 'Users', 'download', $("#mail").val());
  ga('send', 'event', 'Institute', 'download', $("#institute-name").val());
  /*
  $.ajax({
      type: "POST",
      dataType: "text",
      url: "./api/person/add",
      data: {
        userId: $("#user-id").val(),
        email: $("#mail").val(),
        firstName: $("#first_name").val(),
        lastName: $("#last_name").val(),
        use: $("#use").val(),
      },
      success: function(downloadId) {
      },
      complete: function(data) {
      },
  });
  */
}

function deleteZipFile(fileName){
  $.ajax({
    type: "GET",
    url: "./api/zipfile/deleteFile",
    data: {file: fileName},
    success: function(data){
      $('a.zipfileDownload').hide(200);
    }
  });
}

function printGuidelinesToDownload(){
  var content = '';
  $( "#step5 #guidelines ul").empty();

  getCheckedGuidelines().each(function(i, guideline){
    var data = JSON.parse($(guideline).attr("data-idbd"));
    var className = 'guideline type-'+ data.type + ' ';
    var downloadLink = '';
    var isExternal = ((data.source).indexOf("http") >= 0);
    if(isExternal){
      className += 'external',
      downloadLink = data.source;
    }else{
      className += 'local',
      downloadLink = './data/' + (data.source).replace(/ /g,"_");;
    }
    content += "<li class='" + className + "'>";
    if(data.source){
      content += "<a href='" + downloadLink + "' target='_blank'>";
    }
    content += " "+ data.code+"  "+ data.name + " ";
    if(data.source){
      content += "</a>";
    }
    content += "</li>";
    if(!isExternal && data.source){
      filesToZip.push(downloadLink);
    }
    // Google Analytics custom events
    ga('send', 'event', 'Guidelines', 'downloaded', data.name);
  });

  createZipFile();
  updateDataHeight();
  $( "#step5 #guidelines ul").html(content);
}

function getCheckedGuidelines(){
  return $('.results-query input[name="check-guidelines"]:checked');
}

function getWindowHeight(){
  return $("#block-system-main").height();
}

function updateDataHeight(){
  // Update the attribute data-height in the body tag
  $("body").attr("data-height", getWindowHeight());
}

function createZipFile(){
  if(filesToZip.length > 1){
    $.ajax({
      type: "POST",
      url: "./api/zipfile",
      data: {files: filesToZip, overwrite:"true"},
      success: function(data){
        $('a.zipfileDownload').show().attr('href', "./"+data).find('.nfiles').text(filesToZip.length);
      }
    });
  }else{
    $('a.zipfileDownload').hide();
  }
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
