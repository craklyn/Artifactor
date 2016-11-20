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




var initArtifactIndex = function(){
  $("#search_tags").chosen();
  $("#search_student_id").chosen({allow_single_deselect: true});

  var searchForm = $('form')
  var list = $('.artifacts')



  var searchBox       = searchForm.find('[name*=q]')
  var selects         = searchForm.find('select')

  searchBox.on('keyup blur paste', function() {
    executeSearch()
  })

  selects.on('change', function() {
    executeSearch()
  })

  var executeSearch = function() {
    searchForm.submit()
  }


  searchForm.on('ajax:complete', function(evt, xhr, status){
    var response  = $.parseJSON(xhr.responseText).html
    list.html(response)
    bindExpand()
  })

  executeSearch()
}


var bindExpand = function() {
  $(".artifact-list-item").on('click', function(){
    var that = this
    var full = $(that).find('.full:visible').length > 0

    if (full) {
      $(that).find('.short').removeClass('hidden')
      $(that).find('.full').addClass('hidden')
    } else {
      $(that).find('.short').addClass('hidden')
      $(that).find('.full').removeClass('hidden')
    }

    event.stopPropagation()
  })
}

$(document).ready(function() {
  if ($('.artifact-form').length > 0){
    initArtifactForm();
  }


  if ($('.artifact-index').length > 0){
    initArtifactIndex();
  }


});

