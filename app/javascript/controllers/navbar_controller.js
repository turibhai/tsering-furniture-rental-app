import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = [""]
  connect() {
    console.log("Navbar controller connected");
  }

selectTab(e) {
// e.preventDefault();
// console.log(e);
// const rental = this.rentalTarget.querySelector(["data-status"])
//  const currentStatus = e.currentTarget.dataset.status


// rental.forEach(card => {
// const status = card.dataset
// if(currentStatus === "all" || status === currentStatus ){
// card.classList.remove('active');
// card.classList.remove('d-none');
// } else
// card.classList.remove('active');
// card.classList.add("d-none")
// })
}
}
