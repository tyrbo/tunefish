import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return { activity: this.store.find('activity'),
            youtube_subscription: this.store.find('youtube_subscription'),
            subscription_activity: this.store.find('subscription_activity')  
    };
  },

  setupController: function(controller, model) {
    controller.set('model', model);

    var self = controller;

    $.get('/api/status').done(function(data) {
      if (data.user_id != null) {
        self.set('pusher', new Pusher('1c01a36b23a3a8ea1383'));
        self.set('channel', self.get('pusher').subscribe('user_' + data.user_id));
        self.get('channel').bind('activity', function(data) {
          self.get('model.activity').unshiftObject(Ember.Object.create(data.activity));
        });
      }
    });
  }
});
