<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> hehe </title>
  <style>
    body {
      margin: 0;
      overflow: hidden; /* Ẩn thanh cuộn */
      background-color: black; /* Nền tối cho pháo hoa nổi bật */
      font-family: "Arial", sans-serif;
    }
    canvas {
      display: block;
      position: absolute;
      top: 0;
      left: 0;
    }
    .love-text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 3rem;
      font-weight: bold;
      color: #ff4d4d;
      text-shadow: 
        0 0 5px #ff4d4d, 
        0 0 10px #ff6666, 
        0 0 20px #ff9999, 
        0 0 30px rgba(255, 102, 102, 0.7);
      animation: glow 2s infinite, fadeIn 3s ease-in-out forwards;
      opacity: 0;
    }

    @keyframes glow {
      0% {
        text-shadow: 
          0 0 5px #ff4d4d, 
          0 0 10px #ff6666, 
          0 0 20px #ff9999, 
          0 0 30px rgba(255, 102, 102, 0.7);
      }
      50% {
        text-shadow: 
          0 0 10px #ff4d4d, 
          0 0 20px #ff6666, 
          0 0 30px #ffcccc, 
          0 0 40px rgba(255, 153, 153, 0.7);
      }
      100% {
        text-shadow: 
          0 0 5px #ff4d4d, 
          0 0 10px #ff6666, 
          0 0 20px #ff9999, 
          0 0 30px rgba(255, 102, 102, 0.7);
      }
    }

    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: scale(0.8);
      }
      100% {
        opacity: 1;
        transform: scale(1);
      }
    }
  </style>
</head>
<body>
  <!-- Canvas cho pháo hoa -->
  <canvas id="fireworksCanvas"></canvas>

  <!-- Chữ "Anh yêu em nhiều lắm ❤️" -->
  <div class="love-text">Anh yêu emmmmmmmmmmm  ❤️</div>

  <script>
    const canvas = document.getElementById("fireworksCanvas");
    const ctx = canvas.getContext("2d");

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    // Resize canvas khi thay đổi kích thước cửa sổ
    window.addEventListener("resize", () => {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    });

    const particles = [];
    const colors = ["#ff4d4d", "#4d94ff", "#4dff88", "#ffd24d", "#ff4dff"];

    // Hàm tạo pháo hoa
    function createFirework(x, y) {
      const particleCount = 50; // Số lượng tia pháo hoa
      for (let i = 0; i < particleCount; i++) {
        particles.push({
          x: x,
          y: y,
          angle: Math.random() * 2 * Math.PI,
          speed: Math.random() * 5 + 2,
          radius: Math.random() * 3 + 1,
          color: colors[Math.floor(Math.random() * colors.length)],
          alpha: 1,
          decay: Math.random() * 0.02 + 0.01,
        });
      }
    }

    // Hàm để tạo hiệu ứng chuyển động
    function animateParticles() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      for (let i = particles.length - 1; i >= 0; i--) {
        const p = particles[i];
        p.x += Math.cos(p.angle) * p.speed;
        p.y += Math.sin(p.angle) * p.speed;
        p.alpha -= p.decay;

        if (p.alpha <= 0) {
          particles.splice(i, 1); // Xóa tia pháo hoa khi nó biến mất
          continue;
        }

        ctx.beginPath();
        ctx.arc(p.x, p.y, p.radius, 0, Math.PI * 2);
        ctx.fillStyle = `rgba(${hexToRgb(p.color)}, ${p.alpha})`;
        ctx.fill();
      }

      requestAnimationFrame(animateParticles);
    }

    // Chuyển đổi màu HEX sang RGB
    function hexToRgb(hex) {
      const bigint = parseInt(hex.slice(1), 16);
      const r = (bigint >> 16) & 255;
      const g = (bigint >> 8) & 255;
      const b = bigint & 255;
      return `${r}, ${g}, ${b}`;
    }

    // Tạo pháo hoa tự động ở vị trí ngẫu nhiên
    function autoFireworks() {
      const x = Math.random() * canvas.width;
      const y = Math.random() * canvas.height * 0.5; // Chỉ bắn pháo hoa ở nửa trên màn hình
      createFirework(x, y);

      // Gọi lại hàm sau một khoảng thời gian ngẫu nhiên
      setTimeout(autoFireworks, Math.random() * 1000 + 500); // Từ 500ms đến 1500ms
    }

    // Khởi chạy
    animateParticles();
    autoFireworks(); // Bắt đầu bắn pháo hoa tự động
  </script>
</body>
</html>

 
