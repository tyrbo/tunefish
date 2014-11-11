import DS from 'ember-data';

export default DS.Model.extend({
  follower_id: DS.attr('integer'),
  followed_id: DS.attr('integer'),
  activities: DS.hasMany('activity')
});
