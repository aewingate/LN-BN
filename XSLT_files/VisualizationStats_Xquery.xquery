declare default element namespace  "http://www.tei-c.org/ns/1.0";
<mssSet>
    
    {
    (: !!! Add file path where "INSERT_PATH" is, e.g. "/C:/Users/jsmith/Docs/Inventories" which will be "/C:/Users/jsmith/Docs/Inventories?select=*.xml" in total:)
    for $ms in collection("INSERT_PATH?select=*.xml")/TEI
    (:prints the ALCH number:)
        let $id := $ms//msIdentifier/idno
        let $bibl := $ms//body//listBibl//bibl
    (:filters for your desired condition, change as needed:)
    where $bibl
        return
        (:returns ALCH numbers of all documents that meet the "where" condition:)

<ms>
            <id>{data($id)}</id>
            <mstitle>{data($ms/teiHeader//titleStmt/title)}</mstitle>
            <bibl_total>{count($bibl)}</bibl_total>
            <bibl_titleonly>{count($bibl[descendant::title and not(descendant::author) and not(descendant::persName)])}</bibl_titleonly>
            <bibl_authoronly>{count($bibl[descendant::author and not(descendant::title)])}</bibl_authoronly>
            <bibl_titleauthor>{count($bibl[descendant::title and (descendant::author or descendant::persName)])}</bibl_titleauthor>
            <bibl_noauthortitle>{count($bibl[not(descendant::title) and not(descendant::author)])}</bibl_noauthortitle>
            <pubPlace>{count($bibl[descendant::pubPlace])}</pubPlace>
            <pubDate>{count($bibl[descendant::date[@type='publication']])}</pubDate>
            <publisher>{count($bibl[descendant::publisher])}</publisher>
            <format>{count($bibl[descendant::measure[@unit='bib_format']])}</format>
            <copies>{count($bibl[descendant::measure[@commodity='copies']])}</copies>
            <volumes>{count($bibl[descendant::measure[@commodity='volumes']])}</volumes>
            <codices>{count($bibl[descendant::measure[@commodity='codices']])}</codices>
            <price>{count($bibl[descendant::measure[@type='lotPrice' or @type='copyPrice']])}</price>
            <age>{count($bibl[descendant::seg[@ana='#age']])}</age>
            <binding>{count($bibl[descendant::seg[@ana='#binding']])}</binding>
            <size>{count($bibl[descendant::seg[@ana='#size']])}</size>
            <wear>{count($bibl[descendant::seg[@ana='#wear']])}</wear>
            <value>{count($bibl[descendant::seg[@ana='#value']])}</value>
            <typeface>{count($bibl[descendant::seg[@ana='#typeface']])}</typeface>
            <method>{count($bibl[descendant::seg[@ana='#print' or @ana='mss']])}</method>
            <language>{count($bibl[descendant::textLang])}</language>
            <content>{count($bibl[descendant::quote])}</content>
            <speech>{count($bibl[descendant::seg[@ana='#orality_evidence']])}</speech>

           
           </ms> 
    }
</mssSet>