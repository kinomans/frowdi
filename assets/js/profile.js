document.addEventListener("DOMContentLoaded", () => {
  // === Переключение табов ===
  const tabs = document.querySelectorAll(".profile__tab");
  const sections = document.querySelectorAll(".profile__section");

  tabs.forEach((tab) => {
    tab.addEventListener("click", () => {
      tabs.forEach((t) => t.classList.remove("profile__tab--active"));
      sections.forEach((s) => s.classList.remove("profile__section--active"));

      tab.classList.add("profile__tab--active");

      const targetId = tab.dataset.tab;
      const targetSection = document.getElementById(`tab-${targetId}`);
      if (targetSection) {
        targetSection.classList.add("profile__section--active");
      }
    });
  });

  // === Делегирование для профиля (универсально для всех действий) ===
  const profileContent = document.querySelector(".profile__content");
  if (profileContent) {
    profileContent.addEventListener("click", function (e) {
      // --- Удаление фильма из избранного ---
      const removeBtn = e.target.closest(".movie-card__remove");
      if (removeBtn) {
        e.preventDefault();
        showConfirmModal({
          text: "Вы действительно хотите удалить этот фильм из избранного?<br><span style='font-size:15px; opacity:.82'>Это действие нельзя отменить.</span>",
          yesText: "Удалить",
          noText: "Отмена",
          onConfirm: () => {
            const movieId = removeBtn.dataset.id;
            fetch("/api/remove-favorite.php", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({ movieId }),
              credentials: "include",
            })
              .then((res) => res.json())
              .then((data) => {
                if (data.success) {
                  const card = removeBtn.closest(".movie-card");
                  card.remove();
                  showToast("Фильм удалён из избранного", "success");
                  const movieContainer =
                    document.querySelector(".profile__movies");
                  if (movieContainer && movieContainer.children.length === 0) {
                    movieContainer.insertAdjacentHTML(
                      "afterend",
                      '<p class="profile__empty">У вас пока нет избранных фильмов.</p>'
                    );
                    movieContainer.remove();
                  }
                } else {
                  showToast("Не удалось удалить фильм", "error");
                }
              });
          },
        });
        return; // Остановить дальнейшую обработку
      }

      // --- Удаление отзыва ---
      const reviewDeleteForm = e.target.closest(".review-card__delete-form");
      if (reviewDeleteForm) {
        e.preventDefault();
        showConfirmModal({
          text: "Вы действительно хотите удалить свой отзыв? Это действие нельзя отменить.",
          yesText: "Удалить",
          noText: "Отмена",
          onConfirm: () => {
            const reviewId = reviewDeleteForm.dataset.id;
            fetch(`/api/reviews/delete.php?id=${reviewId}`, {
              method: "POST",
              credentials: "include",
            })
              .then((res) => res.json())
              .then((data) => {
                if (data.success) {
                  reviewDeleteForm.closest(".review-card").remove();
                  showToast("Отзыв удалён", "success");
                }
              });
          },
        });
        return;
      }

      // --- Редактирование отзыва ---
      const editBtn = e.target.closest(".review-card__edit-btn");
      if (editBtn) {
        const card = editBtn.closest(".review-card");
        const movieId = card.dataset.movieId;
        const ratingElem = card.querySelector(".review-card__rating");
        const oldRating = ratingElem ? ratingElem.dataset.rating : "";
        const commentElem = card.querySelector(".review-card__comment");

        // Сохраним оригинальные значения для отмены
        const originalComment = commentElem.textContent.trim();
        const originalRating = oldRating;

        // Заменяем текст на textarea
        const textarea = document.createElement("textarea");
        textarea.className = "review-card__edit-textarea";
        textarea.value = originalComment;

        // Рейтинг
        const ratingSelect = document.createElement("select");
        ratingSelect.className = "review-card__edit-rating";
        for (let i = 10; i >= 1; i--) {
          const option = document.createElement("option");
          option.value = i;
          option.textContent = i;
          if (i == oldRating) option.selected = true;
          ratingSelect.appendChild(option);
        }

        // Кнопки
        const saveBtn = document.createElement("button");
        saveBtn.className = "review-card__save-btn";
        saveBtn.textContent = "Сохранить";
        saveBtn.type = "button";

        const cancelBtn = document.createElement("button");
        cancelBtn.className = "review-card__cancel-btn";
        cancelBtn.textContent = "Отменить";
        cancelBtn.type = "button";

        // Заменяем элементы
        commentElem.replaceWith(textarea);
        ratingElem.replaceWith(ratingSelect);
        editBtn.style.display = "none";

        const actions = card.querySelector(".review-card__actions");
        actions.appendChild(saveBtn);
        actions.appendChild(cancelBtn);

        // Сохранить
        saveBtn.addEventListener("click", (e) => {
          e.preventDefault();
          fetch("/api/reviews/add.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            credentials: "include",
            body: JSON.stringify({
              movie_id: movieId,
              rating: ratingSelect.value,
              comment: textarea.value,
            }),
          })
            .then((res) => res.json())
            .then((data) => {
              if (data.success) {
                const newComment = document.createElement("p");
                newComment.className = "review-card__comment";
                newComment.textContent = textarea.value;
                textarea.replaceWith(newComment);

                const newRating = document.createElement("span");
                newRating.className = "review-card__rating";
                newRating.dataset.rating = ratingSelect.value;
                newRating.textContent = `★ ${ratingSelect.value}`;
                ratingSelect.replaceWith(newRating);

                saveBtn.remove();
                cancelBtn.remove();
                editBtn.style.display = "";
                card.dataset.rating = ratingSelect.value;
                showToast("Отзыв обновлён!", "success");
              }
            });
        });

        // Отмена
        cancelBtn.addEventListener("click", (e) => {
          e.preventDefault();
          const origCommentElem = document.createElement("p");
          origCommentElem.className = "review-card__comment";
          origCommentElem.textContent = originalComment;
          textarea.replaceWith(origCommentElem);

          const origRatingElem = document.createElement("span");
          origRatingElem.className = "review-card__rating";
          origRatingElem.dataset.rating = originalRating;
          origRatingElem.textContent = `★ ${originalRating}`;
          ratingSelect.replaceWith(origRatingElem);

          saveBtn.remove();
          cancelBtn.remove();
          editBtn.style.display = "";
        });

        return;
      }

      // --- Модалка для "Выйти из аккаунта" ---
      const logoutBtn = e.target.closest(".profile__logout");
      if (logoutBtn) {
        e.preventDefault();
        showConfirmModal({
          text: "Вы действительно хотите выйти из аккаунта?",
          yesText: "Выйти",
          noText: "Отмена",
          onConfirm: () => {
            window.location.href = "/logout.php";
          },
        });
        return;
      }
    });
  }
});

