import Ember from 'ember';
import startApp from 'tunefish/tests/helpers/start-app';

var App;

module('Integration - static pages', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('Navbar should have the correct links', function() {
  visit('/').then(function() {
  });
});
