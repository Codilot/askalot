App.appearances = App.cable.subscriptions.create("AppearancesChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    this.perform('unsubscribed');
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel

    var user = $(".user-" + data['user_id']);
    user.toggleClass('online');  

    if(data['online'] == false) {
      user.removeClass('online');
    }
  }

});

