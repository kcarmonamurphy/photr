import Component from '@ember/component';
import { computed } from '@ember/object';

export default Component.extend({
  tagName: '',
    
  init() {
    this._super(...arguments);
  },

  actions: {
    updateValue(newValue) {
      this.set('value', newValue)
    }
  },

  errored: computed('errorMessage', {
    get() {
      if (this._errored) {
        return this._errored;
      }
      return this.errorMessage;
    },
    set(_, value) {
      return this._errored = value;
    }
  }),

  bgColor: computed('errored', function() {
    if (this.errored) {
      return 'error-40';
    }

    return 'ui-gray-40';
  }),

  borderColor: computed('errored', function() {
    if (this.errored) {
      return 'error-100';

    }

    return 'ui-gray-100';
  }),

  activeBorderColor: computed('errored','disabled', function() {
    if (this.errored) {
      return 'error-100';
    }
    if (this.get('disabled')) {
      return 'ui-gray-100'
    }
    return 'interactive-100';
  })
});