// ==== Всплывающее уведомление ====
function showToast(message, type = "success") {
  const toast = document.createElement("div");
  toast.className = `toast toast--${type}`;
  toast.textContent = message;
  document.body.appendChild(toast);

  setTimeout(() => toast.classList.add("visible"), 100);
  setTimeout(() => {
    toast.classList.remove("visible");
    setTimeout(() => toast.remove(), 300);
  }, 4000);
}

// ==== Универсальное модальное окно подтверждения ====
function showConfirmModal({
  text,
  yesText = "Удалить",
  noText = "Отмена",
  onConfirm,
}) {
  const exist = document.getElementById("confirm-modal");
  if (exist) exist.remove();

  const modal = document.createElement("div");
  modal.id = "confirm-modal";
  modal.innerHTML = `
    <div class="confirm-modal__overlay"></div>
    <div class="confirm-modal__content">
      <div class="confirm-modal__text">${text}</div>
      <div class="confirm-modal__actions">
        <button class="confirm-modal__btn confirm-modal__btn--yes">${yesText}</button>
        <button class="confirm-modal__btn confirm-modal__btn--no">${noText}</button>
      </div>
    </div>
  `;
  document.body.appendChild(modal);

  modal
    .querySelector(".confirm-modal__btn--yes")
    .addEventListener("click", () => {
      if (onConfirm) onConfirm();
      modal.remove();
    });
  modal
    .querySelector(".confirm-modal__btn--no")
    .addEventListener("click", () => {
      modal.remove();
    });
  modal
    .querySelector(".confirm-modal__overlay")
    .addEventListener("click", () => {
      modal.remove();
    });
}
