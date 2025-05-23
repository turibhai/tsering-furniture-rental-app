import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-cards"    var swiper = new Swiper(".mySwiper", {

export default class extends Controller {
  static targets = ["progressCircle", "progressContent"];

  connect() {
    console.log("connected")
    this.swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false
      },
      pagination: {
      el: ".swiper-pagination",
      clickable: true,
      },
      navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
      },

    });
  }
}




// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   static targets = ["card", "depth"]

//   connect() {
//     this.rx = 900;
//     this.ry = 900;
//     this.placeCards(); // Initial placement of cards
//   }

//   // Action for mousemove event on the depth container
//   // You'll bind this to data-action="mousemove->cards#handleMouseMove"
//   handleMouseMove(event) {
//     const containerWidth = this.depthTarget.offsetWidth;
//     const x_norm = event.clientX.toFixed(2) / (containerWidth / 2) - 1;
//     this.placeCards(x_norm);
//   }

//   placeCards(mouseX = 0) {
//     this.cardTargets.forEach((card, i) => {
//       const theta = (((180 / this.cardTargets.length) / 180) * i * Math.PI) - Math.PI + (((Math.PI / this.cardTargets.length) / 2) * (-mouseX * Math.PI)) + (Math.PI / this.cardTargets.length) / 2;
//       const posx = Math.round(this.rx * (Math.cos(theta)));
//       const posy = Math.round(this.ry * (Math.sin(theta))) + this.ry;
//       const posZ = 30 - Math.abs(posx);
//       const angle = this.#calcAngleDegrees(posx, posy); // Use private helper method
//       card.style.transform = `translate3d(${posx}px,${posy}px,${posZ}px) rotate(${angle}deg)`;
//     });
//   }

//   // Private helper method for calculating angle (convention: use # for private methods)
//   #calcAngleDegrees(x, y) {
//     return x > 0 ? Math.atan2(y, x) * 180 / Math.PI : Math.atan2(y, x) * 180 / Math.PI - 180;
//   }
// }
