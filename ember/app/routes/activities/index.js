import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return  Ember.RSVP.hash({ activity: this.store.find('activity'),
            youtube_subscription: this.store.find('youtube_subscription'),
            subscription_activity: this.store.find('subscription_activity'),
            user: this.store.find('user')  
    });
    },
});
