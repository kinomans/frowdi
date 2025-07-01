const input = document.getElementById("search");
const resultsBox = document.createElement("div");
resultsBox.className = "search-suggestions";
document.body.appendChild(resultsBox);

input.addEventListener("input", () => {
  const query = input.value.trim();

  if (query.length >= 1) {
    fetch(`/api/search.php?q=${encodeURIComponent(query)}`)
      .then((res) => res.json())
      .then((data) => {
        resultsBox.innerHTML = "";
        const rect = input.getBoundingClientRect();
        resultsBox.style.left = rect.left + "px";
        resultsBox.style.top = rect.bottom + window.scrollY + "px";
        resultsBox.style.width = rect.width + "px";

        if (data.length === 0) {
          const emptyMsg = document.createElement("div");
          emptyMsg.className = "search-suggestion search-suggestion--empty";
          emptyMsg.textContent = "Фильмы не найдены";
          resultsBox.appendChild(emptyMsg);
        } else {
          data.forEach((movie) => {
            const item = document.createElement("a");
            item.href = `/pages/movie.php?id=${movie.id}`;
            item.className = "search-suggestion";

            item.innerHTML = `
              <img src="${movie.poster_url}" alt="${movie.title}">
              <div class="suggestion-content">
                <div class="suggestion-meta">
                  <span class="suggestion-rating">★ ${
                    Number(movie.rating) ? Number(movie.rating).toFixed(1) : "—"
                  }</span>
                  <span>${movie.year || "—"}</span>
                  <span>${movie.genre || "—"}</span>
                  <span>${movie.duration || "—"}</span>
                </div>
                <div class="suggestion-title">${movie.title}</div>
              </div>
            `;

            resultsBox.appendChild(item);
          });
        }

        resultsBox.style.display = "block";
      });
  } else {
    resultsBox.style.display = "none";
  }
});

document.addEventListener("click", (e) => {
  if (!resultsBox.contains(e.target) && e.target !== input) {
    resultsBox.style.display = "none";
  }
});
