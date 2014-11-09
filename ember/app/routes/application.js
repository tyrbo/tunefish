import Ember from 'ember';
var ApplicationRoute;

ApplicationRoute = Ember.Route.extend({
 actions: {
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
      $('.modal-backdrop.in').removeClass('modal-backdrop in');
    }
  }
});

export default ApplicationRoute;
