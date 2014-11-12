import Ember from 'ember';

export default Ember.View.extend({
  subscriptions: $.getJSON('api/subscription_activities.json')
});
