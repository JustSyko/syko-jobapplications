# syko-jobapplications

**syko-jobapplications** is a lightweight, fully customizable **job application UI system** for [FiveM](https://fivem.net/) servers using the **QBCore** framework. It allows players to apply for jobs through an interactive menu, and automatically sends the application data to a discord webhook for review.

## 🔧 Features

- 📋 Simple, modern UI built with HTML, CSS, and JavaScript
- ✅ Submit job applications in-game via NUI
- 💼 Fully customizable job list and application questions
- 📤 Supports sending submissions to Discord via webhook
- 🎯 Job-restricted menus (only show jobs available to specific users if needed)
- 🧠 Cleanly structured and easy to expand

## 📦 Requirements

- **QBCore Framework**
- **A working NUI setup** in your server
- Optional: A Discord webhook if you want to receive applications in a Discord channel

## 🚀 Installation

1. **Download or clone this repo:**

   ```bash
   git clone https://github.com/JustSyko/syko-jobapplications.git
   ```

2. **Add it to your `resources` folder.**

3. **Start the resource in your `server.cfg`:**

   ```cfg
   ensure syko-jobapplications
   ```

4. **(Optional) Configure jobs and questions:**
   - Open the JavaScript or config section (depending on how you’ve set it up) to define:
     - Available jobs
     - Questions per job
     - Discord webhook URL (if used)

5. **Use a command, event, or proximity interaction to trigger the NUI.**

## 🖥️ How It Works

- Players interact with the UI (usually via a command or interaction zone).
- They choose a job, fill out the form, and submit it.
- The application is POSTed to the client and/or server.
- Submissions can be sent to Discord or logged for staff review.

## 🧠 Customization

- **Edit `index.html`, `style.css`, and `script.js`** for UI changes
- Adjust job logic and data structure in the script to fit your server's jobs
- Easily add job requirements or conditions in the NUI logic

## 📬 Contact / Help

If you run into issues, feel free to open an [issue](https://github.com/JustSyko/syko-jobapplications/issues) or fork the project.

---

> Made with ❤️ for the FiveM community.  
> Tested on QBCore, 2025 version.
