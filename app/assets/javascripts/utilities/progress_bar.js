document.addEventListener('turbolinks:load', function() {
    const control = document.getElementById('test-passage-progress-bar')

    if (control) {
        let countQuestions = control.dataset.questionsCount
        let numberQuestion = control.dataset.questionNumber - 1
        control.style.width =  `${numberQuestion  / countQuestions * 100}%`
    }
})
