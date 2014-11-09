import DS from 'ember-data';
import ENV from '../config/environment';

export default DS.ActiveModelAdapter.extend({
  namespace: 'api',
  host: ENV.APP.api_endpoint
});

