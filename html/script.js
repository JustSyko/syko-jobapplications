let selectedJob = null;

window.addEventListener('message', (event) => {
  const data = event.data;

  if (data.action === "showJobSelector") {
    document.getElementById("job-selection").style.display = "block";
    document.getElementById("menu").style.display = "none";
    document.getElementById("confirmation").style.display = "none";

    const container = document.getElementById("job-buttons-container");
    container.innerHTML = "";

    Object.keys(data.jobs).forEach(job => {
      const button = document.createElement("button");
      button.innerText = job;
      button.className = "job-button";
      button.addEventListener("click", () => {
        selectedJob = job;
        fetch(`https://${GetParentResourceName()}/selectJob`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
          },
          body: JSON.stringify({ job })
        });
      });
      container.appendChild(button);
    });
  }

  if (data.action === "showQuestions") {
    document.getElementById("job-selection").style.display = "none";
    document.getElementById("menu").style.display = "block";
    document.getElementById("confirmation").style.display = "none";

    const container = document.getElementById("sections-container");
    container.innerHTML = "";

    data.questions.forEach((q, i) => {
      const section = document.createElement("div");
      section.className = "section";

      const label = document.createElement("label");
      label.innerText = q;

      const input = document.createElement("textarea");
      input.rows = 4;
      input.placeholder = 'Type answer here...';

      section.appendChild(label);
      section.appendChild(input);
      container.appendChild(section);
    });

    const submitButton = document.createElement("button");
    submitButton.innerText = "Submit";
    submitButton.className = "submit-button";

    submitButton.addEventListener("click", () => {
      const inputs = document.querySelectorAll('textarea');
      const values = Array.from(inputs).map(input => input.value);
      const message = values.map((val, i) => `**Q${i + 1}:** ${val}`).join("\n");

      fetch(`https://${GetParentResourceName()}/sendToDiscord`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify({ message, job: selectedJob })
      });

      document.getElementById("menu").style.display = "none";
      document.getElementById("confirmation").style.display = "block";
    });

    container.appendChild(submitButton);
  }

  if (data.action === "hide") {
    document.getElementById("menu").style.display = "none";
    document.getElementById("job-selection").style.display = "none";
    document.getElementById("confirmation").style.display = "none";
  }
});

// Listener for the close button on the questions UI
document.getElementById("application-close-btn").addEventListener("click", () => {
  document.getElementById("menu").style.display = "none";
  fetch(`https://${GetParentResourceName()}/focusOff`, {
    method: 'POST',
  });
});

// Listener for the close button on the confirmation screen
document.getElementById("confirm-close-btn").addEventListener("click", () => {
  document.getElementById("confirmation").style.display = "none";
  fetch(`https://${GetParentResourceName()}/focusOff`, {
    method: 'POST',
  });
});

document.getElementById("job-selection").style.display = "none";
document.getElementById("menu").style.display = "none";
document.getElementById("confirmation").style.display = "none";