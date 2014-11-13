import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import config from './config/environment';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: config.modulePrefix,
  podModulePrefix: config.podModulePrefix,
  Resolver: Resolver,
  PUSHER_OPTS: { key: '1c01a36b23a3a8ea1383', connection: {} }
});

loadInitializers(App, config.modulePrefix);

export default App;
  
