import Component from '@ember/component';

export default Component.extend({
  type: 'success',

  tagName: 'div',

  init() {
    this._super(...arguments);

    this.classNames = [];

    if (this.type == 'success') {
      this.classNames.push('tw-bg-green-500');
    }
    if (this.type == 'danger') {
      this.classNames.push('tw-bg-red-500')
    }
  }
});
