document.addEventListener("DOMContentLoaded", function () {
    const submitFormButton = document.getElementById("submitFormButton");

    if (submitFormButton) {
        submitFormButton.addEventListener("click", function () {
            const form = document.querySelector("form"); // Select the first form in the page

            if (form) {
                form.submit(); // Submit the form
            }
        });
    }
});
