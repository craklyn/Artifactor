// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//= require chosen-jquery

var initArtifactForm = function(){
  $("#artifact_tags").chosen();
  $("#artifact_user_ids").chosen();


  var whole_class_select = $('.artifact_whole_class input')
  var toggle_whole_class = function(){
    if ($('.artifact_whole_class input:checked').val() == 'true') {
      $('.all-students').removeClass('hidden')
      $('.all-students input').prop('disabled', false)

      $('.some-students').addClass('hidden')
      $('.some-students select').prop('disabled', 'disabled')
    } else {
      $('.all-students').addClass('hidden')
      $('.all-students input').prop('disabled', 'disabled')

      $('.some-students').removeClass('hidden')
      $('.some-students select').prop('disabled', false)

    }
  }

  var showErrors = function() {
    $(".field_with_errors").parent().addClass('field_with_errors')
  }

  whole_class_select.on('change', function(){
    toggle_whole_class()
    showErrors()
  })

  toggle_whole_class()
  showErrors()

}

$(document).ready(function() {
  initArtifactForm();
});

