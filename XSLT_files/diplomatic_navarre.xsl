<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
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
                       /* font-family: 'Newton Sans'; */
                        width: 70%;
                        margin-left: 7%;
                        margin-top: 3%;
                        margin-right: 23%
                    }
                    ul {
                        list-style-type: none;
                    }
                    h1 {
                    font-size: 200%;
                    }
                    h2 {
                    font-size: 175%;
                    }
                    h3 {
                    font-size: 150%;
                    }
                    h4 {
                    font-size: 125%;
                    }
                    .del {
                        text-decoration: line-through 1px black;
                    }
                    .add {
                    color: #7300e6;
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
                        color: #c70906;
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
                    .unclear {
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
                    .gap {
                        background-color: black;
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
                    .damage {
                        color: #6b6b6b;
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
                    .supplied {
                        color: #12b01a;
                        position: relative;
                        display: inline-block;
                        border-bottom: 1px dotted black;
                    }
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
                    }
                    
                    .damage .d_reason {
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
                    
                    .supplied .s_reason {
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
                    .gap:hover .g_reason {
                        visibility: visible;
                        opacity: 1;
                    
                    }
                    .damage:hover .d_reason {
                        visibility: visible;
                        opacity: 1;
                    
                    }
                    
                    .supplied:hover .s_reason {
                        visibility: visible;
                        opacity: 1;
                    
                    }</style>

            </head>
            <body>
                <h1>
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
                    <li>Other identifiers | Otras signaturas: <xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:idno/@source"/></li>
                </ul>
                <h2>Legend</h2>
                <ul>
                    <li style="color:#c70906; text-decoration:underline 1px dotted black">sic, hover
                        for corrected text</li>
                    <li style="color:#0402a1; text-decoration:underline 1px dotted black"
                        >abbreviation, hover for expansion</li>
                    <li style="color:#12b01a;text-decoration:underline 1px dotted black">supplied
                        text, hover for explanation</li>
                    <li>
                        <mark>unclear without explanation</mark>
                    </li>
                    <li style="text-decoration:underline 1px dotted black">
                        <mark>unclear, hover for explanation</mark>
                    </li>
                    <li style="color:#6b6b6b;text-decoration:underline 1px dotted black">damaged
                        text, hover for explanation</li>
                    <li style="text-decoration:line-through 1px black">deleted text</li>
                    <li class="add">added text</li>
                    <li><span class="gap">___</span> illegible text, hover for explanation </li>
                    <li>
                        <sub style="color:#cb34c6">comment</sub>
                    </li>

                </ul>
                <h2>Diplomatic Transcription</h2>
                <xsl:apply-templates select="//tei:body"/>
                
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
    <xsl:template match="tei:milestone">
        <h3>fol. <xsl:value-of select="./@n"/></h3>
    </xsl:template>
    <xsl:template match="tei:date">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
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
    <xsl:template match="tei:list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="//tei:lb">
        <br/>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'super']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    <!-- textual changes for diplomatic -->
    <!-- del -->
    <xsl:template match="tei:del">
        <span class="del">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!-- add -->
    <xsl:template match="tei:add">
        <xsl:if test=".[@rend = 'caret']">
            <sub>^</sub>
        </xsl:if>
        <xsl:choose>
            <xsl:when test=".[@place = 'super']">
                <sup class="add">
                    <xsl:apply-templates/>
                </sup>
            </xsl:when>
            <xsl:when test=".[@place = 'sub']">
                <sub class="add">
                    <xsl:apply-templates/>
                </sub>
            </xsl:when>
            <xsl:when test=".[@place = 'inline']">
                <span class="add">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:choice">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- abbr/expan -->
    <xsl:template match="tei:abbr">
        <span class="abbr">
            <xsl:apply-templates/>
            <span class="expan">
                <xsl:value-of select="following-sibling::tei:expan"/>
            </span>
        </span>
    </xsl:template>
    <xsl:template match="tei:expan"/>

    <!-- sic/corr -->
    <xsl:template match="tei:sic[not(@rend = 'repeat')]">
        <span class="sic">
            <xsl:apply-templates/>
            <span class="corr">
                <xsl:value-of select="following-sibling::tei:corr"/>
            </span>
        </span>
    </xsl:template>

    <xsl:template match="tei:corr"/>

    <!-- sic for repeats -->
    <xsl:template match="tei:sic[@rend = 'repeat']">
        <span class="sic">
            <xsl:apply-templates/>
            <span class="corr">repeated word</span>
        </span>
    </xsl:template>

    <!-- orig/reg -->
    <xsl:template match="tei:orig">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:reg"/>


    <!-- unclear, no reason or extent -->
    <xsl:template match="tei:unclear[not(@reason) and not(@extent)]">
        <mark>
            <xsl:apply-templates/>
        </mark>
    </xsl:template>
    <!-- unclear, reason -->
    <xsl:template match="tei:unclear[@reason and not(@extent)]">
        <span class="unclear">
            <mark>
                <xsl:apply-templates/>
            </mark>
            <span class="u_reason">unclear; <xsl:value-of select="./@reason"/>
            </span>
        </span>
    </xsl:template>
    <!-- empty element unclear, reason and extent -->
    <xsl:template match="tei:unclear[@extent and @reason]">
        <span class="unclear">
            <mark>___</mark>
            <span class="u_reason">unclear; <xsl:value-of select="./@reason"/><br/> extent:
                    <xsl:value-of select="./@extent"/>
            </span>
        </span>
    </xsl:template>

    <!-- gap -->
    <xsl:template match="tei:gap">
        <span class="gap">___<span class="g_reason">illegible; <xsl:value-of select="./@reason"
                /><br/> extent: <xsl:value-of select="./@extent"/>
            </span>
        </span>
    </xsl:template>

    <!-- damage -->
    <xsl:template match="tei:damage">
        <span class="damage">
            <xsl:apply-templates/>
            <span class="d_reason">damaged: <xsl:value-of select="./@type"/>
            </span>
        </span>
    </xsl:template>

    <!-- supplied -->
    <xsl:template match="tei:supplied">
        <span class="supplied">
            <xsl:apply-templates/>
            <span class="s_reason">supplied; <xsl:value-of select="./@reason"/></span>
        </span>
    </xsl:template>

    <!-- comments -->
    <xsl:template match="//comment()">
        <sub style="color:#cb34c6">
            <xsl:value-of select="."/>
            <xsl:if test=".[following-sibling::comment()]">
                <br/>
                <br/>
            </xsl:if>
        </sub>
    </xsl:template>
    <!-- fw -->

    <xsl:template match="tei:fw[not(@type='signature')]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:fw[@type='signature']">
        <span style="font-family:Times New Roman, serif; font-style: oblique">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <!-- alignments -->
<!--
    <xsl:template match="*[@place='left']">
        <p style="text-align:left">
            <xsl:apply-templates mode="format"/>
        </p>
    </xsl:template>
    <xsl:template match="*[@place='right']">
        <p style="text-align:right">
            <xsl:apply-templates mode="format"/>
        </p>
    </xsl:template>-->

</xsl:stylesheet>
