# Changelog

All notable changes to ReqRight are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [2.1.0-beta] — 2026-02-18 (Beta Release)

### Added
- **Rebranded to ReqRight** — independent identity, no longer implies INCOSE® affiliation
- Legal disclaimer with trademark acknowledgments (`DISCLAIMER.md`)
- MIT License (`LICENSE`)
- Privacy policy (`PRIVACY.md`)
- Contributing guidelines (`CONTRIBUTING.md`)
- This changelog (`CHANGELOG.md`)
- SVG mockup tutorial images replacing ASCII art diagrams
- Updated FAQ covering Risk Register module and trademark questions
- "Educational purposes" notice in landing page footer
- Disclaimer and privacy links in application footer
- Independent project notice prominently displayed

### Changed
- Product name: "INCOSE Requirements Workbench" → "ReqRight"
- README.md completely rewritten with rendered tutorial images
- Landing page footer now includes legal links
- Application footer shows version and legal links
- All references to INCOSE now use ® symbol and clarify "independent project"
- Repository renamed from `incose-requirements-workbench` to `reqright`

---

## [2.0.0] — 2026-02-12

### Added
- **Risk Register Module** — full risk management capability
  - Risk matrix visualization (5×5 likelihood × impact)
  - Color-coded risk levels (Critical, High, Medium, Low)
  - Expandable risk cards with inline editor
  - Risk categories (Technical, Schedule, Cost, Resource, External, Safety, Security)
  - Mitigation links to requirements (clickable cross-references)
  - Risk summary integrated into Dashboard view
  - Risk ID gap-filling (deleted IDs are reused)
  - Risks included in JSON save/load
  - Undo/redo support for all risk operations
- Navigation restructured for modular expansion
- Risk count badge on navigation tab
- Documentation links in landing page navigation
- Tutorial button on landing page hero
- Help button in application header
- Tutorial link on welcome screen
- Help link in application footer
- "Run Locally / Installation" section in README
- New FAQ entries for offline use and intranet hosting
- Project Journal for development tracking

### Fixed
- Risk editor collapse bug (page re-rendering on keystroke)
- Risk ID numbering now fills gaps from deleted risks
- Click-outside behavior for risk card editors

---

## [1.1.0] — 2026-02-05

### Added
- User tutorial — comprehensive learning guide
- Test plan — 13 suites, 50+ test cases
- Test data — Smart Home Security System with 30 requirements
- Quick reference card — A3 printable PDF
- Professional landing page with scroll animations
- GitHub Pages deployment

### Fixed
- **Input focus loss bug** — text inputs no longer lose focus on each keystroke
  - Root cause: full DOM re-render on every state change
  - Fix: silent state updates for input fields, render only on structural changes

---

## [1.0.0] — 2026-02-03

### Added
- AI Improvement engine (rule-based pattern matching)
  - Passive voice → active voice conversion
  - Vague term replacement
  - Missing unit detection
  - Structure pattern enforcement
  - Bulk AI analysis for entire project
- Enhanced UI with professional dark theme
- Requirement duplication feature
- Bulk import from text/documents
- ReqIF export (DOORS-compatible)
- CSV export
- Auto-save to localStorage

### Changed
- Complete UI overhaul from v0.1

---

## [0.1.0] — 2026-02-02

### Added
- Initial release — core requirements authoring
- 42-rule quality engine based on INCOSE® GtWR v4
  - Real-time quality scoring (0–100%)
  - Grade system (A+ through F)
  - Individual rule pass/fail indicators
  - 14 rule categories
  - 15 essential characteristics (C1–C15)
- Seven integrated views: Dashboard, Author, Register, Traceability, V&V, Rules Reference, Glossary
- Requirement attributes: type, level, priority, status, verification method, rationale, source, parent traceability, risk level
- Five INCOSE® requirement patterns: Basic, Conditional, Complex Conditional, Performance, Interface
- Stakeholder Need → System → Subsystem → Component hierarchy
- JSON project save/load
- Offline-first architecture (no server, no cloud, no tracking)
- Privacy-first design (all data stays in browser)

---

*For the complete development history, see [PROJECT-JOURNAL.md](PROJECT-JOURNAL.md).*
