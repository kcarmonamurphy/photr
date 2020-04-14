import Component from '@ember/component';
import { computed } from '@ember/object';

export default Component.extend({
  tagName: 'span',
  type: 'primary',

  baseButtonStyles: ['focus:tw-outline-none', 'focus:tw-shadow-outline'],
  primaryButtonStyles: ['tw-rounded', 'tw-bg-teal-400', 'hover:tw-bg-teal-500', 'tw-p-2'],
  tertiaryButtonStyles: ['tw-font-bold', 'hover:tw-underline'],

  init() {
    this._super(...arguments);

    if (this.type == 'primary') {
      this.classNames = this.baseButtonStyles.concat(this.primaryButtonStyles);
    }
    if (this.type == 'tertiary') {
      this.classNames = this.baseButtonStyles.concat(this.tertiaryButtonStyles);
    }
  }
});
