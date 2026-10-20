# Persian Verb Cards

Flashcards for 24 everyday Persian verbs, written the way people speak in Tehran, with the
present tense for every pronoun and a drill for getting conjugations automatic.

Live at **https://alirghase.github.io/persian-verb-cards/**.

## The verbs

| | | |
|---|---|---|
| to be · boodan · بودن | to say / tell · goftan · گفتن | to put · gozaashtan · گذاشتن |
| to have · daashtan · داشتن | to buy · kharidan · خریدن | to write · neveshtan · نوشتن |
| to like / love · doost daashtan · دوست داشتن | to come · omadan · اومدن | to sit · neshastan · نشستن |
| to do · kardan · کردن | to read · khoondan · خوندن | to take / win · bordan · بردن |
| to go · raftan · رفتن | to know · doonestan · دونستن | to bring · avordan · آوردن |
| to see · didan · دیدن | to wash · shostan · شستن | to lose · baakhtan · باختن |
| to eat · khordan · خوردن | to understand · fahmidan · فهمیدن | to sell · forookhtan · فروختن |
| to sleep · khaabidan · خوابیدن | to stay · moondan · موندن | to close · bastan · بستن |

Each card has the spoken present stem, the present tense for all six pronouns, and one
everyday sentence in Persian, transliteration and English.

## Three ways to practise

- **Verb:** see the English (or the Persian) and recall the other side. The back shows the
  stem, the full present tense and the example sentence.
- **Sentence:** see the example sentence in one language and say it in the other.
- **Conjugate:** see a random pronoun and a verb, such as *oonaa + to go*, and say the form
  (*miran*) before flipping. The back highlights the answer in the full table. Each
  verb-and-pronoun pair (144 in all) is scored on its own, and **Still learning** only asks
  the ones you haven't got yet.

**English first / Persian first** flips the direction of every mode. Keyboard: `Space` flips,
`←` `→` move, `1` marks *still learning*, `2` marks *got it*.

## Spoken, not written

Everything is colloquial Tehrani: *mikone* not *mikonad*, *shomaa mikonin* not *mikonid*,
*miyaam* for "I come", *mizaaram* for "I put". Transliteration uses `aa` for آ and `oo` for
the long u, matching the sheet the verbs came from.

The present tense is built as `mi-` + present stem + ending (`-am -i -e -im -in -an`). The
verbs that don't follow it are written out by hand: *boodan* (hastam…), *daashtan* and *doost
daashtan* (no `mi-`), and *omadan* (miyaam, miyaay, miyaad…).

## Adding your own verbs

The form under the cards takes the verb as you'd say it, an optional spoken present stem (in
Latin letters and in Persian), and an optional sentence. With a stem, the card gets its own
present-tense table using the regular pattern, labelled so irregular verbs can be checked.

## Where your data lives

The browser's local storage is the working copy, so the cards open straight away, offline
or not.

**Signed in** (email and password, the same account as
[Farsi Sentence Vault](https://github.com/alirghase/farsi-sentence-vault)), every change also
goes up to Supabase and comes down on your other devices: a card you added or deleted,
a verb marked known, one pronoun's form marked known. Each is a row stamped with when you
made the change, and the newest change wins, so two devices that were both offline merge
thing by thing. Progress from before you signed in is dated 0 and only fills gaps in the
account. Row-level security means each account can only read and write its own rows. The key
in `index.html` is Supabase's publishable key, which is public by design.

**Signed out**, everything stays in that browser only, and clearing site data deletes it.
**Export backup** downloads it all as a JSON file, and **Import backup** merges one back in.

### The table

`supabase/schema.sql` creates `public.verb_card_rows` in the `farsi-vault` Supabase project.
That project's migrations live in the farsi-sentence-vault repo, so this table is applied on
its own, without touching their history:

```sh
supabase db query --linked -f supabase/schema.sql   # run from a folder linked to farsi-vault
```

## Running it

It's one `index.html` with no build step. Open it in a browser, or serve the folder:

```sh
python3 -m http.server
```
