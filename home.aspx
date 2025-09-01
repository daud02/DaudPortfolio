<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Daud Sharif — Portfolio</title>
  <meta name="description" content="Portfolio of Daud Sharif: projects, skills, and contact information." />
  <!-- TODO: Update description, social links, and contact email. -->
  <link rel="stylesheet" href="styles.css" />
</head>
<body>
  <a class="skip-link" href="#main">Skip to content</a>

  <header id="top" role="banner">
    <nav aria-label="Primary">
      <a href="#top" class="logo" aria-label="Home">DS</a>
      <button class="nav-toggle" aria-expanded="false" aria-controls="site-nav">Menu</button>
      <ul id="site-nav" class="nav-list">
        <li><a href="#about">About</a></li>
        <li><a href="#skills">Skills</a></li>
        <li><a href="#projects">Projects</a></li>
        <li><a href="#contact">Contact</a></li>
      </ul>
    </nav>

    <section class="hero" aria-label="Intro">
      <h1>Hi, I'm <span class="accent">Mohammad Abu Daud Sharif</span>.</h1>
      <p class="tagline">Undergraduate CSE student and Competitive Programmer.</p>
      <p>
        <a href="#projects" class="btn">See my work</a>
        <a href="#contact" class="btn outline">Contact me</a>
      </p>
    </section>
  </header>

  <main id="main" tabindex="-1">
    <section id="about" aria-labelledby="about-heading">
      <h2 id="about-heading">About</h2>
      <p>
        I am a 3rd year student of KUET CSE. Besides i am a competitve programmer. Purple colored coder in codeforces.com
      </p>
      <ul class="quickfacts">
        <li><strong>Location:</strong> Amar Ekuhey Hall, KUET, Bangladesh.</li>
        <li><strong>Focus:</strong> Competitive programming, Research paper, Higher study, Prestigious job.</li>
        <li><strong>Email:</strong> <a href="">mdsharif.abudaud@gmail.com</a></li>
      </ul>
    </section>

    <section id="skills" aria-labelledby="skills-heading">
      <h2 id="skills-heading">Skills</h2>
      <ul class="skill-list">
        <li><strong>Languages:</strong> C, C++, Java, HTML, CSS, Javascript, PHP, AST.NET</li>
        <li><strong>Co curriculum:  </strong> Competitive Programming</li>
      </ul>
    </section>

    <section id="projects" aria-labelledby="projects-heading">
      <h2 id="projects-heading">Projects</h2>

      <article class="project-card">
        <header>
          <h3>Amar Ekushey Hall Management</h3>
          <p class="meta">ASP.NET Core • SQL Server</p>
        </header>
        <p>
          A hall management system for KUET with features like room allocation, dues tracking, and admin dashboards.
        </p>
        <p class="links">
          <a href="#" class="btn small" aria-label="Live demo for Amar Ekushey Hall Management (opens in new tab)" target="_blank" rel="noopener">Live</a>
          <a href="#" class="btn small outline" aria-label="Source code for Amar Ekushey Hall Management (opens in new tab)" target="_blank" rel="noopener">Source</a>
        </p>
      </article>

      <article class="project-card">
        <header>
          <h3>Portfolio Website</h3>
          <p class="meta">HTML • CSS • JS</p>
        </header>
        <p>
          This website! Clean semantics first, styling and interactivity added step‑by‑step.
        </p>
        <p class="links">
          <a href="#" class="btn small" target="_blank" rel="noopener">Live</a>
          <a href="#" class="btn small outline" target="_blank" rel="noopener">Source</a>
        </p>
      </article>

    </section>

    <section id="contact" aria-labelledby="contact-heading">
      <h2 id="contact-heading">Contact</h2>
      <p>
        The form below will be wired up later with ASP.NET. For now, it’s static HTML.
      </p>
      <form aria-label="Contact form" method="post" action="#">
        <div class="field">
          <label for="name">Name</label>
          <input id="name" name="name" type="text" required />
        </div>
        <div class="field">
          <label for="email">Email</label>
          <input id="email" name="email" type="email" required />
        </div>
        <div class="field">
          <label for="message">Message</label>
          <textarea id="message" name="message" rows="5" required></textarea>
        </div>
        <button type="submit" class="btn">Send</button>
      </form>
    </section>
  </main>

  <footer>
    <p>© <span id="year"></span> Daud Sharif. All rights reserved.</p>
    <ul class="social">
      <li><a href="#" aria-label="GitHub">GitHub</a></li>
      <li><a href="#" aria-label="LinkedIn">LinkedIn</a></li>
      <li><a href="#" aria-label="Twitter">Twitter</a></li>
    </ul>
  </footer>

  <!-- Minimal inline JS for progressive enhancement; full JS will be added later -->
  <script>
    // Set current year
    document.getElementById('year').textContent = new Date().getFullYear();

    // Simple mobile menu toggle; will be styled with CSS later
    const toggle = document.querySelector('.nav-toggle');
    const menu = document.getElementById('site-nav');
    if (toggle && menu) {
      menu.hidden = true;
      toggle.addEventListener('click', () => {
        const expanded = toggle.getAttribute('aria-expanded') === 'true';
        toggle.setAttribute('aria-expanded', String(!expanded));
        menu.hidden = expanded;
      });
    }
  </script>
</body>
</html>
