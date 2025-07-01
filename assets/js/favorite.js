// ===== favorite.js =====
import { showToast } from "./toast.js";

export function initFavoriteToggle() {
  const favButton = document.querySelector(".js-toggle-favorite");
  if (!favButton) return;

  favButton.addEventListener("click", () => {
    const movieId = favButton.dataset.id;
    fetch(`/api/favorite-toggle.php?id=${movieId}`, {
      method: "POST",
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        if (!data.success) {
          showToast(data.message || "Ошибка добавления в избранное", "error");
          return;
        }

        const isAdded = data.action === "added";
        favButton.classList.toggle("active", isAdded);

        if (isAdded) {
          showToast("Добавлено в избранное", "success");
        } else {
          showToast("Удалено из избранного", "error");
        }
      })
      .catch(() => {
        showToast("Произошла ошибка. Повторите попытку позже", "error");
      });
  });
}
