import Component from '@ember/component';

export default Component.extend({
  kind: 'success',
  tagName: 'div',

  init() {
    this._super(...arguments);

    this.classNames = [];

    if (this.kind == 'success') {
      this.classNames.push('tw-bg-green-500');
    }
    if (this.kind == 'danger') {
      this.classNames.push('tw-bg-red-500')
    }
  }
});
