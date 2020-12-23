import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import hbs from 'htmlbars-inline-precompile';

module('Integration | Component | ui-table', function(hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function(assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<UiTable />`);

    assert.dom(this.element).hasText('');

    // Template block usage:
    await render(hbs`
      <UiTable>
        template block text
      </UiTable>
    `);

    assert.dom(this.element).hasText('template block text');
  });
});
