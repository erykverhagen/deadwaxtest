# Dead Wax Supabase Native Exact Static Interface v3

Pixel contract: latest uploaded static `index.html`.

Native data contract: Supabase is the only record source of truth. No public `dead_wax_db.js`, no runtime importer.

Intentional UI change: Sign out is nested under the account icon with Settings.

Added: Group by Shelf ID.

## v6 Record Cabinet layer
Record Cabinet is preserved as an internal base layer (`record-cabinet`) for every record, but filtered out of visible collection chips, selectors, and collection management.
