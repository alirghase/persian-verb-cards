-- Persian Verb Cards keeps its online copy in the farsi-vault Supabase project,
-- beside Farsi Sentence Vault, so one account signs in to both. That project's
-- migrations live in the farsi-sentence-vault repo; this table is applied
-- separately (see README) and doesn't touch their history.
--
-- One row per thing you changed: a card you added, whether you know a verb,
-- whether you know one pronoun's form of it. The browser's local storage stays
-- the working copy. Each account can only see and change its own rows.
create table public.verb_card_rows (
  user_id uuid not null default auth.uid() references auth.users (id) on delete cascade,
  -- card: a verb you added. known: a verb marked known. form: "<verb>|<pronoun 0-5>" marked known.
  kind text not null check (kind in ('card', 'known', 'form')),
  key text not null check (length(key) between 1 and 200),
  -- null is a deleted card, kept so other devices hear about it.
  data jsonb check (data is null or (jsonb_typeof(data) = 'object' and pg_column_size(data) < 20000)),
  -- When the browser made the change (ms). The newest change wins; 0 only fills a gap.
  saved_at bigint not null,
  primary key (user_id, kind, key)
);

-- Two browsers push in any order: an older change arriving second is dropped,
-- and a change dated 0 (progress from before signing in) never overwrites one.
create function public.verb_card_rows_newest_wins() returns trigger
language plpgsql set search_path = '' as $$
begin
  if new.saved_at < old.saved_at or new.saved_at = 0 then
    return null;
  end if;
  return new;
end;
$$;

create trigger newest_wins before update on public.verb_card_rows
  for each row execute function public.verb_card_rows_newest_wins();

alter table public.verb_card_rows enable row level security;

revoke all on public.verb_card_rows from anon;
grant select, insert, update, delete on public.verb_card_rows to authenticated;

create policy "read own rows" on public.verb_card_rows
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "add own rows" on public.verb_card_rows
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "change own rows" on public.verb_card_rows
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "delete own rows" on public.verb_card_rows
  for delete to authenticated using ((select auth.uid()) = user_id);
