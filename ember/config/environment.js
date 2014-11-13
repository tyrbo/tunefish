/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'tunefish',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
      api_endpoint: 'http://127.0.0.1:4200'
    },

    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self' 'unsafe-eval' 'unsafe-inline' maxcdn.bootstrapcdn.com http://127.0.0.1:35729 https://stats.pusher.com",
      'font-src': "'self' maxcdn.bootstrapcdn.com",
      'connect-src': "'self' 127.0.0.1:3000 ws://127.0.0.1:35729 wss://ws.pusherapp.com",
      'img-src': "'self' s3-us-west-2.amazonaws.com",
      'style-src': "'self' 'unsafe-inline' maxcdn.bootstrapcdn.com",
      'frame-src': "www.youtube.com w.soundcloud.com ",
      'report-uri': 'http://localhost:4200'
    },
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'auto';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    ENV.APP.api_endpoint = 'https://tunefi.sh';
  }

  return ENV;
};
