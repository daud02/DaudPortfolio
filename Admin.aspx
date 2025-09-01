<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Panel — Portfolio</title>
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <header>
    <nav>
      <a href="index.html" class="logo">DS</a>
      <ul class="nav-list">
        <li><a href="index.html">Back to Portfolio</a></li>
      </ul>
    </nav>
  </header>

  <main id="main" tabindex="-1">
    <section id="admin-panel">
      <h1>Admin Panel</h1>
      <p></p>

      <!-- Add new Skill -->
      <form id="add-skill-form" class="admin-form">
        <h2>Add a New Skill</h2>
        <div class="field">
          <label for="skill-name">Skill Name</label>
          <input id="skill-name" name="skill-name" type="text" required />
        </div>
        <div class="field">
          <label for="skill-category">Category</label>
          <select id="skill-category" name="skill-category">
            <option>Languages</option>
            <option>co curriculumn</option>
          </select>
        </div>
        <button type="submit" class="btn">Add Skill</button>
      </form>

      <!-- Update Skills -->
      <form id="update-skill-form" class="admin-form">
        <h2>Update Existing Skills</h2>
        <div class="field">
          <label for="old-skill">Select Skill</label>
          <select id="old-skill" name="old-skill">
            <option>C++</option>
            <option>Java</option>
            <option>HTML</option>
            <option>CSS</option>
            <!-- Later: Load dynamically from DB -->
          </select>
        </div>
        <div class="field">
          <label for="new-skill">New Skill Name</label>
          <input id="new-skill" name="new-skill" type="text" required />
        </div>
        <button type="submit" class="btn outline">Update Skill</button>
      </form>
    </section>
  </main>

  <footer>
    <p>© <span id="year"></span> Daud Sharif — Admin Panel</p>
  </footer>

  <script>
    // Year update
    document.getElementById('year').textContent = new Date().getFullYear();

    // For now, just show alerts on form submit
    document.getElementById('add-skill-form').addEventListener('submit', e => {
      e.preventDefault();
      const skill = document.getElementById('skill-name').value;
      alert(`Skill "${skill}" added (static demo, will be saved with ASP.NET later).`);
    });

    document.getElementById('update-skill-form').addEventListener('submit', e => {
      e.preventDefault();
      const oldSkill = document.getElementById('old-skill').value;
      const newSkill = document.getElementById('new-skill').value;
      alert(`Skill "${oldSkill}" updated to "${newSkill}" (static demo).`);
    });
  </script>
</body>
</html>
