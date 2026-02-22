# ReqRight

**Free, open-source systems engineering workbench**

INCOSE GtWR v4 · 42 Quality Rules · 6 Integrated Modules · Cross-Module Traceability · Configurable PDF Reports

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.6.0-brightgreen.svg)](CHANGELOG.md)
[![Standard](https://img.shields.io/badge/standard-INCOSE%20GtWR%20v4-orange.svg)]()

---

## What is ReqRight?

ReqRight is a browser-based systems engineering workbench that helps you write, analyze, and manage requirements using the INCOSE Guide to Writing Requirements (GtWR) version 4 standard. It includes six integrated modules covering the full requirements lifecycle — from stakeholder needs through verification and validation.

**No installation. No login. No cloud. Your data stays on your machine.**

🌐 **Try it now:** [https://ssaleem74.github.io/reqright/](https://ssaleem74.github.io/reqright/)

---

## Features at a Glance

### 6 Integrated Modules

| Module | Description |
|--------|-------------|
| **📝 Requirements** | Author, analyze, and grade requirements against 42 INCOSE rules. AI-powered improvement suggestions. 4-level traceability hierarchy. |
| **⚠️ Risk Register** | 5×5 likelihood × impact matrix. Color-coded severity levels. Mitigation tracking linked to requirements. |
| **📋 Decision Log** | Capture design decisions with rationale, categories, and affected requirements. |
| **👥 Stakeholder Register** | Track stakeholders with influence levels, concerns, expectations, and linked needs. |
| **🔌 Interface Definitions** | ICD-style interface specifications with source/destination, protocol, data items, and direction. |
| **📐 Use Cases & Scenarios** | Structured scenarios with actors, triggers, flows, preconditions, and derived requirements. |

### Cross-Cutting Capabilities

- **🔍 Project-Wide Search (⌘K)** — Command-palette style search across all modules
- **📊 Quality Analysis** — Every requirement scored against 42 INCOSE GtWR v4 rules (A–F grading)
- **⚖️ Custom Rule Weights** — 5 weight levels per rule with 5 presets (Equal, Safety-Critical, Performance, Compliance, Minimal)
- **🤖 AI Improvement** — Rule-based rewriting engine that fixes common quality issues (offline, no LLM)
- **💬 Comments & Review** — 4 comment types (Comment, Review, Approve, Request Changes) with auto-status updates
- **🕐 Version History** — Automatic tracking of all field changes with timeline display
- **📋 Templates Library** — 36 pre-built requirement templates across 9 categories
- **📥 Excel Import** — Import .xlsx/.xls files with column mapping modal and multi-sheet support
- **🌳 Traceability** — Parent-child hierarchy with orphan detection + cross-module traceability matrix
- **📄 Configurable PDF Reports** — Select sections, choose layout (ISO/INCOSE, NASA, Management), generate
- **💾 Export/Import** — JSON, CSV, Excel, ReqIF (DOORS-compatible), PDF
- **⌨️ Keyboard Shortcuts** — Ctrl+Z/Y (undo/redo), Ctrl+N (new), Ctrl+S (save), ⌘K (search)
- **🌙 Dark/Light Theme** — Toggle between dark and light modes
- **🔒 Privacy-First** — Everything runs in your browser. Zero data leaves your machine.

---

## Quick Start

### Option 1: Use Online (Recommended)
Visit [https://ssaleem74.github.io/reqright/](https://ssaleem74.github.io/reqright/) — no installation needed.

### Option 2: Run Locally
1. Download `reqright.html` from this repository
2. Open it in any modern browser (Chrome, Firefox, Edge, Safari)
3. That's it — it's a single HTML file with no dependencies

### Option 3: Clone the Repository
```bash
git clone https://github.com/ssaleem74/reqright.git
cd reqright
open reqright.html
```

---

## Screenshots

| Dashboard | Author / Editor |
|:---------:|:---------------:|
| ![Dashboard](images/01-dashboard.svg) | ![Author](images/02-author-editor.svg) |

| Templates Library | Custom Rule Weights |
|:-----------------:|:-------------------:|
| ![Templates](images/03-templates.svg) | ![Rules](images/04-rules-weights.svg) |

| Risk Register | Excel Import |
|:-------------:|:------------:|
| ![Risks](images/05-risk-register.svg) | ![Excel](images/06-excel-import.svg) |

| Comments & Version History | Traceability Matrix |
|:--------------------------:|:-------------------:|
| ![Comments](images/07-comments-history.svg) | ![Trace](images/08-traceability.svg) |

---

## Modules in Detail

### 📝 Requirements Management (Author · Register · Trace · V&V · Rules · Glossary)

The core module with 6 views:
- **Author** — 3-panel editor with sidebar, editor, and quality analysis
- **Register** — Sortable table of all requirements with search and filtering
- **Trace** — Hierarchy tree + cross-module traceability matrix
- **V&V** — Verification method assignment (Test, Analysis, Inspection, Demonstration)
- **Rules** — Reference view of all 42 INCOSE GtWR v4 rules with custom weight configuration
- **Glossary** — Project terminology management

Each requirement is scored against 42 quality rules checking for:
- Ambiguous language ("some", "few", "adequate", "normal")
- Missing measurability ("fast", "reliable", "user-friendly")
- Passive voice, weak verbs, escape clauses
- Missing rationale, priority, verification method
- And 35+ more rules aligned with INCOSE GtWR v4

### ⚠️ Risk Register
- 5×5 likelihood × impact scoring matrix
- Severity levels: Critical (15–25), High (10–14), Medium (5–9), Low (1–4)
- Categories: Technical, Schedule, Cost, Resource, External, Safety, Security
- Mitigations linked to requirements

### 📋 Decision Log
- Design decisions with rationale and outcome tracking
- Categories: Architecture, Design, Technology, Process, Scope, Resource
- Status: Proposed, Approved, Deferred, Superseded
- Affected requirements linking

### 👥 Stakeholder Register
- Influence levels: Critical, High, Medium, Low
- Categories: Internal, External, Regulatory, End User
- Concerns, expectations, and linked stakeholder needs

### 🔌 Interface Definitions
- Types: Data, Electrical, Mechanical, Optical, RF, Software, Network, Thermal
- Direction: Unidirectional →, Bidirectional ↔, Broadcast ⇉
- Data items, data rate, physical characteristics
- Status: Draft, Proposed, Agreed, Verified

### 📐 Use Cases & Scenarios
- Types: Operational, Maintenance, Emergency, Training, Degraded
- Structured flows: actor, trigger, preconditions, main flow, alternatives, postconditions
- Derived requirements and linked stakeholders

---

## PDF Report Generation

ReqRight generates comprehensive systems engineering reports with a configuration wizard:

**Step 1:** Select which sections to include (12 available sections)
**Step 2:** Choose a layout:
- **Option A: ISO/INCOSE Standard** — Stakeholders → Use Cases → Requirements → Interfaces → Risks → Decisions → Traceability → Glossary
- **Option B: NASA-style Hybrid** — Requirements-first, then operational context
- **Option C: Management-first** — Summary and quality stats up front for leadership

Reports include cover page, dynamic table of contents, cross-module traceability matrix, and auto-numbered sections.

---

## Export Formats

| Format | Use Case |
|--------|----------|
| **JSON** | Save/load projects. Full fidelity — all 6 modules, comments, history, and rule weights preserved. |
| **CSV** | Import into Excel, Google Sheets, databases |
| **Excel (.xlsx)** | Import requirements from spreadsheets with column mapping |
| **ReqIF** | Import into IBM DOORS, Polarion, Jama, or any ReqIF-compatible tool |
| **PDF** | Configurable reports for reviews, audits, and documentation |

---

## Documentation

📖 **[User Guide](user-guide.html)** — Comprehensive guide covering all features, modules, and workflows.

---

## Example Projects

Three complete example projects are included to demonstrate different industry contexts:

| Project | Domain | Requirements | Risks | Modules |
|---------|--------|:------------:|:-----:|:-------:|
| [AegisGuard Smart Home Security](SmartHome_Security_System_TestData.json) | Consumer IoT | 29 | 10 | All 6 |
| [SkyNav X200 UAV Flight Control](example-aerospace-uav.json) | Aerospace/Defence | 12 | 3 | All 6 |
| [VitaMonitor Pro Patient Monitor](example-medical-device.json) | Medical Device | 10 | 3 | All 6 |

Each project includes realistic requirements, risks, decisions, stakeholders, interfaces, use cases, glossary entries, sample comments, and Safety-Critical rule weight presets. Load any of these via **File → Load** to explore all features.

---

## Standards Compliance

ReqRight implements quality rules based on:
- **INCOSE Guide to Writing Requirements (GtWR) v4** — 42 quality rules
- **ISO/IEC/IEEE 29148:2018** — Requirements engineering standard
- **ISO/IEC/IEEE 15288:2023** — System life cycle processes

Report layouts are informed by:
- **NASA Systems Engineering Handbook (SP-2016-6105 Rev2)**
- **INCOSE Systems Engineering Handbook v5.0**

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `⌘K` / `Ctrl+K` | Project-wide search |
| `Ctrl+N` | New requirement |
| `Ctrl+S` | Save project (JSON) |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Escape` | Close modal / search |

---

## Privacy & Security

- **Zero server communication** — No data is sent anywhere
- **Browser-only processing** — All analysis runs in JavaScript locally
- **Auto-save to localStorage** — Persists between sessions
- **Export to file** — JSON files saved to your machine

See [Privacy Policy](PRIVACY.md) for details.

---

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Legal

- [License (MIT)](LICENSE)
- [Disclaimer & Legal Notice](DISCLAIMER.md)
- [Privacy Policy](PRIVACY.md)
- [Changelog](CHANGELOG.md)
- [Contributing](CONTRIBUTING.md)

---

**Disclaimer:** This software is provided for educational and informational purposes. All trademarks are the property of their respective owners. This project is not affiliated with or endorsed by INCOSE®, IBM®, or any standards body. See [DISCLAIMER.md](DISCLAIMER.md) for full details.
