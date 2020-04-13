import Controller from '@ember/controller';

export default Controller.extend({
  init() {
    this._super(...arguments);

    this.columns = [
      {
        name: `ID`,
        valuePath: `id`,
        textAlign: 'left',
        isFixed: 'left',
        cellComponent: 'ui/table/cell-link',
        route: 'authenticated.users.detail'
      },
      {
        name: 'Name',
        valuePath: 'name'
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
      },
      {
        name: 'Roles',
        valuePath: 'rolesStringified'
      }
    ];
  }
});
