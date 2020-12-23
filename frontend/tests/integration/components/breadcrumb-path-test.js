import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import hbs from 'htmlbars-inline-precompile';

module('Integration | Component | breadcrumb-path', function(hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function(assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<BreadcrumbPath />`);

    assert.dom(this.element).hasText('');

    // Template block usage:
    await render(hbs`
      <BreadcrumbPath>
        template block text
      </BreadcrumbPath>
    `);

    assert.dom(this.element).hasText('template block text');
  });
});
