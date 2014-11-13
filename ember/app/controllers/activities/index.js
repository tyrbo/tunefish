import Ember from 'ember';

var ActivitiesIndexController =  Ember.ObjectController.extend({
  styledYoutubePercentage: function () {
    return 'width: ' + this.get('youtubePercentage') + '%';
  }.property('youtubePercentage'),

  styledTwitterPercentage: function () {
    return 'width: ' + this.get('twitterPercentage') + '%';
  }.property('twitterPercentage'),

  styledSoundcloudPercentage: function () {
    return 'width: ' + this.get('soundcloudPercentage') + '%';
  }.property('soundcloudPercentage'),

  youtubePercentage: function() {
    var youtubeActivities = [];
    var activities = this.get('model.activity');
    function getYoutubeActivities(element){
      if(element.get('provider') === "youtube"){
        youtubeActivities.push(element);
      }
    }
    activities.forEach(getYoutubeActivities);

    var youtubeCount = 0;
    youtubeCount = youtubeActivities.get('length');

    var activitiesCount = activities.get('length');

    var percentage = (youtubeCount/activitiesCount) *100;
    return percentage;

  }.property('model.activity.@each'),

  twitterPercentage: function() {
    var twitterActivities = [];
    var activities = this.get('model.activity');
    function getTwitterActivities(element){
      if(element.get('provider') === "twitter"){
        twitterActivities.push(element);
      }
    }
    activities.forEach(getTwitterActivities);

    var twitterCount = 0;
    twitterCount = twitterActivities.get('length');

    var activitiesCount = activities.get('length');
    var percentage = (twitterCount/activitiesCount) *100;
    return percentage;

  }.property('model.activity.@each'),

  soundcloudPercentage: function() {
    var soundcloudActivities = [];
    var activities = this.get('model.activity');
    function getSoundcloudActivities(element){
      if(element.get('provider') === "soundcloud"){
        soundcloudActivities.push(element);
      }
    }
    activities.forEach(getSoundcloudActivities);

    var soundcloudCount = 0;
    soundcloudCount = soundcloudActivities.get('length');

    var activitiesCount = activities.get('length');

    var percentage = (soundcloudCount/activitiesCount) *100;
    return percentage;
  }.property('model.activity.@each'),

  isYoutubePercentage: function () {
    return this.get('youtubePercentage') !== 0;
  }.property('youtubePercentage'),

  isTwitterPercentage: function () {
    return this.get('twitterPercentage') !== 0;
  }.property('twitterPercentage'),

  isSoundcloudPercentage: function () {
    return this.get('soundcloudPercentage') !== 0;
  }.property('soundcloudPercentage'),

  validActivities: function() {
    debugger;
    return this.get('model.activity').filterBy('user.id', this.get('user_id'))
  }.property('model.activity.@each')

});

export default ActivitiesIndexController;
