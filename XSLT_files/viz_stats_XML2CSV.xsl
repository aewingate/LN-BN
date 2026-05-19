<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        shelfmark,manuscript title,total entries,title only,author only,title and author,no title/author,publication place,publication date, publisher,format,copies,volumes,codices,price,age,binding,size,wear,value,typeface,method,language,content,speech
<xsl:apply-templates select="//ms"/></xsl:template>
    <xsl:template match="ms">"<xsl:apply-templates select="id"/>","<xsl:apply-templates select="mstitle"/>",<xsl:apply-templates select="bibl_total"/>,<xsl:apply-templates select="bibl_titleonly"/>,<xsl:apply-templates select="bibl_authoronly"/>,<xsl:apply-templates select="bibl_titleauthor"/>,<xsl:apply-templates select="bibl_noauthortitle"/>,<xsl:apply-templates select="pubPlace"/>,<xsl:apply-templates select="pubDate"/>,<xsl:apply-templates select="publisher"/>,<xsl:apply-templates select="format"/>,<xsl:apply-templates select="copies"/>,<xsl:apply-templates select="volumes"/>,<xsl:apply-templates select="codices"/>,<xsl:apply-templates select="price"/>,<xsl:apply-templates select="age"/>,<xsl:apply-templates select="binding"/>,<xsl:apply-templates select="size"/>,<xsl:apply-templates select="wear"/>,<xsl:apply-templates select="value"/>,<xsl:apply-templates select="typeface"/>,<xsl:apply-templates select="method"/>,<xsl:apply-templates select="language"/>,<xsl:apply-templates select="content"/>,<xsl:apply-templates select="speech"/>,
    </xsl:template>
    <xsl:template match="id">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="mstitle">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="bibl_total">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="bibl_titleonly">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="bibl_authoronly">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="bibl_titleauthor">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="bibl_noauthortitle">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="pubPlace">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="pubDate">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="publisher">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="format">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="copies">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="volumes">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="codices">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="price">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="age">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="binding">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="size">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wear">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="value">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="typeface">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="method">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="language">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="content">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="speech">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>