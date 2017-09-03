document.addEventListener("DOMContentLoaded", function() {
  const canvasEl = document.getElementById("myCanvas");
  canvasEl.height = 500;
  canvasEl.width = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, 500, 500);

  var sun = new Image();
  var moon = new Image();
  var earth = new Image();
  function init() {
    sun.src = "https://mdn.mozillademos.org/files/1456/Canvas_sun.png";
    moon.src = "https://mdn.mozillademos.org/files/1443/Canvas_moon.png";
    earth.src = "https://mdn.mozillademos.org/files/1429/Canvas_earth.png";
    window.requestAnimationFrame(draw);
  }

  function draw() {
    var ctx = document.getElementById("canvas").getContext("2d");

    ctx.globalCompositeOperation = "destination-over";
    ctx.clearRect(0, 0, 300, 300); // clear canvas

    ctx.fillStyle = "rgba(0, 0, 0, 0.4)";
    ctx.strokeStyle = "rgba(0, 153, 255, 0.4)";
    ctx.save();
    ctx.translate(150, 150);

    // Earth
    var time = new Date();
    ctx.rotate(
      2 * Math.PI / 60 * time.getSeconds() +
        2 * Math.PI / 60000 * time.getMilliseconds()
    );
    ctx.translate(105, 0);
    ctx.fillRect(0, -12, 50, 24); // Shadow
    ctx.drawImage(earth, -12, -12);

    // Moon
    ctx.save();
    ctx.rotate(
      2 * Math.PI / 6 * time.getSeconds() +
        2 * Math.PI / 6000 * time.getMilliseconds()
    );
    ctx.translate(0, 28.5);
    ctx.drawImage(moon, -3.5, -3.5);
    ctx.restore();

    ctx.restore();

    ctx.beginPath();
    ctx.arc(150, 150, 105, 0, Math.PI * 2, false); // Earth orbit
    ctx.stroke();

    ctx.drawImage(sun, 0, 0, 300, 300);

    window.requestAnimationFrame(draw);
  }

  init();

  // ctx.beginPath();
  // ctx.moveTo(75, 40);
  // ctx.bezierCurveTo(75, 37, 70, 25, 50, 25);
  // ctx.bezierCurveTo(20, 25, 20, 62.5, 20, 62.5);
  // ctx.bezierCurveTo(20, 80, 40, 102, 75, 120);
  // ctx.bezierCurveTo(110, 102, 130, 80, 130, 62.5);
  // ctx.bezierCurveTo(130, 62.5, 130, 25, 100, 25);
  // ctx.bezierCurveTo(85, 25, 75, 37, 75, 40);
  // ctx.fill();
});
