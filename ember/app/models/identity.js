import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),
  uid: DS.attr(),
  provider: DS.attr(),
});
