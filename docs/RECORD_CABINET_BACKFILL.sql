-- Optional one-time backfill: ensure every existing record has the internal Record Cabinet layer.
-- This keeps the base cabinet layer in data while the UI hides it as a visible label.

update public.records
set collections = (
  select jsonb_agg(distinct value)
  from jsonb_array_elements_text(
    coalesce(collections, '[]'::jsonb) || '["record-cabinet"]'::jsonb
  ) as t(value)
)
where not (coalesce(collections, '[]'::jsonb) ? 'record-cabinet');

notify pgrst, 'reload schema';
