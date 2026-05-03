-- Dead Wax v43 Listening Diary + Added-to-Collection schema
-- Run in Supabase SQL editor before relying on the full listening diary persistence.
-- The app has a safe fallback that caches sessions in records.raw_data.listening_sessions,
-- but this table is the intended long-term source of truth.

alter table public.records
  add column if not exists collection_added_at date,
  add column if not exists listen_count integer not null default 0,
  add column if not exists last_listened_at timestamptz;

create table if not exists public.listening_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  record_id uuid not null references public.records(id) on delete cascade,
  listened_at timestamptz not null default now(),
  note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.listening_sessions enable row level security;

drop policy if exists "Users can view own listening sessions" on public.listening_sessions;
create policy "Users can view own listening sessions"
on public.listening_sessions for select
using (auth.uid() = user_id);

drop policy if exists "Users can insert own listening sessions" on public.listening_sessions;
create policy "Users can insert own listening sessions"
on public.listening_sessions for insert
with check (auth.uid() = user_id);

drop policy if exists "Users can update own listening sessions" on public.listening_sessions;
create policy "Users can update own listening sessions"
on public.listening_sessions for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete own listening sessions" on public.listening_sessions;
create policy "Users can delete own listening sessions"
on public.listening_sessions for delete
using (auth.uid() = user_id);

create index if not exists listening_sessions_user_record_idx
on public.listening_sessions (user_id, record_id, listened_at desc);

-- Optional backfill for existing listened flags:
-- update public.records
-- set listen_count = greatest(listen_count, case when listened then 1 else 0 end),
--     last_listened_at = coalesce(last_listened_at, listened_at)
-- where user_id = auth.uid();
