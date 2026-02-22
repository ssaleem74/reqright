# Changelog

All notable changes to ReqRight are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

---

## [2.6.0] — 2026-02-22

### Added
- **Excel Import (.xlsx/.xls)** — Full spreadsheet import via SheetJS
  - Column mapping modal with auto-detection of common header names
  - Multi-sheet workbook support with tab selector
  - Preview table showing first 5 rows before import
  - Maps to all requirement fields (type, level, priority, status, V&V, rationale, source, parent)
- **Requirement Templates Library** — 36 pre-built templates across 9 categories
  - Categories: Functional, Performance, Interface, Safety, Security, Reliability, Environmental, Maintainability, Regulatory
  - Templates follow INCOSE GtWR v4 best practices with [placeholder] syntax
  - Click-to-insert creates requirement pre-filled with type, level, and V&V method
  - Accessible via 📋 Templates button in header
- **Comments & Review Mode** — Collaborative review workflow
  - 4 comment types: 💬 Comment, 📝 Review Note, ✅ Approve, ❌ Request Changes
  - Approve auto-sets requirement status to "Approved"
  - Request Changes auto-sets status to "Under Review"
  - Reviewer name persisted across sessions
  - Comment count badge on sidebar items and dashboard
  - Collapsible panel in Author view
- **Version History** — Automatic change tracking
  - Tracks all field changes (type, level, priority, status, V&V, rationale, source, parent, risk)
  - Text changes tracked with debounced snapshots
  - AI rewrites logged as "AI Engine" with before/after snippets
  - Timeline view with newest-first ordering and color-coded diffs
  - Change count on dashboard
- **Custom Rule Weights** — Configurable scoring engine
  - 5 weight levels per rule: Off (0×), Low (0.5×), Normal (1×), High (2×), Critical (3×)
  - Weighted scoring: sum(weight × pass) / sum(weight) × 100
  - 5 built-in presets: Equal, Safety-Critical, Performance-Focused, Compliance-Strict, Minimal
  - Enhanced Rules view with inline weight selectors and preset cards
  - Weights persisted in localStorage and included in JSON export/import
  - Weight badge shown on failing rules in quality panel

### Changed
- Version bumped from 2.5.0 to 2.6.0 across all references
- File import inputs now accept .xlsx/.xls in addition to .json/.csv/.tsv/.md
- Import menu label updated to "Import Excel/CSV/Document"
- Welcome screen file label updated for Excel support
- Duplicate requirement now clears comments and history
- Dashboard stats grid now shows Comments and Changes counts
- JSON export now includes ruleWeights configuration

## [2.5.0] — 2026-02-21

### Added
- **Project-Wide Search (⌘K / Ctrl+K)** — Command-palette style search across all 7 modules
  - Searches requirements, risks, decisions, stakeholders, interfaces, use cases, and glossary
  - Real-time filtering with minimum 2 characters
  - Results grouped by module with counts
  - Clickable rows navigate directly to item detail view
  - Keyboard shortcut works globally (even while typing in inputs)
  - Limit 10 results per module with "X more" indicator
- **Configurable PDF Report Generator** — Full report configuration modal
  - Step 1: Select which sections to include (12 toggleable sections)
  - Step 2: Choose layout ordering (3 options)
  - Option A: ISO/INCOSE Standard (Stakeholders → Use Cases → Requirements → ...)
  - Option B: NASA-style Hybrid (Requirements-first)
  - Option C: Management-first (Leadership audience)
  - Select All / Minimum quick-action buttons
  - Auto-numbered sections and dynamic Table of Contents
  - Layout name shown on cover page
  - New sections: Stakeholders, Interfaces, Use Cases, Cross-Module Traceability, V&V
- **Verification & Validation section** in PDF reports

### Changed
- **Two-row header layout** — Logo + actions on row 1, navigation tabs on row 2
  - Fixes overflow on screens under 1440px
  - All buttons now visible at all screen widths
- **Version bumped to v2.5.0** throughout (footer, PDF reports, meta)
- **Tagline updated** from "AI Quality · ReqIF Export · Free & Open" to "Systems Engineering Workbench · INCOSE GtWR v4 · 42 Rules"
- **Welcome screen copy** updated to reflect 6 integrated modules
- **Meta description** updated for SE workbench positioning
- **Footer links** now point to GitHub repo (DISCLAIMER.md, PRIVACY.md)
- **localStorage keys** rebranded from `incose_*` to `reqright_*` with automatic migration

---

## [2.4.0] — 2026-02-21

