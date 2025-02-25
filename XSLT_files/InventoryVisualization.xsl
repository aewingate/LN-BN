<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:msIdentifier/tei:idno"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>

                </title>
                <!--Create CSS styling so that output is in Noto Sans font. That way don't have to worry about special characters. -->
                <style>
                    body {
                        font-family: 'Noto Sans';
                        width: 80%;
                        margin-left: 7%;
                        margin-top: 3%;
                        print-color-adjust: exact;
                    }
                    ul {
                        list-style-type: none;
                    
                    }
                    li {
                    font-size: 1em;
                    font-weight: 300;
                    line-height: 1.4;
                    margin-bottom: 12px;
                    }
                   
                    h1 {
                        font-size: 200%;
                    }
                    h2 {
                        font-size: 175%;
                    }
                    h3 {
                        font-size: 150%;
                        color: black;
                    }
                    h4 {
                        font-size: 125%;
                    }
                    
                    /* styles text that you hover over*/
                    .abbr {
                        color: #0402a1;
                        background-color: transparent;
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
                    .sic {
                        
                        position: relative;
                        display: inline-block;
                        text-decoration: underline dashed black 2px;
                        /*border-bottom: 2px dashed black;*/
                    }
                    .unclear {
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
                    /*
                    .gap {
                        background-color: black;
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }*/
                    
                    /* styles the tooltip*/
                    .sic .corr {
                        visibility: hidden;
                        width: auto;
                        background-color: #555;
                        color: #fff;
                        text-align: center;
                        border-radius: 6px;
                        padding: 5px 5px;
                        position: absolute;
                        z-index: 1;
                        bottom: 100%;
                        left: 0%;
                        margin-left: 0%;
                        opacity: 0;
                        transition: opacity 0.3s;
                    }
                    .abbr .expan {
                        visibility: hidden;
                        width: auto;
                        background-color: #555;
                        color: #fff;
                        text-align: center;
                        border-radius: 6px;
                        padding: 5px 5px;
                        position: absolute;
                        z-index: 1;
                        bottom: 100%;
                        left: 0%;
                        margin-left: 0%;
                        opacity: 0;
                        transition: opacity 0.3s;
                    }
                    
                    .unclear .u_reason {
                        visibility: hidden;
                        width: auto;
                        background-color: #555;
                        color: #fff;
                        text-align: center;
                        border-radius: 6px;
                        padding: 5px 5px;
                        position: absolute;
                        z-index: 1;
                        bottom: 100%;
                        left: 0%;
                        margin-left: 0%;
                        opacity: 0;
                        transition: opacity 0.3s;
                    }
                    /*
                    .gap .g_reason {
                        visibility: hidden;
                        width: auto;
                        background-color: #555;
                        color: #fff;
                        text-align: center;
                        border-radius: 6px;
                        padding: 5px 5px;
                        position: absolute;
                        z-index: 1;
                        bottom: 100%;
                        left: 0%;
                        margin-left: 0%;
                        opacity: 0;
                        transition: opacity 0.3s;
                    } */
                    
                    .sic:hover .corr {
                        visibility: visible;
                        opacity: 1;
                    }
                    
                    .abbr:hover .expan {
                        visibility: visible;
                        opacity: 1;
                    }
                    
                    .unclear:hover .u_reason {
                        visibility: visible;
                        opacity: 1;
                    }
                    /*
                    .gap:hover .g_reason {
                        visibility: visible;
                        opacity: 1;
                    
                    }*/
                    
                    /* Visualization CSS */
                    .title {
                        background-color: green;
                        color: white;
                        
                    }
                    .author {
                        background-color: gold;
                    }
                    .persName {
                        background-color: goldenrod;
                        color: black;
                    }
                    .pubPlace {
                        background-color: orange;
                    }
                    .date {
                        background-color: coral;
                    }
                    .publisher {
                        background-color: peachpuff;
                    }
                    .format {
                        background-color: blue;
                        color: white;
                    }
                    .copies {
                        background-color: dimgray;
                        color: white;
                    }
                    .vol {
                        background-color: darkgray;
                    }
                    .simple_count {
                        background-color: lightgray;
                    }
                    .price {
                        background-color: darkviolet;
                        color: white;
                    }
                    .condition_age {
                        background-color: mistyrose;
                    }
                    .condition_binding {
                        background-color: pink;
                    }
                    .condition_size {
                        background-color: hotpink;
                    }
                    .condition_wear {
                        background-color: fuchsia;
                    }
                    .condition_value {
                        background-color: mediumvioletred;
                        color: white;
                    }
                    .method {
                        background-color: red;
                    }
                    .language {
                        background-color: greenyellow;
                    }
                    .content {
                        background-color: aqua;
                    }
                    .speech {
                        background-color: black;
                        color: white;
                    }
                    
                    div.sidebar {
                    height:100%;
                    width:25%;
                    right:0;
                    background-color:#fff;
                    position:fixed!important;
                    z-index:1;
                    overflow:auto
                    }
                    
                    ul.sidebar {
                        list-style-type: none;
                        margin-top: 0;
                        padding: 0;
                    }
                    li.sidebar {
                        text-align: left;
                        font-size: 1em;
                        font-weight: 300;
                        line-height: 1.2em;
                        margin-bottom: 5px;
                        
                    }
                    div.transcription{
                        margin-right: 25%;
                    }</style>

            </head>
            <body>
                <div class="sidebar">
                    <h2>Visualization Legend</h2>
                    <ul class="sidebar">
                        <li class="sidebar">
                            <span class="title">Title/Description of content</span>
                        </li>
                        <li class="sidebar">
                            <span class="author">Author named separately from title</span>
                        </li>
                        <li class="sidebar">
                            <span class="persName">Author named as part of title</span>
                        </li>
                        <li class="sidebar">
                            <span class="pubPlace">Publication place</span>
                        </li>
                        <li class="sidebar">
                            <span class="date">Publication date</span>
                        </li>
                        <li class="sidebar">
                            <span class="publisher">Publisher</span>
                        </li>
                        <li class="sidebar">
                            <span class="format">Format</span>
                        </li>
                        <li class="sidebar">
                            <span class="copies">Copies</span>
                        </li>
                        <li class="sidebar">
                            <span class="vol">Volumes</span>
                        </li>
                        <li class="sidebar">
                            <span class="simple_count">Count (no. of codices)</span>
                        </li>
                        <li class="sidebar">
                            <span class="price">Price/Valuation</span>
                        </li>
                        <li class="sidebar">
                            <span class="condition_age">Age</span>
                        </li>
                        <li class="sidebar">
                            <span class="condition_binding">Binding</span>
                        </li>
                        <li class="sidebar">
                            <span class="condition_size">Size (not format)</span>
                        </li>
                        <li class="sidebar">
                            <span class="condition_wear">Wear</span>
                        </li>
                        <li class="sidebar">
                            <span class="condition_value">Value</span>
                        </li>
                        <li class="sidebar">
                            <span class="method">Creation method</span>
                        </li>
                        <li class="sidebar">
                            <span class="language">Language</span>
                        </li>
                        <li class="sidebar">
                            <span class="content">Text quoted from book interior</span>
                        </li>
                        <li class="sidebar">
                            <span class="speech">Oral speech from inventory dictation</span>
                        </li>
                    </ul>
                </div>
               <div class="transcription"> <h1>
                    <xsl:value-of select="//tei:msIdentifier/tei:idno[1]"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                </h1>

                <h2>Manuscript information | Información del manuscrito</h2>
                <ul>
                    <li>Archive | Archivo: <xsl:value-of select="//tei:msIdentifier/tei:repository"
                        /></li>
                    <li>Collection | Fondo: <xsl:value-of select="//tei:msIdentifier/tei:collection"
                        /></li>
                    <li>Shelfmark | Referencia: <xsl:value-of
                            select="//tei:msIdentifier/tei:idno[1]"/></li>
                </ul>
                <h2>Text Legend</h2>
                <ul>
                    <li
                        style="text-decoration:underline 2px dashed black">sic,
                        correction unknown</li>
                    <li
                        style="color:#0402a1; text-decoration:underline 1px dotted black"
                        >abbreviation, expansion unknown</li>
                    <li>
                        <i>unclear without explanation</i>
                    </li>
                    <li style="text-decoration:underline 1px dotted black">
                        <i>unclear, hover for explanation</i>
                    </li>
                    <!--<li><span class="gap">___</span> illegible text, hover for explanation </li>
                    <li>
                        <sub style="color:#cb34c6">comment</sub>
                    </li>-->
                    
                </ul>
                    
                    
                
                    <h2>Normalized Transcription with Visualization</h2>
                    <xsl:apply-templates select="//tei:body"/></div>
                
            </body>
        </html>
    </xsl:template>

    <!-- general transcription elements -->
    <xsl:template match="tei:text">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- p and list removed for visualization to focus on bibls -->
    <xsl:template match="tei:p"/>
    <xsl:template match="tei:list"/>
    <xsl:template
        match="tei:milestone[following-sibling::tei:div[descendant::tei:bibl and position() = 1] or ancestor::tei:bibl]">
        <h3>fol. <xsl:value-of select="./@n"/></h3>
    </xsl:template>


    <xsl:template match="tei:listBibl">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:bibl">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="tei:head">
        <h4>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>

    <xsl:template match="tei:hi">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:hi[@rend='super']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
    <!-- textual changes for normalized -->
    <!-- del, empty -->
    <xsl:template match="tei:del"/>

    <!-- add -->
    <xsl:template match="tei:add">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:choice">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- abbr/expan -->
    <xsl:template match="tei:abbr">
        <xsl:choose>
            <xsl:when
                test=".[following-sibling::tei:expan[not(child::text())] or not(following-sibling::tei:expan)]">
                <span class="abbr">
                    <xsl:apply-templates/>
                    <span class="expan">Expansion unknown</span>
                </span>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:expan">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- sic/corr -->

    <xsl:template match="tei:sic[not(@rend = 'repeat')]">
        <xsl:choose>
            <xsl:when test=".[not(following-sibling::tei:corr)]">
                <span class="sic">
                    <xsl:apply-templates/>
                    <span class="corr"> correction unknown </span>
                </span>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- sic for repeats, empty template -->
    <xsl:template match="tei:sic[@rend = 'repeat']"/>


    <!-- orig/reg; empty template orig. All origs should have reg -->
    <xsl:template match="tei:orig"/>
    <xsl:template match="tei:reg">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- all unclear templates same as diplomatic  -->
    <!-- unclear, no reason or extent -->
    <xsl:template match="tei:unclear[not(@reason) and not(@extent)]">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    <!-- unclear, reason -->
    <xsl:template match="tei:unclear[@reason and not(@extent)]">
        <span class="unclear">
            <i>
                <xsl:apply-templates/>
            </i>
            <span class="u_reason">unclear; <xsl:value-of select="./@reason"/>
            </span>
        </span>
    </xsl:template>
    <!-- empty element unclear, reason and extent -->
    <xsl:template match="tei:unclear[@extent and @reason]">
        <span class="unclear">
            <i>___</i>
            <span class="u_reason">unclear; <xsl:value-of select="./@reason"/><br/> extent:
                    <xsl:value-of select="./@extent"/>
            </span>
        </span>
    </xsl:template>

    <!-- gap, removed for visualization -->
    <xsl:template match="tei:gap"/>

    <!-- damage -->
    <xsl:template match="tei:damage">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- supplied -->
    <xsl:template match="tei:supplied">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- comments removed for visualizations -->
    <xsl:template match="//comment()"/>


    <!-- fw removed for visualizations-->
    <xsl:template match="tei:fw"/>

    <!-- alignments -->
    <!--
    <xsl:template match="*[@place='left']">
        <span style="text-align: left">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="*[@place='right']">
        <span style="text-align: right">
            <xsl:apply-templates/>
        </span>
    </xsl:template>-->

    <!-- visualization templates -->
    <xsl:template match="tei:title">
        <span class="title">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:persName">
        <span class="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:author">
        <span class="author">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:pubPlace">
        <span class="pubPlace">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:date[ancestor::tei:bibl]">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:publisher">
        <span class="publisher">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:measure[@type = 'format']">
        <span class="format">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:measure[@unit = 'copies']">
        <span class="copies">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:measure[@unit = 'vol']">
        <span class="vol">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:measure[@unit = 'simple_count']">
        <span class="simple_count">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:measure[@unit = 'ducados' or @unit = 'reales' or @unit = 'maravedis']">
        <span class="price">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note[@type = 'condition' and @subtype = 'age']">
        <span class="condition_age">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note[@type = 'condition' and @subtype = 'binding']">
        <span class="condition_binding">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note[@type = 'condition' and @subtype = 'size']">
        <span class="condition_size">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note[@type = 'condition' and @subtype = 'wear']">
        <span class="condition_wear">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note[@type = 'condition' and @subtype = 'value']">
        <span class="condition_value">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:note[@type = 'method']">
        <span class="method">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:textLang">
        <span class="language">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:q">
        <span class="content">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:distinct">
        <span class="speech">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
