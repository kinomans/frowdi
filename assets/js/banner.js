import { initTrailerModal } from "./trailer.js";
import { initFavoriteToggle } from "./favorite.js";

function initBannerEvents() {
  initTrailerModal();
  initRandomMovieRefresh();
  initFavoriteToggle();
}

function initRandomMovieRefresh() {
  const refreshButton = document.querySelector(".js-refresh-random");
  if (refreshButton) {
    refreshButton.addEventListener("click", () => {
      const banner = document.getElementById("random-banner");
      const loader = document.getElementById("banner-loader");
      const content = banner.querySelector(".banner__container");

      if (content) content.style.display = "none";
      if (loader) loader.style.display = "flex";

      fetch("/api/random-movie.php")
        .then((res) => res.text())
        .then((html) => {
          const parser = new DOMParser();
          const doc = parser.parseFromString(html, "text/html");
          const newContent = doc.getElementById("random-banner").innerHTML;

          banner.innerHTML = newContent;
          banner.classList.add("fade-in");

          initBannerEvents(); // повторная инициализация
        });
    });
  }
}

document.addEventListener("DOMContentLoaded", initBannerEvents);
