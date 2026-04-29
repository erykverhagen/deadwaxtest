# Dead Wax Supabase App

Fresh GitHub-ready package for the Supabase-backed Dead Wax app.

## Upload these files to the root of the GitHub Pages repo

- `index.html`
- `supabase-config.js`
- `dead_wax_supabase_boot.js`
- `dead_wax_supabase_sync.js`
- `README.md`

## Optional parked tools

The `/tools` folder contains the old migration/importer tool. It is not used by the app runtime and can be ignored for normal use.

## Do not publish private static DB files

Do not add `dead_wax_db.js`, old DB ZIPs, screenshots, PDFs, or local exports to the public repo.

The app loads user records from Supabase after sign-in.

## Styling

There is no separate `style.css`. The current Dead Wax styling is embedded in `index.html`.

## Current auth

Email/password sign-in is enabled in this version. Magic link, Google, and Apple can be added later through Supabase Auth.

## Expected Supabase tables

This app expects the Supabase tables created during setup:

- `records`
- `collections`
- `record_collections`
- `change_log`

RLS must stay enabled.
