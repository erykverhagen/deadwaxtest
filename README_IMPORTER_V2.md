# Dead Wax Supabase Importer v2

This package replaces the original importer with a safer importer for the active Dead Wax DB V4.

## What v2 imports

- Unique Artist + Album records only.
- Non-empty Discogs/enriched entries.
- Record overrides, including records that only exist in `recordOverrides`.
- Custom records.
- Metadata such as cover URL, Discogs ID/URL, genres, styles, tracklist, label, country, release year.
- Personal state where available: Shelf ID, copies owned, grail, listened, rating/reaction, collection membership.
- Full original source data into `raw_data` for recovery/debugging.

## What v2 skips

- Empty archive placeholder entries where `entry.empty === true` and there is no override/custom data.

## Recommended use

1. Upload these files to your GitHub Pages app, replacing the v1 importer files.
2. Open `importer.html`.
3. Sign in.
4. Choose your local `dead_wax_db.js`.
5. Click **Analyze DB**.
6. If the numbers look right, click **Wipe my imported records** to remove the failed v1 import for your user.
7. Click **Import unique records**.
8. Download the report if anything fails.

No SQL changes are required for this importer.
