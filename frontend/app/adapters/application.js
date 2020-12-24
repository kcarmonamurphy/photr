import DS from 'ember-data'
import { inject as service } from '@ember/service'
import { computed } from '@ember/object'
import DataAdapterMixin from "ember-simple-auth/mixins/data-adapter-mixin"

export default class ApplicationAdapter extends DS.JSONAPIAdapter.extend(DataAdapterMixin) {
  @service session;

  namespace = 'api/v1'

  @computed('session.data.authenticated.access_token')
  get headers() {
    const headers = {};
    if (this.session.isAuthenticated) {
      headers['Authorization'] = `Bearer ${this.session.data.authenticated.access_token}`;
    }
    return headers;
  }
}
