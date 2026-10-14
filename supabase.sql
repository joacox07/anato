-- Ejecutar una sola vez en Supabase → SQL Editor → New query → Run.

create table if not exists public.people (
  name text primary key,
  color text not null,
  created_at timestamptz not null default now()
);

create table if not exists public.ranges (
  id uuid primary key default gen_random_uuid(),
  person text not null references public.people(name) on update cascade on delete cascade,
  start_date date not null,
  end_date date not null,
  reason text,
  created_at timestamptz not null default now(),
  check (end_date >= start_date)
);

-- Acceso abierto para cualquiera que tenga el link (grupo de amigos, sin login).
alter table public.people enable row level security;
alter table public.ranges enable row level security;

drop policy if exists "people abierto" on public.people;
create policy "people abierto" on public.people for all to anon, authenticated using (true) with check (true);

drop policy if exists "ranges abierto" on public.ranges;
create policy "ranges abierto" on public.ranges for all to anon, authenticated using (true) with check (true);

-- Cambios en vivo: cuando alguien carga una fecha, los demás la ven al instante.
alter publication supabase_realtime add table public.people, public.ranges;
