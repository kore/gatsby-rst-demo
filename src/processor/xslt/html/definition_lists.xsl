<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="definition_list/definition_list_item/term">
    <dt>
      <xsl:apply-templates/>
    </dt>
  </xsl:template>
  <xsl:template match="definition_list/definition_list_item/definition">
    <dd>
      <xsl:apply-templates/>
    </dd>
  </xsl:template>
  <xsl:template match="definition_list/definition_list_item/definition/paragraph">
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
