document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = e => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach(li => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const handleFavoriteSubmitButton = e => {
    e.preventDefault();

    // get input and reset input field
    const inputEl = document.querySelector(".favorite-input");
    const input = inputEl.value;
    inputEl.value = "";

    // create new li from input and append it to the ul
    const favList = document.querySelector("#sf-places");
    const newLi = document.createElement("li");
    const liContent = document.createTextNode(input);
    newLi.appendChild(liContent);
    favList.appendChild(newLi);
  };

  // add even listener to favorite-submit button
  const favSubmitButton = document.querySelector(".favorite-submit");
  favSubmitButton.addEventListener("click", handleFavoriteSubmitButton);

  // adding new photos

  const handlePhotoShowButton = e => {
    e.preventDefault();

    // toggle hidden form
    const photoForm = document.querySelector(".photo-form-container");
    console.log(photoForm);
    if (photoForm.classList.contains("hidden")) {
      photoForm.classList.remove("hidden");
    } else {
      photoForm.classList.add("hidden");
    }
  };

  // add event listener to photo-show-button
  const photoShowButton = document.querySelector(".photo-show-button");
  photoShowButton.addEventListener("click", handlePhotoShowButton);

  const handlePhotoSubmit = e => {
    e.preventDefault();

    // get input and reset input field
    const photoURLInput = document.querySelector(".photo-url-input");
    const photoURL = photoURLInput.value;
    photoURLInput.value = "";

    // create new li with img inside
    const newLi = document.createElement("li");
    const newImg = document.createElement("img");
    newImg.src = photoURL;
    newLi.appendChild(newImg);

    // add new li to photoList
    const photoList = document.querySelector(".dog-photos");
    photoList.appendChild(newLi);
  };

  // add event listener to photo-url-submit button
  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);
});
