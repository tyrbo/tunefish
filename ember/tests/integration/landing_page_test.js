import Ember from 'ember';
import startApp from 'tunefish/tests/helpers/start-app';

var App;

module('Integration - landing page', {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, 'destroy');
  }
});

test('New user should see the landing page', function() {
  // Figure out how to check if a user is logged in in ember
  visit('/').then(function() {
    equal(find('h1.landing-page-title').text(), "All of your music,All in one place.");
  });
});
