import Component from '@ember/component';
import Changeset from 'ember-changeset';

export default Component.extend({
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
    // let translationString = this.flashMessageTranslation(changeset)
    return changeset.save()
      .then((model) => {
        alert('submitted')
        // this.transitionToRoute(toRoute, ...models).then(() => {
        //   let modelName = underscore(model.get('constructor.modelName'))
        //   this.showFlashMessage(modelName, translationString)
        // })
      })
      .catch(() => {
        // this.changesetError(changeset);
        alert('error')
      });
  }
});
