import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return { activity: this.store.find('activity'),
            youtube_subscription: this.store.find('youtube_subscription'),
            subscription_activity: this.store.find('subscription_activity')  
    };
    },
});
