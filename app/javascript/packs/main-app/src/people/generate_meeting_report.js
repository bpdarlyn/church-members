import 'select2';
import 'select2/dist/js/i18n/es';

$(document).ready(() => {
    $('.js-example-basic-single').select2({
        language: "es",
        autoClose: true
    });

    $('#person_id').on('select2:select', function (e) {
        // Do something
        var data = e.params.data;
        console.log(data);
        $.ajax({
            type: 'get',
            url: $('#person_id').data('linkChangeMeetings'),
            data: {
                authenticity_token: $('[name="csrf-token"]')[0].content,
                person_id: data.id,
                type_of_meeting_code: $('#person_id').data('typeOfMeetingCode')
            },

        })
    });
});