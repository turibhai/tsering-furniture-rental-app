import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="range-tracker"
export default class extends Controller {
  static targets = ["input", "counter"];
  static values = {
    price: Number
  }
  connect() {
    console.log("We connect");
   flatpickr(this.inputTarget, {
      mode: "range",
      dateFormat: "Y-m-d"
    })
  }


  updatePrice(e) {
    const selectedDate = e.currentTarget.value.split(" to ")
    if(selectedDate.length == 2) {
      const startDate = Date.parse(selectedDate[0]) // 2025-05-30
      const endDate = Date.parse(selectedDate[1])

      const duration = Math.ceil(endDate - startDate) / (1000 * 60 * 60 * 24) + 1 //this will calculate the days
      const total = duration * this.priceValue
      this.counterTarget.innerText = `${total}`;
    }
    else {
      this.counterTarget.innertext = this.priceValue;
    }
  }
}
