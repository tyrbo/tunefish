import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return { activities: this.store.find('activity'),
            youtube_subscriptions: this.store.find('youtube_subscription')
          };
    },
});
