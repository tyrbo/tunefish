import Ember from 'ember';

export default Ember.View.extend({
  click: function soundcloudFilter(){
    $(".soundcloud").toggle();
    $(".soundcloud-filter").toggleClass('filter-off');
  }
});
