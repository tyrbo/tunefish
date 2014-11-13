import Ember from 'ember';

export default Ember.ObjectController.extend({
  
  model: function() {
           return this.store.find('user');
         }, 
  actions: {
    follow: function(){
      var subscription = this.store.createRecord('subscription', {
        followed_id: this.get('id')
      });

      subscription.save();
    }
  }
});
