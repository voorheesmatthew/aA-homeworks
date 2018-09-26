/*jshint esversion: 6 */
document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addListItem = (e) => {
    e.preventDefault();

    const input = document.querySelector('.favorite-input');
    const inputVal = input.value;
    input.value = "";

    const listItem = document.createElement('li');
    listItem.textContent = inputVal;

    const list = document.getElementById('sf-places');
    list.appendChild(listItem);
  };

  const listSubmit = document.querySelector('.favorite-submit');
  listSubmit.addEventListener("click", addListItem);



  // adding new photos





});
