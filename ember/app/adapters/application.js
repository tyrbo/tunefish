import DS from 'ember-data';

var real = DS.ActiveModelAdapter.extend({
  namespace: 'api'
});

var test = DS.FixtureAdapter.extend();

export default test; 