### Added
- **Cross-Module Traceability Matrix** — New sub-tab in Trace view
  - Matrix showing every requirement's links to Decisions, Stakeholders, Interfaces, and Use Cases
  - Red-highlighted rows for requirements with no cross-module links (traceability gaps)
  - Summary statistics bar (total reqs, linked count, gap count, coverage percentage)
  - Integrated as ◫ Cross-Module Matrix tab alongside ⊞ Hierarchy view

---

## [2.3.0] — 2026-02-19

### Added
- **Stakeholder Register Module**
  - Full CRUD for stakeholders with name, role, organization, influence, category
  - Linked Needs — connect stakeholders to requirements they drive
  - Influence levels: Critical, High, Medium, Low (color-coded)
  - Categories: Internal, External, Regulatory, End User
  - Searchable sidebar, detail editor, analytics panel
  - Integrated into Dashboard, JSON export/import, undo/redo
- **Interface Definitions Module**
  - Structured ICD-style interface specifications
  - Fields: name, type, source, destination, direction, protocol, data items, data rate, physical characteristics
  - Interface types: Data, Electrical, Mechanical, Optical, RF, Software, Network, Thermal
  - Direction symbols: Unidirectional →, Bidirectional ↔, Broadcast ⇉
  - Linked Requirements cross-references
  - Status tracking: Draft, Proposed, Agreed, Verified
- **Use Cases & Scenarios Module**
  - Structured use case editor with actor, trigger, preconditions, main flow, alternative flows, postconditions
  - Use case types: Operational, Maintenance, Emergency, Training, Degraded
  - Priority levels: Critical, High, Medium, Low
  - Derived Requirements linking
  - Linked Stakeholders cross-references
  - Full scenario cards in sidebar

### Changed
- Navigation expanded with separators grouping Requirements | Management | Support modules
- Dashboard updated with cards for all 6 modules
- Footer shows counts for all module types
- JSON export/import includes all 6 modules
- Test data (SmartHome Security System) expanded with stakeholders, interfaces, and use cases

---

## [2.2.0] — 2026-02-19

### Added
- **Decision Log Module** — Capture design decisions with rationale
  - Decision categories: Architecture, Design, Technology, Process, Scope, Resource
  - Status tracking: Proposed, Approved, Deferred, Superseded
  - Affected Requirements linking (clickable cross-references)
  - Searchable sidebar with status indicators
  - Decision count badge on navigation tab
  - Integrated into Dashboard, JSON export/import, undo/redo

---

## [2.1.0-beta] — 2026-02-18

### Added
- **Rebranded to ReqRight** — independent identity
- Legal disclaimer with trademark acknowledgments (`DISCLAIMER.md`)
- MIT License (`LICENSE`)
- Privacy policy (`PRIVACY.md`)
- Contributing guidelines (`CONTRIBUTING.md`)
- SVG mockup tutorial images
- Updated FAQ covering Risk Register

### Changed
- Product name: "INCOSE Requirements Workbench" → "ReqRight"
- README.md rewritten with tutorial images
- Application footer shows version and legal links
- All INCOSE references use ® symbol and clarify "independent project"

---

## [2.0.0] — 2026-02-12

### Added
- **Risk Register Module** — Full risk management capability
  - Risk matrix visualization (5×5 likelihood × impact)
  - Color-coded risk levels (Critical, High, Medium, Low)
  - Expandable risk cards with inline editor
  - Risk categories (Technical, Schedule, Cost, Resource, External, Safety, Security)
  - Mitigation links to requirements (clickable cross-references)
  - Risk summary integrated into Dashboard view
  - Risk ID gap-filling (deleted IDs are reused)
  - Undo/redo support for all risk operations
- Navigation restructured for modular expansion
- Dark/Light theme toggle
- Keyboard shortcuts (Ctrl+Z/Y/N/S/F)
- Undo/Redo system

---

## [1.0.0] — 2026-02-03

### Added
- **Requirements Engine** — 42 INCOSE® GtWR v4 rules
- Quality scoring and grading (A–F)
- AI Improvement (rule-based auto-fix, offline)
- 4-level traceability hierarchy (Stakeholder Need → System → Subsystem → Component)
- Parent-child linking with orphan detection
- Export: JSON, CSV, ReqIF (DOORS-compatible)
- Import: JSON, CSV, Document (shall-statement extraction)
- Glossary management
- V&V method assignment
- Rules reference view (all 42 rules with examples)
- Landing page and GitHub Pages deployment
- Test data: Smart Home Security System
