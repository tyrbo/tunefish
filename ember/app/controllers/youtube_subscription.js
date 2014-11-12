import Ember from 'ember';

export default Ember.ObjectController.extend({
  isTracked: function() {
    return this.get('tracked') === 'true';
  }.property('tracked'),

  actions: {
    untrack: function(){
     this.set('tracked', 'false');
     this.get('model').save();
   },
    track: function() {
      this.set('tracked', 'true');
      this.get('model').save();
    }
  }

});
