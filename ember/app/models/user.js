import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  photo: DS.attr('string'),
  identities: DS.hasMany('identity'),
  activities: DS.hasMany('activity'),
  subscriptions: DS.hasMany('subscription')
});
