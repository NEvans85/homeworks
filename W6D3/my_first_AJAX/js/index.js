console.log("Hello from the JavaScript console!");
$.ajax({
  type: "GET",
  url:
    "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("Here's the weather in NYC!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  }
});
$.ajax({
  type: "GET",
  url:
    "http://api.openweathermap.org/data/2.5/weather?q=LA,CA&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("Here's the weather in SF!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  }
});
// Your AJAX request here
console.log("This log is at the end");
// Add another console log here, outside your AJAX request
