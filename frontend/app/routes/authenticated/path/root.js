import Route from '@ember/routing/route';
import { singularize } from 'ember-inflector';

export default Route.extend({
  async model() {
    const adapter = this.store.adapterFor('path');
    const queryString = adapter.buildURL('path');

    return await this.fetchRecords(queryString);
  },

  async fetchRecords(queryString) {
    const response = await fetch(queryString).then(response => response.json());

    if (response.data) {
      const type = singularize(response.data.type)
      const id = response.data.id;

      return this.store.findRecord(type, id);
    } else {
      throw response.errors.firstObject;
    }
  },

  controllerName: 'authenticated.path.wildcard',
  templateName: 'authenticated.path.wildcard',

  setupController(controller, model) {
    this._super(controller, model);
    controller.set('modelType', model.constructor.modelName);
  },

  actions: {
    error(error) {
      if (error.message == 'You must provide a param `path`.') {
        // we don't care about this error. squelch it.
        return false;
      }
      else if (error.status === '404') {
        return true;
      }
      else {
        // Let the route above this handle the error.
        return true;
      }
    }
  }
});
