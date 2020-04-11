import Controller from '@ember/controller';

export default Controller.extend({
  init() {
    this._super(...arguments);

    this.columns = [
      {
        name: `ID`,
        valuePath: `id`,
        textAlign: 'left',
        isFixed: 'left'
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
        valuePath: `updatedAt`,
      }
    ];
  }
});
