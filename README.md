# Libros de Navarra|Books in Navarre
## Description
This repository contains TEI-XML files for the project Libros de Navarra|Books in Navarre (LN|BN). A searchable database of the data shared here is available [here](https://heuristref.net/aewingate_LorenzoCoroneu/web/). LN|BN seeks to share data about the books circulating in Navarre, Spain in the 16th and 17th centuries.
## License and Permissions
The transcriptions and files presented here are the work of [Alexandra Wingate](www.alexandraewingate.com). The files in this repository are distributed under a [CC BY-NC-SA 4.0 license](https://creativecommons.org/licenses/by-nc-sa/4.0/). Additionally, these files may not be used to train generative AI models or otherwise submitted to them. If you would like to use this dataset for other types of AI purposes, please contact me.
## Directories
TEI_files contains the TEI files of book lists for the LN|BN. Currently, there are 16 clergy library book lists and samples from bookseller inventories.  
XSLT files contains 5 XSLT sheets and 1 XQuery file for transformations:
1. BiblXML_2_CSV.xsl: output the contents of `<bibl>`s as a CSV file
2. diplomatic_navarre.xsl: produces a diplomatic edition of the file contents
3. InventoryVisualization.xsl: produces a visualized version of just the book list
4. normalized_navarre.xsl: produces a normalized edition of the file contents
5. VisualizationStats_Xquery.xquery: produces an XML file counting the types of data in each book list across all TEI book lists in a folder
6. viz_stats_XML2CSV.xsl: produces a CSV file from the results of the XQuery in #5  
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
#### Book list `<listBibl>`  
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
#### Book entry `<bibl>`  
Each book item should be contained within a bibl, including the quantity, format, price, and any other information associated with the item. 

```xml
<bibl>Itten sermones de Yangues un tomo en 4o</bibl>
<bibl>Itten discursos sobre el genesis dos <add place="super">2</add> <sic>tomo</sic> en 4o</bibl>
```

The information in each `<bibl>` is further structured into the following categories as they are applicable. Given the various levels of descriptiveness in early modern inventories, it is very likely that only some of these will be used in a given `<bibl>`.
#### Title/title description `<title>`
`<title>` should include words like "intitulado". All the words that try to point us to a particular work.  
If an author's name is part of the title (e.g. codicis justiniani sacratissimi principis), encode that part inside the `<title>` with `<persName type="author">`.  
```xml
<title>codicis <persName type="author">justiniani sacratissimi principis</author></title>
```
__NB: A @corresp with value of a unique identifier for the work will be added eventually.__
#### Author
Use `<author>` (when used outside `<title>`) or `<persName type="author">` (when used inside `<title>`)  
Include prepositional words like "de" and "por" and phrases like "escrito por".  
__NB: A @corresp with value of a unique identifier for the author will be added eventually.__
#### Place of publication `<pubPlace>`
Use `<pubPlace>` like `<pubPlace>en Valladolid</pubPlace>`
#### Year of publication `<date type="publication" when="YYYY">`
Use `<date type="publication" when="YYYY">`, like `<date type="publication" when="1696">en 1696</date>`.
#### Printers/Publishers `<publisher>`
For both printers and publishers mentioned in entries (and connecting preopositions), use `<publisher>`. For example, "apud Christoph Plantin" becomes `<publisher>apud Christoph Plantin</publisher>`.
#### Format statement
`<measure unit="bib_format" quantity="format_value">`
Include any preceding prepositions (e.g., "a folio")  
__Format values__
- folio = 2
- quarto = 4
- octavo = 8
- 12mo= 12
- 16mo = 16
- 18mo = 18
- 24mo = 24
- 32mo = 32
#### Quantity (copies)
Number of copies, not how many volumes in a work/edition.  
2 copies of 3-volume works (6 books) means quantity = 2  
`<measure unit="count" quantity="number_of_copies" commodity="copies">`  
If quantity is uncertain, do not include quantity and instead put `@cert="unknown"`
#### Volumes
How many volumes in a work (e.g., the works of Bartolus in 5 volumes), not how many copies.  
2 copies of 3-volume work means quantity = 3  
`<measure unit="count" quantity="number_of_vols" commodity="volumes">`
#### Codices
Occasionally books are described in such a way that the numerical counting is simply the number of different codices/items without reference to a work. It is not multiple copies of the same work, nor multiple volumes comprising a multi-volume work. In this case, `@commodity="codices"`.  
`<measure unit="count" quantity="number_of_codices" commodity="codices">`  

`<measure unit="count" quantity="4" commodity="codices">quatro libros</measure> escriptos de mano`  

If the number of books is uncountable (e.g., "un fajo de quadernos", quantity= 0)
#### Price/Valuation
Currency reference in `@unit` references `<taxonomy="currency">` in `<classDesc>`. `@type` differentiates between the total price of an entry (lotPrice) and the price of an individual codex or copy (copyPrice).  
**Total price**  
`<measure type="lotPrice" unit="#currency" quantity="price">`  

**Copy price**  
`<measure type="copyPrice" unit="#currency" quantity="price">`  

#### Physical condition (binding, condition, other information)
Use `<seg>` with `@ana` referencing the controlled vocabulary at the front of the documents  
**Controlled vocab of subtypes**
- age `<seg ana="#age">`
- binding (describing the binding or the lack/existence of binding) `<seg ana="#binding">`
- size (unspecified format, e.g. "pequeño") `<seg ana="#size">`
- wear (e.g., andado) `<seg ana="#wear">`
- value `<seg ana="#value">`
- typeface `<seg ana="#typeface">`

#### Creation method (print/mss)
Following on from the encoding method of physical conditions, use `<seg>` with `@ana` referencing the controlled vocabulary at the front of the documents.  
- print `<seg ana="#print">`
- manuscript `<seg ana="#mss">`

#### Language
Use `<textLang>` to encode any mentions of what language texts are in. Use @mainLang or @otherLangs with [IANA Language Subtag Registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry) to refer to the language. Include text like "en" or "escrito en" within the tag. If there is just one language mentioned, use @mainLang. If there are 2+ languages mentioned and one is the principal language of the text, use @mainLang for the principal language and @otherLangs (codes separated with spaces) for the other languages. If it is a bilingual text, encode each mention of a language separately, using @mainLang for each.
`<textLang mainLang="IANA-code">`  
`<textLang mainLang="la">en latin</textLang>`  

**Common IANA values**  
- Spanish = es
- Euskara = eu
- French = fr
- Italian = it
- Latin = la
- Greek (classical) = grc
- Greek (1453- and later) = el
- Hebrew = he

#### Content
If the content of the book is quoted, such as to identify the book in the case that it is missing its beginning, use `<quote>`. For example:  
```xml
<bibl>Ittem <measure unit="count" commodity="volumes" quantity="1">otro libro</measure> <seg ana="#wear">que le falta el principio</seg> y entra diziendo 
<!---quoted text-->
<quote>el exsamen de la <choice><abbr>conzien.<hi rend="super">a</hi></abbr><expan>conziencia</expan></choice> del Muy <choice><abbr>Reu<hi rend="super">do</hi></abbr><expan>Reuerendo</expan></choice> <choice><abbr>P.<hi rend="super">e</hi></abbr><expan>Padre</expan></choice> fr Alonso de orozco</quote>

</bibl>
```
#### Speech
Very occasionally, there is evidence in the written text confirming that inventories were created by someone dictating descriptions to a scribe. For example, the scribe might write "digo" (I mean) in the middle of a description, thereby recording the speakers self-correction mid-sentence. These words will be recorded with `<seg ana="#orality_evidence">`

```xml
<bibl>una suma de toledo <seg ana="#orality_evidence">digo</seg> rodriguez=</bibl>
```

