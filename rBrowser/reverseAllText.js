var script = document.createElement('script');
script.src = 'http://code.jquery.com/jquery-1.11.0.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);



//pobiera text
var textArr = $('body').innerText.split("\n");

var textArr2;

var array = $('body').map(function(){
                          return $.trim($(this).text());
                          }).get();



$('body').innerText.each(function(i){
                         i.split("").reverse().join("");
                         });
