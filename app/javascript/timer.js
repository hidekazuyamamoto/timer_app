function timers(){
  const start = document.getElementById('start')
  const stop = document.getElementById("stop")
  const form = document.getElementById('timer-count-new-form')
  let intervalId;

  start.addEventListener('click', ()=>{
    start.disabled = true
    button_push_time =  new Date();
    intervalId = setInterval(calc_time, 1000, button_push_time, time_g)
  })

  stop.addEventListener('click',()=>{
    clearInterval(intervalId);
    form.value = Math.floor(time_g/1000)
    start.disabled = false
  })
}


function calc_time(button_push_time, time_g){
  const time = new Date();
  const result = time - button_push_time + time_g
  time_display(result)
}


function time_display(result){
  time_g = result
  const timer =document.getElementById('timer')
  let hour = Math.floor(result/(1000*60*60))
  result %= 1000*60*60
  let min = ("0" + Math.floor(result/(1000*60))).slice(-2)
  result %= 1000*60
  let sec = ("0" + Math.floor(result/(1000))).slice(-2)
  timer.innerHTML =  hour +":"+min+":"+sec
}




let time_g = 0 ;

window.addEventListener('load', timers)