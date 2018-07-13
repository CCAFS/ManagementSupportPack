$(document).ready(function() {

  $('.importanceLevel').each(function(i, e){
    var $element = $(e);
    var GID = $element.classParam('GID');
    var SID = $element.classParam('SID');
    var RID = $element.classParam('RID');

    //console.log("G-"+GID+" S-"+SID+" R-"+RID);

    $.ajax({
      url: './api/getImportanceLevel/'+GID+'/'+SID+'/'+RID,
      beforeSend: function() {

      },
      success: function(data) {
        //console.log(data);
        data =  jQuery.parseJSON( data );
        var level =0;
        switch((data.importance_level).toLowerCase()) {
          case 'optional':
            level = 1;
            break;
          case 'useful':
            level = 2;
            break;
          case 'important':
            level = 3;
            break;
          case 'very important':
            level = 4;
            break;
        }
        $element.addClass('level-'+level);
        $element.text(level);
        $element.attr("title", data.importance_level);
      },
      complete: function(data) {

      },
      error: function(error) {
        console.log(error);
      }
    });

  });

});
