import Controller from '@ember/controller';
import { computed } from '@ember/object';
import { inject as service } from '@ember/service';

export default Controller.extend({
  rows: computed('model', function() {
    return this.model.toArray()
  }),
  init() {
    this._super(...arguments);

    let columns = [
      {
        name: `ID`,
        valuePath: `id`,
      },
      {
        name: 'Email',
        valuePath: `email`,
      },
      {
        name: 'Created At',
        valuePath: `createdAt`
      },
      {
        name: 'Updated At',
        valuePath: `updatedAt`
      }
    ];
    this.columns = columns.map(column => {
      return {
        ...column,
        textAlign: 'left',
        isFixed: 'left'
      }
    })

    this.widthConstraint = 'eq-container';
  }
});
