import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';
import { render } from '@ember/test-helpers';
import hbs from 'htmlbars-inline-precompile';

module('Integration | Component | upload-dropzone', function(hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function(assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<UploadDropzone />`);

    assert.dom(this.element).hasText('');

    // Template block usage:
    await render(hbs`
      <UploadDropzone>
        template block text
      </UploadDropzone>
    `);

    assert.dom(this.element).hasText('template block text');
  });
});
