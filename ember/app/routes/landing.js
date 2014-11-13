import Ember from 'ember';

export default Ember.Route.extend({
  afterModel: function() {
    var self = this;

    $.get('/api/status').done(function(data) {
      if (data.user_id != null) {
        self.replaceWith('activities.index');
      }
    });
  }
});
