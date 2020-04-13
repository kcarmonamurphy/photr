import Component from '@ember/component';
import { task } from 'ember-concurrency';

export default Component.extend({
  tagName: '',

  performSubmit: task(function * (event) {
    yield this.onSubmit(event);
  }),

  actions: {
    submit(event) {
      event.preventDefault();
      event.stopPropagation();

      let changeset = this.object;

      if (changeset && changeset.isInvalid) {
        changeset.set('_errors', {});
      }
      
      this.performSubmit.perform(event);
    }
  }
});
