-- Phone taps parked while the PC is off (pm-mobile). Paste into the Supabase SQL editor once and run.
-- Every payload is AES-256-GCM ciphertext made with the key only James's phone and PC hold, so the open
-- policies below expose nothing readable and nobody else can forge an action the PC will apply.
create table if not exists public.pm_actions (
  id         bigserial   primary key,
  created_at timestamptz not null default now(),
  payload    text        not null check (length(payload) < 20000)
);
alter table public.pm_actions enable row level security;
drop policy if exists pm_actions_insert on public.pm_actions;
drop policy if exists pm_actions_select on public.pm_actions;
drop policy if exists pm_actions_delete on public.pm_actions;
create policy pm_actions_insert on public.pm_actions for insert to anon with check (true);
create policy pm_actions_select on public.pm_actions for select to anon using (true);
create policy pm_actions_delete on public.pm_actions for delete to anon using (true);
