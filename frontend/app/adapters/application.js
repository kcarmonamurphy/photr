// import DS from 'ember-data';
// import ENV from '../config/environment';

// let options = {
//   host: 'http://localhost:3000',
//   namespace: 'api/v1'
// };

// if (ENV.apiHost) {
//   options.host = ENV.apiHost;
// }

// export default DS.JSONAPIAdapter.extend({
//   authorize(xhr) {
//     let { access_token } = this.get('session.data.authenticated');
//     if (isPresent(access_token)) {
//       xhr.setRequestHeader('Authorization', `Bearer ${access_token}`);
//     }
//   },

// });



import DS from 'ember-data';
import { isPresent } from '@ember/utils';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

export default DS.JSONAPIAdapter.extend(DataAdapterMixin, {
  host: 'http://localhost:3000',
  namespace: 'api/v1',

  authorize(xhr) {
    let { access_token } = this.get('session.data.authenticated');
    if (isPresent(access_token)) {
      xhr.setRequestHeader('Authorization', `Bearer ${access_token}`);
    }
  }
});

