import Ember from 'ember';

export default Ember.View.extend({

  click: function removeHideYoutubeTable(){
      $("#youtube-table").toggle();
    }
});
