import Ember from 'ember';

export default Ember.ObjectController.extend({
    
  actions: {
    follow: function(){
      var subscription = this.store.createRecord('subscription', {
        followed_id: this.get('id')
      });

      subscription.save();
    }
  }
});
