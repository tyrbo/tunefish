import startApp from 'tunefish/tests/helpers/start-app';
import Pretender from 'pretender';
import Ember from 'ember';

var App, server;

module('Integration - Speaker Page', {
  setup: function() {
    App = startApp();
    var activities = [
      {
        id: 1,
        type: 'allie',
        content: "https://youtube.com"
      },
      {
        id: 2,
        type: 'will',
        content: '1234567890'
      },
    ];

    server = new Pretender(function() {
      this.get('/api/activities', function(request) {
        return [200, {"Content-Type": "application/json"}, JSON.stringify({activities: activities})];
      });
    });

  },
  teardown: function() {
    Ember.run(App, 'destroy');
    server.shutdown();
  }
});

test('should display all activities', function() {
  visit('/activities').then(function() {
    equal(find('div:contains("allie")').length, "");
    equal(find('div:contains("will")').length, 1);
  });
});