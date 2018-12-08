// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require interact
//= require_tree .

$(document).ready(function(){

  $("#add-step").click(function(){
    var lastStep = $(".steps-form form .step").last();
    var stepNumber = parseInt(lastStep.data("step-number")) + 1;

    lastStep.after('<div class="step" data-step-number=' + stepNumber + '>' + stepNumber + '</div>');
  });

  interact(".drag-drop").draggable({
    inertia: true,
    autoScroll: true,
    onmove: function(e){
      var target = $(e.target);
      var x = parseFloat(target.data("x") || 0) + e.dx;
      var y = parseFloat(target.data("y") || 0) + e.dy;

      target.css("transform", "translate(" + x + "px," + y + "px)");
      target.data("x", x);
      target.data("y", y);
    },
    onend: function(e){
      if(typeof e.dropzone === "undefined")
      {
        var target = $(e.target);

        target.css("transform", "translate(0, 0)");
        target.data("x", 0);
        target.data("y", 0);
      }
    }
  });

  interact(".drop-zone").dropzone({
    overlap: 0.75,
    ondrop: function(e){
      var target = $(e.target);
      var relatedTarget = $(e.relatedTarget);
      var x = parseFloat(relatedTarget.data("x") || 0) + target.offset().left - relatedTarget.offset().left;
      var y = parseFloat(relatedTarget.data("y") || 0) + target.offset().top - relatedTarget.offset().top;
      relatedTarget.css("transform", "translate(" + x + "px," + y + "px)");
      relatedTarget.data("x", x);
      relatedTarget.data("y", y);
    }
  });
});
