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

    var ball = {
        x: 100,
        y: 100,
        radius: 25,
        color: 'blue',
        draw: function() {
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
            ctx.closePath();
            ctx.fillStyle = this.color;
            ctx.fill();
        }
    };

    var rectangle = {
        width:100,
        height: 200,
        draw: function() {
            // console.log(' ' + this.x + ' ' + this.y + ' ' + this.width + ' ' + this.height);
            ctx.fillStyle = 'rgba(32, 179, 32, 1)';
            ctx.fillRect(this.x, this.y, this.width, this.height);
        }
    };

    // INIT ==========================================
    // on centre les coordonnées
    ctx.translate(canvas.width/2, canvas.height/2);
    rectangle.x = - rectangle.width/2;
    rectangle.y = - rectangle.height/2;

    var width = 100;
    var height = 200;
    var position = 100;
    var raf;

    function animate() {

        // ctx.clearRect(-ctx_width/2, -ctx_height/2, 500,500);
        // creation d un effet de degrader.
        // on n´efface pas tout, on fait un degradé par étape.
        ctx.fillStyle = 'rgba(255, 255, 255, 0.4)';
        ctx.fillRect(-canvas.width/2, -canvas.height/2, canvas.width, canvas.height);

        // Rotate a Rectangle
        rectangle.draw();
        ball.draw();

        ctx.rotate(Math.PI/15);

        raf = window.requestAnimationFrame(animate);
    }

    canvas.addEventListener('mouseover', function(e) {
        console.log('je suis dans le canvas');

        raf = window.requestAnimationFrame(animate);
    });

    canvas.addEventListener('mouseout', function(e) {
        console.log('sorti du canvas ' + raf);


        window.cancelAnimationFrame(raf);
    });

}