import Component from '@ember/component';
import { computed } from '@ember/object';
import ArrayProxy from '@ember/array/proxy';

export default Component.extend({
  init() {
    this._super(...arguments);

    this._widthConstraint = 'eq-container';
  },

  applyDefaultProperties(column) {
    return {
      ...column,
      textAlign: column.textAlign || 'left',
      headerComponent: column.headerComponent || 'ui/table/header',
      cellComponent: column.cellComponent || 'ui/table/cell',
      color: column.color || 'gray-200'
     }
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
