# INCOSE Requirements Workbench — Test Plan & Tutorial Guide

## Overview

This document provides:
1. A comprehensive test plan to verify all software features
2. Step-by-step instructions that can be adapted into a user tutorial
3. Expected results for each test case

**Test Project:** Smart Home Security System (SHSS)
**Test Data File:** `test-case-shss.json`

---

## Test Environment Setup

### Pre-requisites
- Modern web browser (Chrome 90+, Firefox 90+, Safari 15+, Edge 90+)
- Test data file: `test-case-shss.json`
- Landing page: `index.html` (renamed from `landing-page.html`)
- Application: `incose-workbench.html`

### Initial State
- Clear browser localStorage before testing: 
  - Open DevTools (F12) → Application → Storage → Clear site data
- Or use Incognito/Private browsing mode

---

## TEST SUITE 1: Welcome Screen & Project Management

### Test 1.1: Welcome Screen Display
**Steps:**
1. Open `incose-workbench.html` in browser
2. Observe the welcome screen

**Expected Results:**
- ✓ Welcome overlay appears with INCOSE logo
- ✓ "Start New Project" button visible
- ✓ File drop zone for loading projects visible
- ✓ Privacy message displayed at bottom

### Test 1.2: Start New Project
**Steps:**
1. Click "Start New Project"

**Expected Results:**
- ✓ Dashboard view loads
- ✓ Project name shows "New Systems Engineering Project"
- ✓ All statistics show 0
- ✓ Pattern templates displayed

### Test 1.3: Load Test Data
**Steps:**
1. Refresh page to return to welcome screen
2. Click on file drop zone or drag `test-case-shss.json` onto it

**Expected Results:**
- ✓ Toast notification: "Loaded 30 requirements"
- ✓ Dashboard shows project name: "Smart Home Security System (SHSS)"
- ✓ Statistics update: Total=30, various statuses shown
- ✓ Average score displayed (should be ~70-80% due to intentionally bad requirements)

### Test 1.4: Project Name Editing
**Steps:**
1. Click on project name in dashboard
2. Edit to "SHSS Test Project v1.0"
3. Navigate to another view and back

**Expected Results:**
- ✓ Name updates as you type (no focus loss)
- ✓ Name persists after navigation

---

## TEST SUITE 2: Requirements Authoring (Editor View)

### Test 2.1: Navigate to Editor
**Steps:**
1. Click "✎ Author" tab in navigation

**Expected Results:**
- ✓ Editor view loads
- ✓ Requirement tabs shown at top
- ✓ First requirement selected by default (or empty state if new project)

### Test 2.2: Create New Requirement
**Steps:**
1. Click "+ New" button in header

**Expected Results:**
- ✓ New requirement created with ID "REQ-0031" (or next sequential)
- ✓ Toast notification confirms creation
- ✓ Editor focuses on new requirement
- ✓ Quality score shows 0% (empty requirement)

### Test 2.3: Text Input Without Focus Loss (CRITICAL)
**Steps:**
1. Click in the "Requirement Statement" textarea
2. Type: "The system shall process data"
3. Continue typing without clicking again

**Expected Results:**
- ✓ Text appears character by character
- ✓ Cursor stays in position (NO FOCUS LOSS)
- ✓ Quality panel updates after brief delay (~150ms debounce)
- ✓ Score changes as you type

### Test 2.4: Pattern Application
**Steps:**
1. Click "Conditional" pattern button below textarea
2. Observe the text change

**Expected Results:**
- ✓ Textarea fills with: "When [condition], the [entity] shall [action] [object]."
- ✓ Quality score updates

### Test 2.5: Quality Analysis Display
**Steps:**
1. Select requirement "BAD-0001" from tabs
2. Observe quality panel on right

**Expected Results:**
- ✓ Score shows low percentage (< 60%)
- ✓ Grade shows "D" or "F"
- ✓ Failed rules listed with red badges
- ✓ Rule violations explained (R7 Vague Terms, R8 Escape Clauses, R10 Superfluous Infinitives)

### Test 2.6: AI Improvement Panel Visibility
**Steps:**
1. With BAD-0001 selected, observe the AI panel

**Expected Results:**
- ✓ Purple gradient AI panel visible below textarea
- ✓ Shows count of violations
- ✓ Lists rule IDs that can be fixed
- ✓ "⚡ AI IMPROVE NOW" button prominent

### Test 2.7: AI Improvement Execution
**Steps:**
1. Click "⚡ AI IMPROVE NOW" button
2. Wait for improvement

