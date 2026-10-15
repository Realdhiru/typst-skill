// ==========================================
// EXAMPLE PROFILE TEMPLATE (PUBLIC SAFE)
// ==========================================
// Copy this file to `profile.typ` and add your real personal details.

#let candidate = (
  name: "Jane Doe",
  location: "San Francisco, CA",
  phone: "+1 (555) 019-2834",
  email: "jane.doe\@example.com",
  github: "github.com/janedoe",
  github_url: "https://github.com/janedoe",
  linkedin: "linkedin.com/in/janedoe",
  linkedin_url: "https://linkedin.com/in/janedoe",
)

#let summary = [
  Systems & Cloud Software Developer specializing in Linux environments, container orchestration, and high-throughput distributed systems. Open-source contributor experienced with Python, C/C++, AWS, Kubernetes, and Terraform.
]

#let projects = (
  (
    title: "DISTRIBUTED RATE LIMITER",
    url: "https://github.com/example/rate-limiter",
    subtitle: "– High-Throughput Token Bucket Engine (AWS, Go, DynamoDB)",
    date: "2026",
    bullets: (
      [Engineered a high-throughput, cloud-native distributed rate limiter implementing the Token Bucket algorithm with zero race conditions using atomic conditional writes.],
      [Architected serverless request evaluation via API Gateway and Lambda functions, keeping latency under 15ms.],
    ),
  ),
)

#let experience = (
  (
    company: "Acme Cloud Corp",
    role: "Software Engineering Intern",
    date: "Jun 2026 – Aug 2026",
    bullets: (
      [Built automated infrastructure pipelines using Terraform and GitHub Actions, reducing deployment time by 35%.],
      [Configured observability dashboards in Prometheus and Grafana for critical production microservices.],
    ),
  ),
)

#let community = (
  (
    organization: "Open Source Collective",
    url: "https://github.com/example",
    role: "Core Contributor",
    date: "2025 – Present",
    bullets: (
      [Maintained Linux packaging derivations, reviewed community PRs, and resolved upstream systemd service bugs.],
    ),
  ),
)

#let technical_skills = (
  ("Languages:", "Python, C/C++, Go, Bash/Shell, SQL, TypeScript"),
  ("Systems & OS:", "Linux Kernel, Systemd, D-Bus, PipeWire, POSIX APIs"),
  ("Cloud & DevOps:", "AWS (EC2, Lambda, DynamoDB), Docker, Kubernetes, Terraform, CI/CD"),
  ("Tools:", "Git, GitHub Actions, SQLite, PostgreSQL, REST APIs, Typst"),
)

#let education = (
  (
    institution: "STATE UNIVERSITY OF TECHNOLOGY",
    degree: "B.S. in Computer Science",
    date: "Expected 2028",
  ),
)
