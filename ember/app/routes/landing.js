import Ember from 'ember';

export default Ember.Route.extend({
  setupController: function(controller, model) {
    var self = this;

    $.get('/api/status').done(function(data) {
      if (data.user_id != null) {
        self.transitionTo('activities.index');
      }
    });
  }
});
