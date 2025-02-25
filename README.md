# Libros de Navarra|Books in Navarre
## Description
This repository contains TEI-XML files for the project Libros de Navarra|Books in Navarre (LN|BN). A searchable database of the data shared here is available [here](https://heuristref.net/aewingate_LorenzoCoroneu/web/). LN|BN seeks to share data about the books circulating in Navarre, Spain in the 16th and 17th centuries.
## License and Permissions
The transcriptions and files presented here are the work of [Alexandra Wingate](www.alexandraewingate.com). The files in this repository are distributed under a [CC BY-NC-SA 4.0 license](https://creativecommons.org/licenses/by-nc-sa/4.0/). Additionally, these files may not be used to train generative AI models or otherwise submitted to them. If you would like to use this dataset for other types of AI purposes, please contact me.
## Directories
TEI_files contains the TEI files of book lists for the LN|BN. Currently, there are 16 clergy library book lists and samples from bookseller inventories.  
XSLT files contains four types of XSLT sheets for transformations:
1. BiblXML_2_CSV.xsl: output the contents of `<bibl>`s as a CSV file
2. diplomatic_navarre.xsl: produces a diplomatic edition of the file contents
3. InventoryVisualization.xsl: produces a visualized version of just the book list
4. normalized_navarre.xsl: produces a normalized edition of the file contents
## Encoding guidelines
The principal point of this dataset is to provide enriched TEI files that distinguish between the different types of information in book list entries. Text normalization is minimal, as regularizing early modern Spanish spelling of Spanish and Latin would be time consuming. The following principles have been followed in encoding:
### Text normalization
- Spelling: No regularization of spelling unless there is an obvious typo. Marked with `<sic>` and corrected with `<corr>`. 
    - Exception: An 'r' is occasionally assimilated to an 'l' when the infinitive form of a Spanish verb has an attached direct or indirect object particle beginning with an l (lo, la, los, las, le, les), such as "servirla" becoming "servilla." To avoid confusion with the diminuitive -illo/a, this will be regularized to -arlos/as, -erlos/as, and -irlos/as using `<orig>`/`<reg>`.
- Line breaks: Words breaking across a line are normalized with `<orig>`/`<reg>`. However, line breaks are not recorded inside of `<bibl>`s.
- Capitalization, punctuation, spacing: No regularization
- Ligatures: Diagraphs (like æ) are not regularized. Letters acting as scribal abbreviations are regularized (e.g., ꝵ for '-rum')
### Book entries
A list of book items, regardless of whether there are line breaks between each item or not, should be enclosed in a `<listBibl>` and then each item inside a `<bibl>`. 
#### Book list 
`<listBibl>`  
`<listBibl>` should close before each folio `<milestone>`, even if the list continues from folio to folio. This is should make it easier to extract and transform the data in the `<listBibl>` later using XSLT. 
```xml
<milestone unit="folio" n="3v"/>
<listBibl>
    <head>Libros</head>
    <bibl><abbr>P<hi>te</hi> Missales en fo. 3</abbr></bibl>
    <bibl>Itten missa defunctorum 5</bibl>
    ...
</listBibl>
<milestone unit="folio" n="4r"/>
<listBibl>
	...
```

If a book list has a heading, this should be indicated using `<head>`
#### Book entry 
`<bibl>`  
Each book item should be contained within a bibl, including the quantity, format, price, and any other information associated with the item. 

```xml
<bibl>Itten sermones de Yangues un tomo en 4o</bibl>
<bibl>Itten discursos sobre el genesis dos <add place="super">2</add> <sic>tomo</sic> en 4o</bibl>
```

The information in each `<bibl>` is further structured into the following categories as they are applicable. Given the various levels of descriptiveness in early modern inventories, it is very likely that only some of these will be used in a given `<bibl>`.
#### Title/title description
`<title>`
- should include words like "intitulado". All the words that try to point us to a particular work.
- If an author's name is part of the title (e.g. codicis justiniani sacratissimi principis), encode that part inside the `<title>` with `<persName type="author">`.  
```xml
<title>codicis <persName type="author">justiniani sacratissimi principis</author></title>
```
__NB: A @corresp with value of a unique identifier for the work will be added eventually.__
#### Author
`<author>`  
Include prepositional words like "de" and "por" and phrases like "escrito por"
__NB: A @corresp with value of a unique identifier for the author will be added eventually.__
#### Place of publication
`<pubPlace>`
#### Year of publication
`<date type="publication" when="YYYY">`
#### Printers/Publishers
`<publisher>`
#### Format statement
`<measure type="format" corresp="#format_ref_value">`
Include any preceding prepositions (e.g., "a folio")
- `_2o`
- `_4o`
- `_8o`
- `_12mo`
- `_16mo`
- `_18mo`
- `_24mo`
- `_32mo`
#### Quantity (copies)
Number of copies, not how many volumes in a work/edition.  2 copies of 3 volume works means quantity = 2  
`<measure unit="copies" quantity="number_of_copies">`
If quantity is uncertain, do not include quantity and instead put `@cert="unknown"`
#### Volumes
How many volumes in a work (e.g., the works of Bartolus in 5 volumes). Not how many copies.  
2 copies of 3 volumes work means quantity = 3  
`<measure unit="vol" quantity="number_of_phys_vols">`
#### Simple count (codices)
Occasionally books are described in such a way that the numerical counting is simply the number of different codices/items without reference to a work. It is not multiple copies of the same work, nor multiple volumes comprising a multi-volume work. In this case, unit="simple_count".  
`<measure unit="simple_count" quantity="number_of_books">`  
`<measure unit="simple_count" quantity="4">quatro</measure> libros escriptos de mano`
#### Price/Valuation
**Total price**  
`<measure unit="#currency" quantity="price">`  

**Price per copy**  
`<measure type="copyPrice" unit="currency" quantity="price">`  
#### Physical condition (binding, condition, other information)
`<note type="condition" subtype="controlled_vocab">`
**Controlled vocab of subtypes**
- age
- binding (describing the binding or the lack/existence of binding)
- size (unspecified format, e.g. "pequeño")
- wear (e.g., andado)
- value
#### Creation method (print/mss)
`<note type="method" subtype="print/mss">`
#### Language
Use `<textLang>` to encode any mentions of what language texts are in. Encode each mention of a language name individually, even if a text is bilingual. Use @xml:lang with [ISO 639-3](https://iso639-3.sil.org/code_tables/639/data) to refer to the language. Include text like "en" or "escrito en" within the tag.  
`<textLang xml:lang="ISO-code">`  
`<textLang xml:lang="lat">en latin</textLang>`  
**Common ISO values**  
- Spanish = spa
- Euskara = eus
- French = fra
- Italian = ita
- Latin = lat
- Greek (classical) = grc
- Greek (1453- and later) = ell
- Hebrew = heb
#### Content
If the content of the book is quoted, such as to identify the book in the case that it is missing its beginning, use `<q>`
#### Speech
Very occasionally, there is evidence in the written text confirming that inventories were created by someone dictating descriptions to a scribe. For example, the scribe might write "digo" (I mean) in the middle of a description, thereby recording the speakers self-correction mid-sentence. These words will be recorded with `<distinct type="oral">`  
```xml
<bibl>una suma de toledo <distinct type="oral">digo</distinct> rodriguez=</bibl>
```

