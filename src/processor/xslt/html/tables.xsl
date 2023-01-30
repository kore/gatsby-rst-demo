<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="table">
    <table>
      <xsl:apply-templates/>
    </table>
  </xsl:template>
  <xsl:template match="thead">
    <thead>
      <xsl:apply-templates/>
    </thead>
  </xsl:template>
  <xsl:template match="tbody">
    <tbody>
      <xsl:apply-templates/>
    </tbody>
  </xsl:template>
  <xsl:template match="row">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>
  <xsl:template match="thead/row/entry">
    <th>
      <xsl:if test="@morecols">
        <xsl:attribute name="colspan">
          <xsl:value-of select="@morecols + 1"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </th>
  </xsl:template>
  <xsl:template match="tbody/row/entry">
    <td>
      <xsl:if test="@morecols">
        <xsl:attribute name="colspan">
          <xsl:value-of select="@morecols + 1"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </td>
  </xsl:template>
  <xsl:template match="entry/paragraph">
    <p class="cell">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
</xsl:stylesheet>
