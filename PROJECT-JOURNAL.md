# ReqRight — Project Journal

A running log of design decisions, development sessions, and architectural choices.

---

## 🎯 Project Vision

Build a free, browser-based systems engineering workbench that implements INCOSE GtWR v4 quality analysis with integrated management modules. Single HTML file, no dependencies, privacy-first.

---

## 🏛️ Key Architectural Decisions

1. **Single HTML File** — Chose simplicity over modularity. Easy to distribute, no build process.
2. **No Framework** — Vanilla JS keeps it lightweight and dependency-free.
3. **Offline First** — Privacy and security were priorities. No cloud, no tracking.
4. **"AI" Naming** — Called pattern matching "AI Improvement" for user-friendliness, though it's rule-based, not LLM.
5. **GitHub Pages Hosting** — Free, reliable, no server maintenance.
6. **Modular Architecture** — Each module (Risks, Decisions, Stakeholders, etc.) follows the same 3-column layout pattern with searchable sidebar, editor, and analytics panel.
7. **Cross-Module Linking** — All modules link back to requirements via ID references, enabling full traceability.

---

## 📅 Session Log

### February 2, 2026
- Initial v1 development
- Core requirements engine with 42 INCOSE GtWR v4 rules
- Quality scoring and grading (A–F)
- AI improvement (rule-based rewriting)

### February 3, 2026 (Early)
- Version 2 enhancements
- 4-level traceability hierarchy
- Export: JSON, CSV, ReqIF
- UI polish and dark theme

### February 3, 2026 (Later)
- GitHub deployment
- Landing page creation
- GitHub Pages setup

### February 5, 2026
- **Bug Fix:** Input focus loss issue resolved
- Test plan created (13 suites, 50+ cases)
- User tutorial written
- Test data: Smart Home Security System
- Quick reference card (PDF)

### February 11, 2026
- Documentation links added throughout app
- "Run Locally / Installation" section added
- FAQ expanded
- Project journal created
- Decision: Features first, documentation polish later

### February 12, 2026
- **Risk Register Module** (v2.0.0)
  - 5×5 likelihood × impact matrix
  - Color-coded severity levels
  - Mitigation links to requirements
  - Integrated into Dashboard, JSON, undo/redo
- Dark/Light theme toggle
- Keyboard shortcuts (Ctrl+Z/Y/N/S/F)
- Undo/Redo system
- Navigation restructured for modular expansion

### February 18, 2026
- **Rebrand to ReqRight** (v2.1.0-beta)
  - New name, logo, and identity
  - Legal package: DISCLAIMER.md, LICENSE (MIT), PRIVACY.md, CONTRIBUTING.md
  - CHANGELOG.md created
  - All INCOSE references updated with ® and "independent project" clarification

### February 19, 2026
- **Decision Log Module** (v2.2.0)
  - Categories, status, affected requirements
  - Full CRUD with search and analytics
- **Stakeholder Register Module** (v2.3.0)
  - Influence levels, concerns, linked needs
- **Interface Definitions Module** (v2.3.0)
  - ICD-style specifications with data items, protocol, direction
- **Use Cases & Scenarios Module** (v2.3.0)
  - Structured scenarios with flows, actors, derived requirements
- All 6 modules fully integrated with Dashboard, JSON, undo/redo
- Test data expanded across all modules

### February 21, 2026 (Session 1)
- **Cross-Module Traceability Matrix** (v2.4.0)
  - New sub-tab in Trace view
  - Matrix showing requirement links to all modules
  - Red highlighting for traceability gaps
  - Coverage percentage statistics

### February 21, 2026 (Session 2)
- **Project-Wide Search** (v2.5.0)
  - ⌘K / Ctrl+K command palette
  - Searches across all 7 data types
  - Clickable results navigate to items
- **Configurable PDF Report Generator**
  - Report configuration modal (Step 1: sections, Step 2: layout)
  - 3 layout options: ISO/INCOSE, NASA, Management-first
  - 12 selectable sections with auto-numbering
  - Select All / Minimum quick actions
- **V&V section** added to report

### February 21, 2026 (Session 3 — Polish & Ship)
- Two-row header layout (fixes overflow on smaller screens)
- Version updated to v2.5.0 everywhere
- Tagline refreshed: "Systems Engineering Workbench"
- Welcome screen updated for 6-module workbench
- Footer links point to GitHub repo
- localStorage keys rebranded (reqright_*) with migration from old keys
- Meta description updated
- CHANGELOG.md updated through v2.5.0
- README.md rewritten for full SE workbench
- PROJECT-JOURNAL.md updated (this file)

---

## 📊 Current Statistics (v2.5.0)

| Metric | Value |
|--------|-------|
| HTML file size | ~3,900 lines |
| Modules | 6 (Requirements, Risks, Decisions, Stakeholders, Interfaces, Use Cases) |
| Views | 14+ (Dashboard, Author, Register, Trace ×2, V&V, Rules, Glossary, + 6 module views) |
| Quality rules | 42 (INCOSE GtWR v4) |
| Export formats | 4 (JSON, CSV, ReqIF, PDF) |
| Report layouts | 3 (ISO/INCOSE, NASA, Management) |
| Keyboard shortcuts | 6 |
| Dependencies | 0 |

---

## 📌 Next Steps (When Ready)

1. **Take Screenshots** — Capture all key screens for documentation
2. **Create SVG Mockups** — Or use real screenshots
3. **Update README** — Replace with actual images
4. **Create Video** — Record walkthrough tutorial
5. **Add More Examples** — Industry-specific test projects
6. **Final Testing** — Full regression test
7. **Release Announcement** — Share with INCOSE community

### Future Feature Ideas
- Excel/CSV Import (.xlsx)
- Custom Rule Weights
- Comments/Review Mode
- Version History
- Requirement Templates Library
- Real LLM Integration (optional API key)

---

*This journal should be updated after each development session.*
