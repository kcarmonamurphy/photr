import Component from '@ember/component';

export default Component.extend({
  tagName: '',
  name: '',
  // Update iconSize to fixed sizes (small, default, large, xl)
  // For now default default sizes are:
  // Small: 4
  // Default: 6
  iconSize: '6',

  iconColor: 'black',
});