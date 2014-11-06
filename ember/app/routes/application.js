import Ember from 'ember';
var ApplicationRoute;

ApplicationRoute = Ember.Route.extend({
 actions: {
    openAuthWindow: function(service) {
      var env = JSON.parse(decodeURIComponent($('meta[name="tunefish/config/environment"]').attr('content')));

      if (env.environment === 'production') {
        window.open('http://api.tunefi.sh/auth/' + service);
      } else {
        window.open('http://127.0.0.1:3000/auth/' + service);
      }

      this.transitionTo('activities');
    },
    openModal: function(name, content) {
      this.controllerFor(name).set('content', content);
      this.render(name, {
        into: 'application',
        outlet: 'modal'
      });
    },
    closeModal: function() {
      this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    }
  }
});

export default ApplicationRoute;
