const form = document.getElementById("review-form");
const movieId = document.getElementById("review-section")?.dataset.movieId;

// --- Вспомогательные функции --- //
function escapeHtml(str) {
  return String(str ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

// Форматирование даты (например, 24 мая 2025)
function formatDate(str) {
  if (!str) return "";
  const date = new Date(str.replace(" ", "T")); // fix for Safari
  return date.toLocaleDateString("ru-RU", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  });
}

// Аватарка или инициалы
function renderAvatar(name, surname, avatar) {
  if (avatar && avatar.length > 2 && avatar !== "null") {
    return `<span class="review__avatar"><img src="${escapeHtml(
      avatar
    )}" alt="Аватар"></span>`;
  } else {
    let initials = "";
    if (name) initials += name[0].toUpperCase();
    if (surname) initials += surname[0].toUpperCase();
    return `<span class="review__avatar">${escapeHtml(initials)}</span>`;
  }
}

// --- Модальное подтверждение --- //
function showConfirmDialog(message) {
  return new Promise((resolve) => {
    if (document.getElementById("confirm-modal")) return;
    const modal = document.createElement("div");
    modal.id = "confirm-modal";
    modal.innerHTML = `
      <div class="confirm-modal__overlay"></div>
      <div class="confirm-modal__content">
        <div class="confirm-modal__text">${escapeHtml(message)}</div>
        <div class="confirm-modal__actions">
          <button class="confirm-modal__btn confirm-modal__btn--yes">Удалить</button>
          <button class="confirm-modal__btn confirm-modal__btn--no">Отмена</button>
        </div>
      </div>
    `;
    document.body.appendChild(modal);

    modal.querySelector(".confirm-modal__btn--yes").onclick = () => {
      resolve(true);
      modal.remove();
    };
    modal.querySelector(".confirm-modal__btn--no").onclick = () => {
      resolve(false);
      modal.remove();
    };
    modal.querySelector(".confirm-modal__overlay").onclick = () => {
      resolve(false);
      modal.remove();
    };
  });
}

// --- Отправка формы --- //
if (form) {
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const data = {
      movie_id: movieId,
      rating: formData.get("rating"),
      comment: formData.get("comment"),
    };

    fetch("/api/reviews/add.php", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
      credentials: "include",
    })
      .then((res) => res.json())
      .then(() => {
        form.reset();
        loadReviews();
      });
  });
}

// --- Загрузка и рендер отзывов --- //
function loadReviews() {
  const container = document.getElementById("reviews-container"); // Динамический поиск!
  if (!container) return; // если блока нет — ничего не делаем

  fetch(`/api/reviews/list.php?movie_id=${movieId}`)
    .then((res) => res.json())
    .then((data) => {
      container.innerHTML = data
        .map(
          (r) => `
        <div class="review">
          ${renderAvatar(r.name, r.surname, r.avatar)}
          <div class="review__main">
            <div class="review__header">
              <span class="review__author">${escapeHtml(r.name)} ${escapeHtml(
            r.surname
          )}</span>
              <span class="review__rating">★ ${escapeHtml(r.rating)}</span>
              <span class="review__date">${formatDate(r.created_at)}</span>
              ${
                r.can_delete
                  ? `<button class="review__delete" data-id="${r.id}" title="Удалить отзыв">×</button>`
                  : ""
              }
            </div>
            <div class="review__comment">${escapeHtml(r.comment)}</div>
          </div>
        </div>
      `
        )
        .join("");

      // Кнопки удаления
      container.querySelectorAll(".review__delete").forEach((btn) => {
        btn.addEventListener("click", () => {
          showConfirmDialog(
            "Вы действительно хотите удалить свой отзыв? Это действие нельзя отменить."
          ).then((confirmed) => {
            if (confirmed) {
              const id = btn.dataset.id;
              fetch(`/api/reviews/delete.php?id=${id}`, {
                method: "POST",
                credentials: "include",
              })
                .then((res) => res.json())
                .then((res) => {
                  if (res.success) loadReviews();
                });
            }
          });
        });
      });
    });
}

document.addEventListener("DOMContentLoaded", loadReviews);
