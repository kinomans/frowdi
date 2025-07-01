// Получаем элементы модального окна
const authModal = document.getElementById("auth-modal");
const openLoginBtn = document.getElementById("open-login");
const closeModalBtn = document.getElementById("close-modal");
const loginFormBlock = document.getElementById("login-form");
const registerFormBlock = document.getElementById("register-form");
const successFormBlock = document.getElementById("success-form");
const toRegister = document.getElementById("to-register");
const toLogin = document.getElementById("to-login");
const successLoginBtn = document.getElementById("success-login-btn");

// Открытие модального окна
if (openLoginBtn && authModal) {
  openLoginBtn.addEventListener("click", () => {
    authModal.style.display = "flex";
    showAuthForm("login");
  });
}

// Закрытие модального окна
if (closeModalBtn && authModal) {
  closeModalBtn.addEventListener("click", () => {
    authModal.style.display = "none";
  });
}

// Закрытие при клике вне модального окна
if (authModal) {
  window.addEventListener("click", (e) => {
    if (e.target === authModal) {
      authModal.style.display = "none";
    }
  });
}

// Переключение между формами
if (toRegister) {
  toRegister.addEventListener("click", () => {
    showAuthForm("register");
  });
}

if (toLogin) {
  toLogin.addEventListener("click", () => {
    showAuthForm("login");
  });
}

if (successLoginBtn) {
  successLoginBtn.addEventListener("click", () => {
    showAuthForm("login");
  });
}

// Функция для переключения между формами
function showAuthForm(form) {
  if (!loginFormBlock || !registerFormBlock || !successFormBlock) return;
  loginFormBlock.classList.remove("active");
  registerFormBlock.classList.remove("active");
  successFormBlock.classList.remove("active");

  if (form === "login") loginFormBlock.classList.add("active");
  if (form === "register") registerFormBlock.classList.add("active");
  if (form === "success") successFormBlock.classList.add("active");
}

// ===== Валидация формы регистрации =====
const registerForm = document.getElementById("registerForm");
if (registerForm) {
  registerForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    let valid = true;

    // Очистка ошибок
    registerForm.querySelectorAll(".auth-input-group").forEach((group) => {
      group.classList.remove("error");
      group.querySelector(".auth-error-message").textContent = "";
    });

    const email = registerForm.email;
    const name = registerForm.name;
    const surname = registerForm.surname;
    const password = registerForm.password;
    const confirmPassword = registerForm.confirm_password;

    if (!email.value.trim()) {
      showAuthError(email, "Заполните это поле");
      valid = false;
    }

    if (!name.value.trim()) {
      showAuthError(name, "Заполните это поле");
      valid = false;
    } else if (!/^[А-Яа-яЁё\s]+$/.test(name.value)) {
      showAuthError(name, "Только кириллица");
      valid = false;
    }

    if (!surname.value.trim()) {
      showAuthError(surname, "Заполните это поле");
      valid = false;
    } else if (!/^[А-Яа-яЁё\s]+$/.test(surname.value)) {
      showAuthError(surname, "Только кириллица");
      valid = false;
    }

    if (!password.value.trim()) {
      showAuthError(password, "Заполните это поле");
      valid = false;
    }

    if (password.value !== confirmPassword.value) {
      showAuthError(confirmPassword, "Пароли не совпадают");
      valid = false;
    }

    if (valid) {
      // Собираем данные формы
      const formData = new FormData(registerForm);

      try {
        const res = await fetch("/register.php", {
          method: "POST",
          body: formData,
        });

        const text = await res.text();

        if (text.trim() === "OK") {
          showAuthForm("success");
          registerForm.reset(); // очистка формы
        } else {
          alert("Ошибка регистрации: " + text);
        }
      } catch (error) {
        console.error("Ошибка отправки:", error);
        alert("Произошла ошибка регистрации.");
      }
    }
  });
}

// ===== Отображение ошибки =====
function showAuthError(input, message = "") {
  const group = input.parentElement;
  group.classList.add("error");
  const errorEl = group.querySelector(".auth-error-message");
  if (errorEl) {
    errorEl.textContent = message;
  }
}

// ===== Валидация и отправка формы входа через fetch =====
const loginForm = document.getElementById("loginForm");
if (loginForm) {
  loginForm.addEventListener("submit", async (e) => {
    e.preventDefault();

    // Очистка ошибок
    loginForm.querySelectorAll(".auth-input-group").forEach((group) => {
      group.classList.remove("error");
      group.querySelector(".auth-error-message").textContent = "";
    });

    const email = loginForm.email;
    const password = loginForm.password;

    let hasError = false;

    if (!email.value.trim()) {
      showAuthError(email, "Заполните это поле");
      hasError = true;
    }

    if (!password.value.trim()) {
      showAuthError(password, "Заполните это поле");
      hasError = true;
    }

    if (hasError) return;

    try {
      const response = await fetch("/login.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: new URLSearchParams({
          email: email.value.trim(),
          password: password.value.trim(),
        }),
      });

      const result = await response.json();

      if (!result.success) {
        showAuthError(email);
        showAuthError(password, "Неверный email или пароль");
      } else {
        // ⬇️ Перенаправляем в админку, если сервер вернул такой путь
        window.location.href = result.redirect || "/pages/home.php";
      }
    } catch (err) {
      console.error("Ошибка входа:", err);
    }
  });
}

// Кнопка добавить в избранное
document.addEventListener("click", async (e) => {
  const target = e.target;
  if (target.classList && target.classList.contains("favorite-btn")) {
    const btn = target;
    const movieId = btn.dataset.id;

    try {
      const res = await fetch("/api/favorite-toggle.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ movie_id: movieId }),
      });

      const data = await res.json();

      if (data.success) {
        btn.textContent = data.added
          ? "✓ В избранном"
          : "❤ Добавить в избранное";
        btn.classList.toggle("added", data.added);
      } else {
        alert(data.message || "Ошибка");
      }
    } catch (err) {
      console.error("Ошибка запроса:", err);
      alert("Не удалось обновить избранное");
    }
  }
});

// Параллакс
window.addEventListener("scroll", () => {
  const banner = document.querySelector(".random-movie-banner__background img");
  if (banner) {
    const offset = window.scrollY;
    banner.style.transform = `translateY(${offset * 0.3}px)`;
  }
});
