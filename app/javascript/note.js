// app/javascript/packs/notes.js

document.addEventListener("DOMContentLoaded", () => {
  const summaryContainers = document.querySelectorAll(".summary-container");

  summaryContainers.forEach((container) => {
    const generateSummaryBtn = container.querySelector(".generate-summary-btn");
    const summaryId = container.querySelector('[id^="summary-"]').id;
    const noteId = generateSummaryBtn.dataset.noteId;

    generateSummaryBtn.addEventListener("click", () => {
      fetch(`/notes/${noteId}/summarize.js`)
        .then((response) => response.text())
        .then((data) => {
          const summaryElement = document.getElementById(summaryId);
          summaryElement.innerHTML = data;
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    });
  });
});
