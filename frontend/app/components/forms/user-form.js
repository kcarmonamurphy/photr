import Component from '@ember/component';
import Changeset from 'ember-changeset';
import { inject as service } from '@ember/service';

export default Component.extend({
  flashMessages: service(),
  router: service(),

  init() {
    this._super(...arguments);
    this.changeset = new Changeset(this.model);
  },

  actions: {
    async formSubmit() {
      event.preventDefault();
      this.submitNewChangeset(this.get('changeset'))
    }
  },

  submitNewChangeset(changeset) {
    return changeset.save()
      .then((model) => {
        this.get('router').transitionTo('authenticated.users.detail', model).then(() => {
          let modelName = model.get('constructor.modelName')
          this.flashMessages.success(`${modelName} submitted successfully`);
        })
      })
      .catch((error) => {
        this.flashMessages.danger(`Error: ${error}`);
      });
  }
});
