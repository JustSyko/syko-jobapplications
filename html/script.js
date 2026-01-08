let selectedJob = null;

// Initially hide all menus
document.getElementById("job-selection").style.display = "none";
document.getElementById("menu").style.display = "none";
document.getElementById("confirmation").style.display = "none";

// =========================
// NUI Event Listener
// Handles messages from the Lua side
// =========================
window.addEventListener('message', (event) => {
    const data = event.data;

    // Show the Job Selector screen
    if (data.action === "showJobSelector") {
        document.getElementById("job-selection").style.display = "block";
        document.getElementById("menu").style.display = "none";
        document.getElementById("confirmation").style.display = "none";

        const container = document.getElementById("job-buttons-container");
        container.innerHTML = "";

        // Create a button for each available job
        Object.keys(data.jobs).forEach(job => {
            const button = document.createElement("button");
            button.innerText = job;
            button.className = "job-button";

            button.addEventListener("click", () => {
                selectedJob = job;
                fetch(`https://${GetParentResourceName()}/selectJob`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=UTF-8" },
                    body: JSON.stringify({ job })
                });
            });

            container.appendChild(button);
        });
    }

    // Show the Questions/Application screen
    if (data.action === "showQuestions") {
        document.getElementById("job-selection").style.display = "none";
        document.getElementById("menu").style.display = "block";
        document.getElementById("confirmation").style.display = "none";

        const container = document.getElementById("sections-container");
        container.innerHTML = "";

        // Create a section for each question
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

        // Add Submit button
        const submitButton = document.createElement("button");
        submitButton.innerText = "Submit";
        submitButton.className = "submit-button";

        submitButton.addEventListener("click", () => {
            const inputs = document.querySelectorAll('textarea');
            const values = Array.from(inputs).map(input => input.value);
            const message = values.map((val, i) => `**Q${i + 1}:** ${val}`).join("\n");

            fetch(`https://${GetParentResourceName()}/sendToDiscord`, {
                method: "POST",
                headers: { "Content-Type": "application/json; charset=UTF-8" },
                body: JSON.stringify({ message, job: selectedJob })
            });

            // Hide menu and show confirmation
            document.getElementById("menu").style.display = "none";
            document.getElementById("confirmation").style.display = "block";
        });

        container.appendChild(submitButton);
    }

    // Hide all menus
    if (data.action === "hide") {
        document.getElementById("menu").style.display = "none";
        document.getElementById("job-selection").style.display = "none";
        document.getElementById("confirmation").style.display = "none";
    }
});

// =========================
// Button Event Listeners
// =========================

// Close Job Selector
document.getElementById("job-close-btn").addEventListener("click", () => {
    document.getElementById("job-selection").style.display = "none";
    fetch(`https://${GetParentResourceName()}/focusOff`, { method: 'POST' });
});

// Back button on Job Application returns to job selector
document.getElementById("job-back-btn").addEventListener("click", () => {
    document.getElementById("menu").style.display = "none";
    document.getElementById("job-selection").style.display = "block";
});

// Close button on Job Application
document.getElementById("application-close-btn").addEventListener("click", () => {
    document.getElementById("menu").style.display = "none";
    fetch(`https://${GetParentResourceName()}/focusOff`, { method: 'POST' });
});

// Close button on Confirmation screen
document.getElementById("confirm-close-btn").addEventListener("click", () => {
    document.getElementById("confirmation").style.display = "none";
    fetch(`https://${GetParentResourceName()}/focusOff`, { method: 'POST' });
});
