# Contributing to ReqRight

Thank you for your interest in contributing! ReqRight aims to help systems engineers and students write better requirements using industry best practices.

---

## How to Contribute

### Reporting Bugs

1. Check [existing issues](https://github.com/ssaleem74/reqright/issues) to avoid duplicates
2. Create a new issue with:
   - **Browser and version** (e.g., Chrome 122, Firefox 124)
   - **Steps to reproduce** the bug
   - **Expected behavior** vs. actual behavior
   - **Screenshots** if applicable

### Suggesting Features

Open an issue with the label "enhancement" and describe:
- What problem the feature solves
- How it relates to systems engineering workflows
- Any relevant standards it would support

### Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Test thoroughly in multiple browsers (Chrome, Firefox, Edge, Safari)
5. Submit a pull request with a clear description

---

## Development Guidelines

### Architecture

The application is a **single HTML file** with inline CSS and JavaScript. This is intentional — it ensures:
- Zero build process
- Zero dependencies
- Offline capability
- Easy distribution (just share the HTML file)

**Please maintain this single-file architecture** in contributions.

### Code Style

- Vanilla JavaScript (no frameworks)
- Inline styles using CSS custom properties (variables)
- Functions prefixed by purpose: `render*`, `grid*`, `analyze*`, `export*`
- State managed in the global `S` object
- DOM created via the `h()` helper function

### Testing

Before submitting, verify:
- All 42 rule checks still work correctly
- Quality scoring produces expected grades
- Import/export functions preserve data integrity
- Risk Register operations work (add, edit, delete, link)
- Browser localStorage auto-save functions
- No console errors in browser DevTools

### Commit Messages

Use clear, descriptive commit messages:
- `Fix: Input focus loss in requirement editor`
- `Add: Risk ID gap-filling on deletion`
- `Update: FAQ section with Risk Register questions`

---

## Branding Guidelines

When contributing, please maintain the independent branding:
- The product name is **ReqRight** — never refer to it as an INCOSE product
- Always use ® when referencing INCOSE®, IBM®, or DOORS® in documentation
- Reference INCOSE® as the standard we implement, not as our brand
- Include the independent project notice in any new user-facing pages

---

## Code of Conduct

- Be respectful and constructive in all interactions
- Focus on improving the tool for the systems engineering community
- Acknowledge that requirements engineering is a complex discipline with valid differences of opinion

---

## Questions?

Open a [discussion](https://github.com/ssaleem74/reqright/issues) or reach out through GitHub Issues.
