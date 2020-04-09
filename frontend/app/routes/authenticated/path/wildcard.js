import RootPathRoute from './root';

export default RootPathRoute.extend({
  async model({ path }) {
    const adapter = this.store.adapterFor('path');
    const queryString = adapter.buildURL('path');

    return await this.fetchRecords(`${queryString}/${path}`);
  }
});
