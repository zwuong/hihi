
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> hehe </title>
  <style>
    body {
      background-image: url('hehehehe.png');
      background-size: cover; 
      background-repeat: no-repeat; 
      background-attachment: fixed; 
    }
  </style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Yes/No Buttons</title>
  <style>
    .no-button, .yes-button {
      font-size: 16px;
      padding: 10px 20px;
      margin: 5px;
      cursor: pointer;
      text-align: center;
    }
  </style>
</head>
<body>
  <h1> Do you agree to be my valentine date? </h1>
  <button class="no-button" onclick="handleNoClick()">No</button>
  <button class="yes-button" onclick="handleYesClick()">Yes</button>

  <script>
    const messages = ["Are you sure?", "Think again!", "Maybe?", "Absolutely no!"];
    let messageIndex = 0;

    function handleNoClick() {
      const noButton = document.querySelector(".no-button");
      const yesButton = document.querySelector(".yes-button");
      noButton.textContent = messages[messageIndex];
      messageIndex = (messageIndex + 1) % messages.length;

      const currentSize = parseFloat(window.getComputedStyle(yesButton).fontSize);
      yesButton.style.fontSize = `${currentSize * 1.5}px`;
    }

    function handleYesClick() {
      window.location.href = "yes_page.html";
    }
  </script>
</body>
</html>
