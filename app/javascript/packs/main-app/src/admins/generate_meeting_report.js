var $table = $('#table-attendance');

$(document).ready(() => {
    $('.js-example-basic-single').select2({
        language: "es"
    });

    $('#person_id').on('select2:select', function (e) {
        // Do something
        var data = e.params.data;
        $.ajax({
            type: 'get',
            url: $('#person_id').data('linkChangeMeetings'),
            data: {
                authenticity_token: $('[name="csrf-token"]')[0].content,
                person_id: data.id,
                type_of_meeting_code: $('#person_id').data('typeOfMeetingCode')
            }
        })
    });

    $(document).on('ajax:success', '#new_person', function (data, status, xhr) {
        // will do something
        let person = data.detail[0];
        if (person) {
            person = JSON.parse(person);
            person = person[0].person_model;
            $table.bootstrapTable('prepend', {
                person_id: person.id,
                full_name: `${person.name} ${person.last_name}`,
                role_type: null,
                birthday: person.birthday,
                phone_number: person.phone_number
            });
            $('#new-express-person').modal('hide');
        }
    });
});