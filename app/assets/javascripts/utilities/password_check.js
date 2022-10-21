document.addEventListener('turbolinks:load', function() {
    const inputForm = document.querySelector('form')
    const confirmation = inputForm?.elements.user_password_confirmation
    const password = inputForm?.elements.user_password

    if (inputForm) {inputForm.addEventListener('input', function() {
        if (confirmation) {
            changeIcon(password, confirmation)
        }
    })}
})

function changeIcon(password, confirmation) {
    let correctIconClassList = confirmation.parentNode.querySelector('.octicon-check').classList
    let wrongIconClassList = confirmation.parentNode.querySelector('.octicon-x').classList

    if (confirmation.value === password.value && password.value !== '') {
        correctIconClassList.remove('hide')
        confirmation.classList.add('border-success')
        confirmation.classList.remove('border-danger')
        wrongIconClassList.add('hide')
    } else if (confirmation.value === '') {
        correctIconClassList.add('hide')
        wrongIconClassList.add('hide')
        confirmation.classList.remove('border-success', 'border-danger')
    } else {
        correctIconClassList.add('hide')
        wrongIconClassList.remove('hide')
        confirmation.classList.add('border-danger')
        confirmation.classList.remove('border-success')
    }
}
