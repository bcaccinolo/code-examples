window.onload = function()
{
    var canvas = document.getElementById('mon_canvas');
        if(!canvas)
        {
            alert("Impossible de récupérer le canvas");
            return;
        }

    var ctx = canvas.getContext('2d');
        if(!ctx)
        {
            alert("Impossible de récupérer le context du canvas");
            return;
        }


    document.ctx = ctx;

    //C'est ici que l'on placera tout le code servant à nos dessins.

    function draw() {
        ctx = document.ctx;
        for (var i = 0; i < 3; i++) {
          for (var j = 0; j < 3; j++) {
            ctx.save();
            ctx.fillStyle = 'rgb(' + (51 * i) + ', ' + (255 - 51 * i) + ', 255)';
            ctx.translate(10 + j * 50, 10 + i * 50);
            ctx.fillRect(0, 0, 25, 25);
            ctx.restore();
          }
        }
      }


      ctx_width = 500;
      ctx_height = 500;
      ctx.translate(ctx_width/2, ctx_height/2);

      width = 100;
      height = 200;
      position = 100;

      function animate() {
        ctx = document.ctx;

        ctx.clearRect(-ctx_width/2, -ctx_height/2, 500,500);

        // Move a rectangle
        // ctx.clearRect(5, position - 10, width, height);
        // ctx.fillRect(5, position, width, height);
        // position = position + 10;

        // Rotate a Rectangle
        ctx.fillRect(-width/2, -height/2, width, height);
        ctx.rotate(Math.PI/5);

        console.log('position: ' + position );
      }

      setInterval(animate, 1000);


}