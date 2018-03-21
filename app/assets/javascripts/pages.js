

$(document).on('turbolinks:load ajaxSuccess', function() {

  $(".alert").delay(2000).fadeOut(800);

  $("#conversations-list .toggle-window").click(function(e) {
    e.preventDefault();
    var panel = $(this).parent().parent();
    var messages_list = panel.find('.messages-list');

    panel.find('.conversation-panel').toggle();
    panel.attr('class', 'conversation-wrapper card bg-light');

    if (panel.find('.conversation-panel').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });

});