
import 'select2';                       // globally assign select2 fn to $ element
import 'select2/dist/js/i18n/es'

$(document).ready(()=>{
    // $.fn.select2.defaults.set('amdBase', 'select2/');
    // $.fn.select2.defaults.set('amdLanguageBase', 'select2/i18n/');
    console.log('people 2 hoello');
    $('.js-example-basic-single').select2({
        placeholder: 'Ingresa una cualidad',
        allowClear: true,
        language: "es"
    });
});