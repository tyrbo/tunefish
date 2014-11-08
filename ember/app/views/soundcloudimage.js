import Ember from 'ember';
export default Ember.View.extend({
  click:function removeHideSoundcloudTable(){
      $("#soundcloud-table").toggle();
    }
});
