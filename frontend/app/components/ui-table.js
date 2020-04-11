import Component from '@ember/component';
import { computed } from '@ember/object';
import ArrayProxy from '@ember/array/proxy';

export default Component.extend({
  init() {
    this._super(...arguments);

    this._widthConstraint = 'eq-container';
  },

  applyDefaultProperties(column) {
    let textAlign = column.textAlign || 'left';
    return { ...column, textAlign }
  },

  _columns: computed('columns', function() {
    return this.columns.map(column => this.applyDefaultProperties(column));
  }),

  _rows: computed('rows', function() {
    if (this.rows instanceof ArrayProxy) {
      return this.rows.toArray()
    }
    return this.rows;
  })
});