**Expected Results:**
- ✓ Button shows "⚡ Improving..." temporarily
- ✓ Toast shows score improvement (e.g., "AI: 35% → 78%")
- ✓ Text in textarea updates with improved version
- ✓ Vague terms replaced with measurable criteria
- ✓ Escape clause removed or made explicit
- ✓ Quality score increases significantly

### Test 2.8: Attribute Editing
**Steps:**
1. Change Type dropdown to "Security"
2. Change Level to "Subsystem Requirement"
3. Change Priority to "Critical"
4. Change Status to "Under Review"
5. Select a Parent requirement from dropdown
6. Enter Source: "Test Document §1.1"
7. Enter Rationale: "Testing attribute persistence"

**Expected Results:**
- ✓ All dropdowns respond immediately
- ✓ Source and Rationale fields maintain focus while typing
- ✓ Changes auto-save (check by refreshing page)

### Test 2.9: Requirement Duplication
**Steps:**
1. Click "⧉ Dup" button

**Expected Results:**
- ✓ New requirement created with next ID
- ✓ All attributes copied except ID and status
- ✓ Toast confirms duplication

### Test 2.10: Requirement Deletion
**Steps:**
1. Create a new test requirement
2. Click "✕" delete button

**Expected Results:**
- ✓ Requirement removed from list
- ✓ Toast confirms deletion
- ✓ Editor shows next available requirement or empty state

---

## TEST SUITE 3: Requirements Register View

### Test 3.1: Navigate to Register
**Steps:**
1. Click "☰ Register" tab

**Expected Results:**
- ✓ Table view displays all requirements
- ✓ Columns: ID, Statement, Type, Level, Score, Status, Actions
- ✓ Count shows "30 of 30" (or current total)

### Test 3.2: Search Functionality
**Steps:**
1. Type "PIR" in search box

**Expected Results:**
- ✓ Table filters to show only requirements containing "PIR"
- ✓ Count updates (e.g., "5 of 30")
- ✓ Search is case-insensitive

### Test 3.3: Type Filter
**Steps:**
1. Clear search
2. Select "Performance" from Type dropdown

**Expected Results:**
- ✓ Only Performance requirements shown
- ✓ Count updates accordingly

### Test 3.4: Level Filter
**Steps:**
1. Select "Subsystem Requirement" from Level dropdown

**Expected Results:**
- ✓ Only Subsystem level requirements shown
- ✓ Can combine with Type filter

### Test 3.5: Sorting
**Steps:**
1. Clear all filters
2. Select "By Score" from sort dropdown

**Expected Results:**
- ✓ Requirements sorted by quality score (highest first)
- ✓ BAD-xxxx requirements appear at bottom

### Test 3.6: Row Click Navigation
**Steps:**
1. Click on any requirement row

**Expected Results:**
- ✓ Navigates to Editor view
- ✓ Clicked requirement is selected

### Test 3.7: Inline Actions
**Steps:**
1. Return to Register view
2. Click ⚡ button on a BAD-xxxx requirement (without clicking the row)

