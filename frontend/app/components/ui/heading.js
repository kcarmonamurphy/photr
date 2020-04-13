import Component from '@ember/component';

export default Component.extend({
  init() {
    this._super(...arguments);

    let level = this.level || 5;
    let { tagName, textSize } = this.options(level);

    this.tagName = tagName;
    this.classNames = [`tw-text-${textSize}`];
  },

  options(level) {
    switch(this.level) {
      case 1:
        return { tagName: 'h1', textSize: '3xl' }
      case 2:
        return { tagName: 'h2', textSize: '2xl' }
      case 3:
        return { tagName: 'h3', textSize: 'xl' }
      case 4:
        return { tagName: 'h4', textSize: 'lg' }
      case 5:
        return { tagName: 'h5', textSize: 'base' }
      case 6:
        return { tagName: 'h6', textSize: 'sm' }
    }
  }
});
