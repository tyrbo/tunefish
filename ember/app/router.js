import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('landing', { path: '/' });
  this.resource('users', function() {
    this.route('show', { path: ':user_id' });
  });
});

export default Router;
