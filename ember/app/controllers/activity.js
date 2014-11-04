import Ember from 'ember';

export default Ember.ObjectController.extend({
  isYoutube: function() {
    return this.get('provider') === 'youtube';
  }.property('provider'),

  isSoundcloud: function() {
    return this.get('provider') === 'soundcloud';
  }.property('provider')
});
