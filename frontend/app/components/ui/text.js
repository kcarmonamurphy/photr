import Component from '@ember/component';

export default Component.extend({
  size: 'base',
  bold: false,
  italics: false,

  tagName: 'span',

  init() {
    this._super(...arguments);

    this.classNames = [`tw-text-${this.size}`];

    if (this.bold) {
      this.classNames.push('tw-font-bold');
    }
    if (this.italics) {
      this.classNames.push('tw-italic')
    }
  }
});
