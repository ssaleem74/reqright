# Privacy Policy

**ReqRight — Write Better Requirements · Version 2.1.0-beta**
*Last updated: February 18, 2026*

---

## Summary

**Your data never leaves your computer.** ReqRight is designed with privacy as a core principle. There is no server, no database, no cloud storage, no analytics, and no tracking of any kind.

---

## What Data We Collect

**None.**

This software does not collect, transmit, process, or store any personal data, usage data, telemetry, or analytics on any external server.

---

## How the Software Works

| Aspect | How It Works |
|:-------|:-------------|
| **Processing** | All computation happens in your web browser using JavaScript |
| **Temporary storage** | Auto-save uses your browser's localStorage (local to your machine) |
| **Permanent storage** | Only when you click "Save" — downloads a JSON file to your machine |
| **Internet required?** | No — works fully offline after initial page load |
| **External connections** | None. No API calls, no CDN requests after load, no phone-home |
| **Cookies** | None used |
| **Tracking pixels** | None |
| **Third-party scripts** | Google Fonts loaded on the landing page only (standard web font) |

---

## Browser localStorage

The software uses your browser's `localStorage` feature for auto-saving your work. This data:

- Is stored **only on your local machine**
- Is **never transmitted** to any server
- Can be cleared by clearing your browser data
- Is limited to approximately 5 MB (browser-dependent)
- Is specific to the browser and device you use

To clear localStorage for this site:
1. Open your browser's Developer Tools (F12)
2. Go to Application → Local Storage
3. Select the site URL
4. Click "Clear All"

---

## GitHub Pages Hosting

The software is hosted on GitHub Pages. GitHub may collect standard web server logs (IP addresses, browser type, access times) as part of their standard service. This is controlled by GitHub's privacy policy, not by this software. See [GitHub's Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement) for details.

If you download the HTML file and run it locally, no GitHub logging applies.

---

## Third-Party Services

| Service | Purpose | Data Shared |
|:--------|:--------|:------------|
| **GitHub Pages** | Hosting the web application | Standard HTTP request headers only |
| **Google Fonts** | Typography on landing page | Standard font request; see [Google Fonts Privacy](https://developers.google.com/fonts/faq/privacy) |
| **shields.io** | README badge images | None (static image requests) |

The main application (`reqright.html`) makes **zero external network requests** once loaded.

---

## Children's Privacy

This software does not knowingly collect any information from anyone, including children under 13 years of age. Since no data is collected, COPPA and similar regulations are not applicable.

---

## Data Portability

All your data is always under your control:
- **Export** your project at any time as JSON, CSV, or ReqIF
- **Import** your data into any other tool that accepts these formats
- **Delete** your data by deleting the exported files and clearing browser localStorage

---

## Changes to This Policy

Any changes to this privacy policy will be reflected in this document with an updated date. Since this is an open-source project, all changes are publicly visible in the Git history.

---

## Contact

For privacy-related questions:
- **GitHub Issues:** [github.com/ssaleem74/reqright/issues](https://github.com/ssaleem74/reqright/issues)
