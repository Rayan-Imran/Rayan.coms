<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Portfolio</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Orbitron', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #e0e0e0;
            background: #0a0a0a;
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
            color: #4a9eff;
        }

        .header h1 {
            font-size: 3em;
            margin-bottom: 10px;
            font-weight: 900;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .header p {
            font-size: 1.1em;
            opacity: 0.8;
            font-weight: 400;
            color: #7bb3ff;
            letter-spacing: 1px;
        }

        .nav-container {
            background: #1a1a1a;
            border: 1px solid #333;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .nav-tabs {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 30px;
        }

        .nav-tab {
            padding: 12px 24px;
            background: #2a2a2a;
            border: 1px solid #444;
            border-radius: 6px;
            color: #e0e0e0;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 700;
            font-size: 14px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .nav-tab:hover {
            background: #333;
            border-color: #4a9eff;
            color: #4a9eff;
        }

        .nav-tab.active {
            background: #4a9eff;
            color: #000;
            border-color: #4a9eff;
        }

        .content-area {
            background: #1a1a1a;
            border: 1px solid #333;
            border-radius: 8px;
            padding: 40px;
            min-height: 500px;
        }

        .tab-content {
            display: none;
            animation: fadeIn 0.5s ease-in;
        }

        .tab-content.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .hero-section {
            text-align: center;
            padding: 40px 0;
        }

        .hero-section h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #4a9eff;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .hero-section p {
            font-size: 1.2em;
            margin-bottom: 30px;
            color: #b0b0b0;
            font-weight: 400;
            letter-spacing: 0.5px;
        }

        .skills-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .skill-card {
            background: #2a2a2a;
            border: 1px solid #444;
            color: #e0e0e0;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .skill-card:hover {
            border-color: #4a9eff;
            background: #333;
        }

        .skill-card h3 {
            color: #4a9eff;
            margin-bottom: 15px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .project-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }

        .project-card {
            background: #2a2a2a;
            border: 1px solid #444;
            border-radius: 8px;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .project-card:hover {
            border-color: #4a9eff;
            background: #333;
        }

        .project-card h3 {
            color: #4a9eff;
            margin-bottom: 15px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .project-card p {
            color: #b0b0b0;
            margin-bottom: 10px;
        }

        .contact-form {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 400;
            color: #4a9eff;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #444;
            border-radius: 6px;
            font-size: 16px;
            background: #2a2a2a;
            color: #e0e0e0;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #4a9eff;
        }

        .submit-btn {
            background: #4a9eff;
            color: #000;
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            background: #2080ff;
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .social-link {
            padding: 10px 20px;
            background: #2a2a2a;
            border: 1px solid #4a9eff;
            color: #4a9eff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: all 0.3s ease;
        }

        .social-link:hover {
            background: #4a9eff;
            color: #000;
        }

        @media (max-width: 768px) {
            .nav-tabs {
                flex-direction: column;
                align-items: center;
            }

            .nav-tab {
                width: 200px;
            }

            .header h1 {
                font-size: 2em;
            }

            .content-area {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>My Portfolio</h1>
            <p>Welcome to my digital showcase</p>
        </div>

        <div class="nav-container">
            <div class="nav-tabs">
                <button class="nav-tab active" onclick="showTab('home')">Home</button>
                <button class="nav-tab" onclick="showTab('vex')">VEX Robotics</button>
                <button class="nav-tab" onclick="showTab('projects')">Personal Projects</button>
                <button class="nav-tab" onclick="showTab('reffing')">Reffing</button>
                <button class="nav-tab" onclick="showTab('contact')">Contact Me</button>
            </div>

            <div class="content-area">
                <!-- Home Tab -->
                <div id="home" class="tab-content active">
                    <div class="hero-section">
                        <h2>Welcome to My Portfolio</h2>
                        <p>I am an aspiring mechanical engineer that has many years of experience in VEX robotics, microcontrollers like Arduinos and ESP32's, as well as programming languages like C++, Java, Python, and HTML</p>
                    </div>
                    
                    <div class="skills-grid">
                        <div class="skill-card">
                            <h3>Robotics</h3>
                            <p>VEX Robotics Competition experience with design and programming</p>
                        </div>
                        <div class="skill-card">
                            <h3>Programming</h3>
                            <p>C++, Python, HTML/CSS, JavaScript</p>
                        </div>
                        <div class="skill-card">
                            <h3>Design</h3>
                            <p>CAD modeling, mechanical design, and problem-solving</p>
                        </div>
                        <div class="skill-card">
                            <h3>Leadership</h3>
                            <p>Team management, project coordination, and mentoring</p>
                        </div>
                    </div>
                </div>

                <!-- VEX Robotics Tab -->
                    <div id="vex" class="tab-content">
                    <h2 style="color: #4a9eff; font-weight: 700; margin-bottom: 20px; letter-spacing: 2px; text-transform: uppercase;">VEX Robotics Experience</h2>
                    <p style="color: #b0b0b0; font-weight: 400; letter-spacing: 0.5px;">My journey in VEX Robotics has been filled with exciting challenges, innovative solutions, and memorable competitions.</p>
                    
                    <div class="project-grid">
                        <div class="project-card">
                            <h3>Competition Robot 2024</h3>
                            <p>Designed and built a competitive robot for the current VEX season. Features advanced autonomous programming and precision engineering.</p>
                            <p><strong>Achievements:</strong> Regional finalist, Excellence Award</p>
                        </div>
                        <div class="project-card">
                            <h3>Team Leadership</h3>
                            <p>Led a team of 8 students, coordinating design meetings, build sessions, and competition strategy.</p>
                            <p><strong>Skills:</strong> Project management, mentoring, strategic planning</p>
                        </div>
                        <div class="project-card">
                            <h3>Programming Expertise</h3>
                            <p>Developed autonomous routines and driver control systems using VEXcode Pro and advanced sensor integration.</p>
                            <p><strong>Technologies:</strong> C++, PID control, sensor fusion</p>
                        </div>
                    </div>
                </div>

                <!-- Personal Projects Tab -->
                <div id="projects" class="tab-content">
                    <h2 style="color: #4a9eff; font-weight: 700; margin-bottom: 20px; letter-spacing: 2px; text-transform: uppercase;">Personal Projects</h2>
                    <p style="color: #b0b0b0; font-weight: 400; letter-spacing: 0.5px;">Here are some of the projects I've worked on outside of school and competitions.</p>
                    
                    <div class="project-grid">
                        <div class="project-card">
                            <h3>Arduino Weather Station</h3>
                            <p>Built a complete weather monitoring system using Arduino, sensors, and LCD display. Features temperature, humidity, and pressure readings.</p>
                            <p><strong>Tech Stack:</strong> Arduino, C++, LCD display, DHT22 sensor</p>
                        </div>
                        <div class="project-card">
                            <h3>Mobile App Development</h3>
                            <p>Created a task management app for students with features like assignment tracking, deadline reminders, and grade calculation.</p>
                            <p><strong>Tech Stack:</strong> React Native, JavaScript, Firebase</p>
                        </div>
                        <div class="project-card">
                            <h3>3D Printing Projects</h3>
                            <p>Designed and printed custom parts for various projects, including robot components and household items.</p>
                            <p><strong>Skills:</strong> CAD design, 3D printing, rapid prototyping</p>
                        </div>
                        <div class="project-card">
                            <h3>Web Development</h3>
                            <p>Built responsive websites for local businesses and personal projects using modern web technologies.</p>
                            <p><strong>Tech Stack:</strong> HTML, CSS, JavaScript, React</p>
                        </div>
                    </div>
                </div>

                <!-- Reffing Tab -->
                <div id="reffing" class="tab-content">
                    <h2 style="color: #4a9eff; font-weight: 700; margin-bottom: 20px; letter-spacing: 2px; text-transform: uppercase;">Reffing Experience</h2>
                    <p style="color: #b0b0b0; font-weight: 400; letter-spacing: 0.5px;">My experience as a referee has taught me valuable skills in leadership, decision-making, and fair play.</p>
                    
                    <div class="project-grid">
                        <div class="project-card">
                            <h3>VEX Robotics Referee</h3>
                            <p>Certified referee for VEX Robotics competitions. Ensure fair play and accurate scoring during matches.</p>
                            <p><strong>Events:</strong> Regional tournaments, state championships</p>
                        </div>
                        <div class="project-card">
                            <h3>Youth Sports Official</h3>
                            <p>Referee for local youth soccer and basketball leagues. Manage games for ages 8-16.</p>
                            <p><strong>Skills:</strong> Conflict resolution, quick decision-making, communication</p>
                        </div>
                        <div class="project-card">
                            <h3>Training & Certification</h3>
                            <p>Completed official training programs and maintain current certifications in multiple sports.</p>
                            <p><strong>Certifications:</strong> USSF Soccer, NFHS Basketball, VEX Robotics</p>
                        </div>
                    </div>
                </div>

                <!-- Contact Tab -->
                <div id="contact" class="tab-content">
                    <h2 style="color: #4a9eff; font-weight: 700; margin-bottom: 20px; letter-spacing: 2px; text-transform: uppercase;">Contact Me</h2>
                    <p style="color: #b0b0b0; font-weight: 400; letter-spacing: 0.5px;">I'd love to hear from you! Whether you have questions about my projects or want to collaborate, feel free to reach out.</p>
                    
                    <form class="contact-form">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="subject">Subject:</label>
                            <input type="text" id="subject" name="subject" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Message:</label>
                            <textarea id="message" name="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="submit-btn">Send Message</button>
                    </form>

                    <div class="social-links">
                        <a href="#" class="social-link">LinkedIn</a>
                        <a href="#" class="social-link">GitHub</a>
                        <a href="#" class="social-link">Email</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showTab(tabName) {
            // Hide all tab contents
            const allTabs = document.querySelectorAll('.tab-content');
            allTabs.forEach(tab => {
                tab.classList.remove('active');
            });

            // Remove active class from all nav tabs
            const allNavTabs = document.querySelectorAll('.nav-tab');
            allNavTabs.forEach(tab => {
                tab.classList.remove('active');
            });

            // Show selected tab content
            document.getElementById(tabName).classList.add('active');

            // Add active class to clicked nav tab
            event.target.classList.add('active');
        }

        // Handle form submission
        document.querySelector('.contact-form').addEventListener('submit', function(e) {
            e.preventDefault();
            alert('Thank you for your message! I\'ll get back to you soon.');
            this.reset();
        });

        // Add smooth scrolling and hover effects
        document.querySelectorAll('.nav-tab').forEach(tab => {
            tab.addEventListener('click', function() {
                // Add a subtle animation effect
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 100);
            });
        });
    </script>
</body>
</html>
