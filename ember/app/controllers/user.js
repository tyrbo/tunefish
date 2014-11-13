import Ember from 'ember';

export default Ember.ObjectController.extend({
  following: false, 
  actions: {
    follow: function(){
      var subscription = this.store.createRecord('subscription', {
        followed_id: this.get('id')
      });
      this.set('following', true);
      subscription.save();
    },
    unfollow: function(){
        this.set('following', false);
    }
  }
});
