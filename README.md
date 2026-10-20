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

Your added verbs and progress are saved in the browser's local storage only. Clearing site
data deletes them. **Export backup** downloads them as a JSON file, and **Import backup**
merges a file back in, which is also how to move them to another device.

## Running it

It's one `index.html` with no build step. Open it in a browser, or serve the folder:

```sh
python3 -m http.server
```
