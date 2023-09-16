console.log('Script loaded'); // Check if the script is loaded

document.addEventListener('DOMContentLoaded', function() {
    console.log('DOMContentLoaded event fired'); // Check if the event fires

    const submitFormButton = document.getElementById('submitFormButton');
    console.log('Button element:', submitFormButton);

    if (submitFormButton) {
        submitFormButton.addEventListener('click', function() {
            console.log('Button clicked');

            const form = document.querySelector('form');
            console.log('Form element:', form);

            if (form) {
                form.submit();
                console.log('Form submitted');
            } else {
                console.error('Form not found');
            }
        });
    } else {
        console.error('Button element not found');
    }
});
