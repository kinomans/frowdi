export function initTrailerModal() {
  const trailerButtons = document.querySelectorAll(".js-open-trailer");
  const modal = document.getElementById("trailer-modal");
  if (!modal) return;

  const iframe = modal.querySelector("iframe");
  const closeBtns = modal.querySelectorAll(".js-close-trailer-modal");
  const overlay = modal.querySelector(".trailer-modal__overlay");

  trailerButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const url = button.dataset.trailer;
      if (url) {
        iframe.src = url;
        modal.classList.add("active");
      }
    });
  });

  closeBtns.forEach((btn) => {
    btn.addEventListener("click", closeModal);
  });
  overlay.addEventListener("click", closeModal);

  function closeModal() {
    modal.classList.remove("active");
    iframe.src = "";
  }
}

document.addEventListener("DOMContentLoaded", initTrailerModal);
