import { coursework_backend } from "../../declarations/coursework_backend";

// document.querySelector("form").addEventListener("submit", async (e) => {
//   e.preventDefault();
//   const button = e.target.querySelector("button");

//   const name = document.getElementById("name").value.toString();

//   button.setAttribute("disabled", true);

//   // Interact with foo actor, calling the greet method
//   const greeting = await coursework_backend.greet(name);

//   button.removeAttribute("disabled");

//   document.getElementById("greeting").innerText = greeting;

//   return false;
// });






function createCustomerList() {


  const nameInput = document.querySelector(".form-name input");
  
  console.log(nameInput);
  const sexInput = document.querySelector(".form-sex input");
  console.log(sexInput);


  const dateInput = document.querySelector(".form-date-of-birth input");
  console.log(dateInput);
  const phoneInput = document.querySelector(".form-phone input");

  console.log(phoneInput);


  const saveBtn = document.querySelector(".btn-save");
  saveBtn.addEventListener("click", async (e) => {
    e.preventDefault();
    console.log("hello");

    const valueName = nameInput.value;
    const sexValue = sexInput.value;
    const dateValue = dateInput.value;
    const phoneValue = phoneInput.value;

    await coursework_backend


  })
}




createCustomerList();