**Expected Results:**
- ✓ AI improvement runs
- ✓ Score in table updates
- ✓ Stays on Register view (doesn't navigate away)

---

## TEST SUITE 4: Traceability Matrix View

### Test 4.1: Navigate to Traceability
**Steps:**
1. Click "⊞ Trace" tab

**Expected Results:**
- ✓ Requirements grouped by level
- ✓ Stakeholder Needs section at top
- ✓ System Requirements section below
- ✓ Subsystem and Component sections follow

### Test 4.2: Hierarchical Display
**Steps:**
1. Find SYS-0001 card
2. Check parent/child indicators

**Expected Results:**
- ✓ Shows "↑ STK-0002" (parent link)
- ✓ Shows "↓ SUB-0001 SUB-0002" (child links)

### Test 4.3: Orphan Detection
**Steps:**
1. Scroll to bottom of page

**Expected Results:**
- ✓ Orange warning box "⚠ Orphan Requirements"
- ✓ Lists ORPH-0001, ORPH-0002
- ✓ May include BAD-xxxx requirements without parents

### Test 4.4: Card Click Navigation
**Steps:**
1. Click on any requirement card

**Expected Results:**
- ✓ Navigates to Editor view
- ✓ Clicked requirement selected

---

## TEST SUITE 5: V&V Planning View

### Test 5.1: Navigate to V&V
**Steps:**
1. Click "✓ V&V" tab

**Expected Results:**
- ✓ Four verification method cards displayed
- ✓ Shows count for Test, Analysis, Inspection, Demonstration
- ✓ Percentages shown

### Test 5.2: Verification Distribution
**Steps:**
1. Observe the distribution

**Expected Results:**
- ✓ "Test" should have highest count (most requirements use Test)
- ✓ Percentages add up to 100%
- ✓ Visual representation accurate

---

## TEST SUITE 6: Rules Reference View

### Test 6.1: Navigate to Rules
**Steps:**
1. Click "⚙ Rules" tab

**Expected Results:**
- ✓ All 14 categories displayed
- ✓ Categories color-coded
- ✓ Rule ranges shown (R1-R9 for Accuracy, etc.)

### Test 6.2: Rule Details
**Steps:**
1. Scroll through rules

**Expected Results:**
- ✓ Each rule shows ID, Name, and Description
- ✓ 42 rules total across all categories
- ✓ Categories: Accuracy, Concision, Non-Ambiguity, Singularity, Completeness, Realism, Conditions, Uniqueness, Abstraction, Quantifiers, Tolerance, Quantification, Uniformity, Modularity

---

## TEST SUITE 7: Glossary View

### Test 7.1: Navigate to Glossary
**Steps:**
1. Click "📖 Glossary" tab

**Expected Results:**
- ✓ Table of terms and definitions
- ✓ Pre-loaded terms visible (from test data)
- ✓ "+ Add Term" button visible

### Test 7.2: Add New Term
**Steps:**
1. Click "+ Add Term"
2. Enter Term: "API"
3. Enter Definition: "Application Programming Interface"

**Expected Results:**
- ✓ New row added
- ✓ Text entry works without focus loss
- ✓ Term saved (persists on navigation)

### Test 7.3: Delete Term
**Steps:**
1. Click "✕" on a term row

**Expected Results:**
- ✓ Term removed from list
- ✓ Immediate update

---

## TEST SUITE 8: Export Functions

### Test 8.1: Save Project (JSON)
**Steps:**
1. Click "💾 Save Project" button in header

**Expected Results:**
- ✓ Browser downloads JSON file
- ✓ Filename includes project name
- ✓ Toast confirms save

### Test 8.2: Export CSV
**Steps:**
1. Click "↓ Export ▾" dropdown
2. Select "CSV Spreadsheet"

**Expected Results:**
- ✓ Browser downloads CSV file
- ✓ File opens in Excel/Sheets
- ✓ All columns present including quality scores

### Test 8.3: Export ReqIF
**Steps:**
1. Click "↓ Export ▾" dropdown
2. Select "ReqIF (DOORS)"

**Expected Results:**
- ✓ Browser downloads .reqif file
- ✓ File is valid XML
- ✓ Contains all requirements with attributes
- ✓ Compatible with DOORS import

### Test 8.4: Export JSON Archive
**Steps:**
1. Click "↓ Export ▾" dropdown
2. Select "JSON Archive"

**Expected Results:**
- ✓ Same as Save Project
- ✓ Includes all data + quality scores

---

## TEST SUITE 9: Import Functions

### Test 9.1: Import JSON (via Load button)
**Steps:**
1. Click "📂 Load" button
2. Select the test JSON file

**Expected Results:**
- ✓ Requirements loaded
- ✓ Glossary loaded
- ✓ Project name updated
- ✓ Toast confirms count

### Test 9.2: Import Document Text
**Steps:**
1. Click "↓ Export ▾" → "↑ Import Document"
2. Select a text file containing "shall" statements
   (Or use: Click "↑ Import" button if visible)
3. Paste sample text:
   ```
   REQ-100: The system shall weigh less than 5 kg.
   The interface shall support USB 3.0.
   3.2.1 The module shall operate at 24V DC.
   ```
4. Click "Import Requirements"

**Expected Results:**
- ✓ Parser detects 3 "shall" statements
- ✓ Requirements created with auto-classification
- ✓ Toast confirms import count

---

## TEST SUITE 10: Bulk AI Analysis

### Test 10.1: Open Bulk Analysis
**Steps:**
1. Click "⚡ Bulk Analysis" button in header

**Expected Results:**
- ✓ Modal opens showing all requirements with failures
- ✓ BAD-xxxx requirements listed with low scores
- ✓ Each shows failing rule badges

### Test 10.2: Individual Fix from Bulk View
**Steps:**
1. Click "⚡ AI Fix" on one requirement in the modal

**Expected Results:**
- ✓ That requirement's text improves
- ✓ Score updates in the modal

### Test 10.3: Fix All Below 80%
**Steps:**
1. Click "⚡ AI Fix All Below 80%" button

**Expected Results:**
- ✓ All low-quality requirements improved
- ✓ Toast shows count of improved requirements
- ✓ Modal updates to show fewer (or no) failing requirements

---

## TEST SUITE 11: Auto-Save & Recovery

### Test 11.1: Auto-Save to LocalStorage
**Steps:**
1. Make changes to a requirement
2. Close browser tab
3. Reopen the application

**Expected Results:**
- ✓ Welcome screen shows "Continue Previous Session"
- ✓ Shows requirement count and last save time

### Test 11.2: Session Recovery
**Steps:**
1. Click "Continue Previous Session"

**Expected Results:**
- ✓ All data restored
- ✓ Project name correct
- ✓ All requirements present
- ✓ Glossary intact

### Test 11.3: Clear Session
**Steps:**
1. Refresh to welcome screen
2. Click "Start New Project"

**Expected Results:**
- ✓ Previous session data cleared
- ✓ Fresh project starts

---

## TEST SUITE 12: Quality Rules Verification

### Test 12.1: R1 - Structured Statements
**Input:** "Process the data."
**Expected:** FAIL - Missing 'shall', no structured opening

**Input:** "The system shall process the data."
**Expected:** PASS

### Test 12.2: R2 - Active Voice
**Input:** "Data shall be processed by the system."
**Expected:** FAIL - Passive voice detected

**Input:** "The system shall process data."
**Expected:** PASS

### Test 12.3: R7 - Vague Terms
**Input:** "The system shall be fast and reliable."
**Expected:** FAIL - "fast", "reliable" flagged

**Input:** "The system shall respond within 100 ms with MTBF ≥ 5000 hours."
**Expected:** PASS

### Test 12.4: R10 - Superfluous Infinitives
**Input:** "The system shall be able to store data."
**Expected:** FAIL - "shall be able to"

**Input:** "The system shall store data."
**Expected:** PASS

### Test 12.5: R14 - Punctuation
**Input:** "The system shall process data"
**Expected:** FAIL - Missing period

**Input:** "The system shall process data."
**Expected:** PASS

### Test 12.6: R18 - Single Thought
**Input:** "The system shall process data and shall store results."
**Expected:** FAIL - Multiple "shall" statements

### Test 12.7: R24 - Pronouns
**Input:** "It shall notify them when ready."
**Expected:** FAIL - "It", "them" are pronouns

### Test 12.8: R26 - Absolutes
**Input:** "The system shall always respond and shall never fail."
**Expected:** FAIL - "always", "never"

### Test 12.9: R31 - Solution Free
**Input:** "The system shall use MySQL to store data."
**Expected:** FAIL - Implementation detail (MySQL)

### Test 12.10: R33 - Tolerances
**Input:** "The system shall respond within 100 ms."
**Expected:** FAIL - Single value, no tolerance

**Input:** "The system shall respond within 100 ± 10 ms."
**Expected:** PASS

---

## TEST SUITE 13: Landing Page

### Test 13.1: Landing Page Load
**Steps:**
1. Open `index.html` (landing page)

**Expected Results:**
- ✓ Hero section displays
- ✓ Navigation bar visible
- ✓ "Launch Workbench" buttons work
- ✓ Scroll animations trigger on scroll

### Test 13.2: Navigation Links
**Steps:**
1. Click "Features" in nav

**Expected Results:**
- ✓ Smooth scroll to Features section

### Test 13.3: Launch Button
**Steps:**
1. Click "Launch Workbench →" button

**Expected Results:**
- ✓ Opens `incose-workbench.html`
- ✓ Welcome screen appears

---

## Test Results Summary Template

| Suite | Test | Pass/Fail | Notes |
|-------|------|-----------|-------|
| 1.1 | Welcome Screen | | |
| 1.2 | Start New Project | | |
| 1.3 | Load Test Data | | |
| ... | ... | | |

---

## Known Issues / Limitations

1. ReqIF export is basic - does not support full DOORS attribute mapping
2. AI improvement is rule-based, not using actual AI/LLM
3. No multi-user collaboration
4. No version control / baseline management
5. LocalStorage limit (~5MB) may be reached with very large projects

---

## Tutorial Adaptation Notes

This test plan can be converted to a user tutorial by:

1. **Removing test-specific language** - Change "Expected Results" to "What you'll see"
2. **Adding screenshots** - Capture each step for visual guidance
3. **Adding learning objectives** - Begin each section with "In this section, you will learn..."
4. **Adding tips and best practices** - Include INCOSE guidance alongside tool instructions
5. **Creating a shorter quick-start guide** - Extract Tests 1.2, 2.2, 2.3, 2.7, 8.1 for a 5-minute intro

The SHSS project is ideal for tutorials because:
- It's a relatable real-world system
- It demonstrates proper requirement hierarchy
- It includes intentionally bad requirements to show improvement
- It has enough complexity to exercise all features
