import Route from '@ember/routing/route';
import { singularize } from 'ember-inflector';
import { computed } from '@ember/object';

const host = 'http://localhost:3000';
const namespace = 'api/v1';

export default Route.extend({
  async model({ path }) {
    const queryString = `${host}/${namespace}/path/${path}`;

    const response = await fetch(queryString).then(response => response.json());

    if (response.data) {
      const type = singularize(response.data.type)
      const id = response.data.id;

      return this.store.findRecord(type, id);
    } else {
      throw response.errors.firstObject;
    }
  },

  setupController(controller, model) {
    this._super(controller, model);
    controller.set('modelType', model.constructor.modelName);
  },

  actions: {
    error(error, transition) {
      if (error.status === '404') {
        this.replaceWith('not-found');
      } else {
        // Let the route above this handle the error.
        return true;
      }
    }
  }
});
