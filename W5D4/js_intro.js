function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block  in block


function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
 //  in block  out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
 //  error

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block  in block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}
// error

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective} ${noun}`;
}


function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  return array.filter(int => (int % 3 == 0 ? !(int % 5 == 0) : int % 5 == 0));
}

function isPrime(int) {
  var result = true;
  for (var i = 2; i <= int / 2; i++) {
    if (int % i == 0) {
      var result = false
    }
  }
  return result
}

function firstNPrimes(n) {
  var result = []
  var i = 1
  while (result.length < n) {
    if (isPrime(i)) {
      result.push(i)
    }
    i++
  }
  return result
}

function sumOfNPrimes(n) {
  return firstNPrimes(n).reduce(function(sum, next) {
    return sum + next;
  }, 0)
}

function printCallback(arrayOfStrings) {
  arrayOfStrings.forEach(function(string) {
    console.log(string);
  })
}
function titleize(arrayOfNames, printCallback) {
  var titles = arrayOfNames.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  })
  printCallback(titles);
}

function Elephant(name, heightInInches, arrayOfTricks) {
  this.name = name;
  this.height = heightInInches;
  this.tricks = arrayOfTricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick)
};

Elephant.prototype.play = function () {
  console.log(`${this.name} is ${this.tricks[ Math.floor(Math.random() * (this.tricks.length)) ]}`)
};

function paradeHelper(animal) {
  console.log(`${animal.name} is trotting by and waving to the crowd.`)
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(function(elephant) {
  paradeHelper(elephant);
})

function dinerBreakfast() {
  var order = "May I please have some oatmeal?";
  console.log(order);

  return function(addOn) {
    order = `${order.slice(0, -1)} and ${addOn}?`;
    console.log(order);
  }
}
