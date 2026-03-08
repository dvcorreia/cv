---
name: linkedin-job
description: Extract job information from a LinkedIn job posting URL using Playwright MCP tools. Use when a job information is needed from a LinkedIn job posting URL.
---

# LinkedIn Job Scraper Skill

Extract job information from a LinkedIn job posting URL using Playwright MCP tools.

## Usage

```
/linkedin-job <url>
```

## Instructions

When invoked with a LinkedIn job URL, follow these steps:

### 1. Navigate to the Job URL

```
Use playwright_browser_navigate to open the LinkedIn job URL provided by the user.
```

### 2. Wait for Page Load

```
Use playwright_browser_wait_for with time: 3 to allow the page to fully load.
```

### 3. Capture Page Snapshot

```
Use playwright_browser_snapshot to get an accessibility snapshot of the page.
```

### 4. Extract Job Data

From the accessibility snapshot, identify and extract the following fields:

- **title** - The job title (usually the main heading)
- **company** - Company name
- **location** - Job location (city, country, or "Remote")
- **description** - Full job description text
- **posted_date** - When the job was posted (e.g., "2 days ago", "1 week ago")
- **employment_type** - Full-time, Part-time, Contract, etc. (if available)
- **job_type** - Remote, Hybrid, On-site (if available)
- **seniority_level** - Entry level, Mid-Senior, Director, etc. (if available)
- **applicants** - Number of applicants (if shown)

### 5. Handle Authentication

If the page shows a login prompt or the job content is not accessible:
1. Inform the user: "Please sign in to LinkedIn in the browser window, then press Enter when ready."
2. Wait for user confirmation
3. Re-capture the snapshot with playwright_browser_snapshot
4. Proceed with extraction

### 6. Return JSON Output

Output the extracted data as a JSON object in this format:

```json
{
  "title": "string",
  "company": "string",
  "location": "string",
  "description": "string",
  "posted_date": "string | null",
  "employment_type": "string | null",
  "job_type": "string | null",
  "seniority_level": "string | null",
  "applicants": "string | null",
  "url": "string"
}
```

If a field cannot be found, use `null`.

### 7. Close Browser (Optional)

Ask the user if they want to close the browser, or leave it open for them to review the job posting.

## Important Notes

- **Single request**: Only navigate once per job URL to avoid detection
- **Read-only**: Use snapshot, not DOM inspection - this is less detectable
- **No automation**: Do not click buttons or scroll unless necessary
- **User session**: Relies on existing LinkedIn login in the browser session
- **Rate limiting**: If scraping multiple jobs, wait between requests

## Example

User input:
```
/linkedin-job https://www.linkedin.com/jobs/view/4012345678
```

Expected output:
```json
{
  "title": "Senior Software Engineer",
  "company": "Acme Corporation",
  "location": "San Francisco, CA (Remote)",
  "description": "We are looking for a senior software engineer...",
  "posted_date": "3 days ago",
  "employment_type": "Full-time",
  "job_type": "Remote",
  "seniority_level": "Mid-Senior level",
  "applicants": "Over 100 applicants",
  "url": "https://www.linkedin.com/jobs/view/4012345678"
}
```

## Error Handling

- **Job not found**: Return `{ "error": "Job posting not found or has been removed" }`
- **Login required**: Prompt user to sign in (see step 5)
- **Rate limited**: Wait and retry, or inform user to try again later
- **Partial data**: Return available fields with `null` for missing fields
