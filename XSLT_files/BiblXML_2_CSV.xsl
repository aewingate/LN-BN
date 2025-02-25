<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
 
    <xsl:template match="/">
        transcription,folio location,order in sequence,internal notes
<xsl:for-each select="//tei:listBibl/tei:bibl">
            "<xsl:apply-templates select="."/>",<xsl:value-of select="./preceding::tei:milestone[1]/@n"/>,<xsl:value-of select="count(./preceding::tei:bibl)+1"/>,"<xsl:if test=".//comment()"><xsl:for-each select=".//comment()">Comment: <xsl:value-of select="."/>. </xsl:for-each></xsl:if><xsl:if test=".//tei:unclear">Unclear words: <xsl:for-each select=".//tei:unclear"><xsl:value-of select="."/>, </xsl:for-each>. </xsl:if><xsl:if test=".//tei:abbr[not(following-sibling::tei:expan)]">Unexpanded abbr: <xsl:for-each select=".//tei:abbr[not(following-sibling::tei:expan)]"><xsl:value-of select="."/>, </xsl:for-each>.</xsl:if><xsl:if test=".//tei:sic[not(following-sibling::tei:corr)]">Uncorrected sic: <xsl:for-each select=".//tei:sic[not(following-sibling::tei:corr)]"><xsl:value-of select="."/>, </xsl:for-each>.</xsl:if>"</xsl:for-each>    
    </xsl:template>
    <xsl:template match="tei:text/tei:body//tei:listBibl">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:bibl">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:hi">
        <xsl:apply-templates/>
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
            <xsl:when test=".[not(following-sibling::tei:expan)]">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template><!-- abbr empty because will do xsl:value-of in the comments to say which are unexpanded -->
    <xsl:template match="tei:expan">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- sic/corr -->
    
    <xsl:template match="tei:sic[not(@rend ='repeat')]">
        <xsl:choose>
            <xsl:when test=".[not(following-sibling::tei:corr)]">
                    <xsl:apply-templates/>
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
    
    <!-- gaps -->
    <xsl:template match="tei:gap[@reason='illegible']">
        [illegible text]
    </xsl:template>
    <xsl:template match="tei:gap[@reason='cancelled']"/>
    
    <!-- unclear -->
    <xsl:template match="tei:unclear">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>