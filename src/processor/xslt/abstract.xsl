<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:import href="html/paragraphs.xsl"/>
  <xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes"/>
  <xsl:include href="html/lists.xsl"/>
  <xsl:include href="html/definition_lists.xsl"/>
  <xsl:include href="html/footnotes.xsl"/>
  <xsl:include href="html/directives.xsl"/>
  <xsl:include href="html/line_blocks.xsl"/>
  <xsl:include href="html/inline_formats.xsl"/>
  <xsl:include href="html/quotes.xsl"/>
  <xsl:include href="html/tables.xsl"/>
  <xsl:include href="html/literal_block.xsl"/>
  <xsl:include href="html/comments.xsl"/>
  <xsl:include href="html/hyperlinks.xsl"/>
  <xsl:include href="html/errors.xsl"/>
  <xsl:include href="html/substitutions.xsl"/>
  <xsl:include href="html/field_lists.xsl"/>
  <xsl:include href="html/text_roles.xsl"/>
  <xsl:template match="title">
    <!-- Remove title tags -->
  </xsl:template>
  <xsl:template match="/topic">
    <!-- Remove the surrounding topic -->
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="paragraph">
    <!-- surrounding p tags are removed because the abstract should only be
    one paragraph -->
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
