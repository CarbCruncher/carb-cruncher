-- Private per-account backup for Carb Cruncher.
-- Run this in the Supabase SQL Editor after creating a project.
create table if not exists public.user_data (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_data enable row level security;

revoke all on public.user_data from public, anon, authenticated;
grant select, insert, update, delete on public.user_data to authenticated;

drop policy if exists "Users can manage only their own Carb Cruncher backup" on public.user_data;
create policy "Users can manage only their own Carb Cruncher backup"
  on public.user_data
  for all
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
