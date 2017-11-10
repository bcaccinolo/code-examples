console.log("hello");


var canvas = document.getElementById('canvas1');

var ctx = canvas.getContext('2d');

console.log(ctx);


ctx.fillStyle = "rgb(200,0,0)";
ctx.fillRect (10, 10, 55, 50);

ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
ctx.fillRect (30, 30, 55, 50);

var lineargradient = ctx.createLinearGradient(0,0,150,150);
lineargradient.addColorStop(0, 'white');
lineargradient.addColorStop(1, 'black');

ctx.fillStyle = lineargradient;

ctx.fillRect(20,20, 50,50);


// create new image object to use as pattern
var img = new Image();
img.src = 'https://mdn.mozillademos.org/files/222/Canvas_createpattern.png';
img.onload = function(){

  // create pattern
  var ptrn = ctx.createPattern(img,'repeat');
  ctx.fillStyle = ptrn;
  ctx.fillRect(0,0,150,150);

}

