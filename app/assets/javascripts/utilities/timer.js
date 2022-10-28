document.addEventListener('turbolinks:load', function() {
    const countdownTimer = document.getElementById('test-passage-countdown-timer')

    if (countdownTimer) {
        const duration = parseInt(countdownTimer.dataset.time)
        startTimer(countdownTimer, duration)
    }
})

function startTimer(countdownTimer,duration) {
    let timer = duration, minutes, seconds
    setTimeout(()=>{
        clearInterval(interval)
        document.forms[0].submit()
    },duration * 1000)

    const interval = setInterval(function () {
        minutes = parseInt(timer / 60)
        seconds = parseInt(timer % 60)
        countdownTimer.textContent = ('0' + minutes).slice(-2) + ":" +
                                     ('0' + seconds).slice(-2)
        countdownTimer.style.width =  `${timer / duration * 100}%`
        --timer
    },1000 )
}






// function initializeClock(id, endtime) {
//     const clock = document.getElementById(id);
//     const timeinterval = setInterval(() => {
//         const t = getTimeRemaining(endtime);
//         clock.innerHTML = 'days: ' + t.days + '<br>' +
//             'hours: '+ t.hours + '<br>' +
//             'minutes: ' + t.minutes + '<br>' +
//             'seconds: ' + t.seconds;
//         if (t.total <= 0) {
//             clearInterval(timeinterval);
//         }
//     },1000);
// }
