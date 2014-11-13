import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function() {
    var self = this;

    $.get('/api/status').done(function(data) {
      if (data.user_id != null) {
        self.set('user_id', data.user_id);
      } else {
        window.location.replace(getAPIUrl() + '/auth/soundcloud');
      }
    });
  },

  model: function() {
    return  Ember.RSVP.hash({ activity: this.store.find('activity'),
            youtube_subscription: this.store.find('youtube_subscription'),
            subscription_activity: this.store.find('subscription_activity'),
    });
    },

  setupController: function(controller, model) {
    controller.set('model', model);

    var user_id = this.get('user_id');
    var self = controller;

    if (user_id != null) {
      controller.set('user_id', user_id);
      self.set('pusher', new Pusher('1c01a36b23a3a8ea1383'));
      self.set('channel', self.get('pusher').subscribe('user_' + user_id));
      self.get('channel').bind('activity', function(data) {
        self.get('model.activity').unshiftObject(Ember.Object.create(data));
      });
    }
  }
});
