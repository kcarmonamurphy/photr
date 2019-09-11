import DS from 'ember-data';
import ENV from '../config/environment';

let options = {
  host: 'http://localhost:3000',
  namespace: 'api/v1'
};

if (ENV.apiHost) {
  options.host = ENV.apiHost;
}

export default DS.JSONAPIAdapter.extend(options);
