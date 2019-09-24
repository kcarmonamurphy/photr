import Route from '@ember/routing/route';
import { singularize } from 'ember-inflector';

const host = 'http://localhost:3000';
const namespace = 'api/v1';

export default Route.extend({
  async model({ path }) {
      const queryString = `${host}/${namespace}/path/${path}`;

      const response = await fetch(queryString).then(response => response.json());

      const type = singularize(response.data.type)
      const id = response.data.id;

      return this.store.findRecord(type, id);
  }
});
