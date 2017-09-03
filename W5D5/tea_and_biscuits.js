const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  let firstResponse, secondResponse;
  reader.question("Would you like some tea?", function(response1) {
    console.log(response1);
    reader.question("Would you like some biscuits?", function(response2) {
      console.log(response2);
      const res1 = firstResponse === "yes" ? "do" : "don't";
      const res2 = secondResponse === "yes" ? "do" : "don't";

      console.log(`So you ${res1} want tea and you ${res2} want biscuits.`);
      reader.close();
    });
  });
}

teaAndBiscuits();
