import FormFieldComponent from './form-field';

export default FormFieldComponent.extend({
  init() {
    this._super(...arguments);
  },

  disabled: false,
  autocomplete: 'off',
  id: 'default-id',
  placeholder: 'default-placeholder',

  textSize: 'lg',
  textColor: 'ui-black-100',
  
  classNames: ['tw-font-body', 'tw-break-words', 'tw-leading-normal']
});
