<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:extension-element-prefixes="php" version="1.0">
  <xsl:template match="image">
    <xsl:choose>
      <xsl:when test="parent::paragraph">
        <img>
          <xsl:attribute name="class">img-responsive</xsl:attribute>
          <xsl:attribute name="src">
            <xsl:value-of select="@uri"/>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="@alt"/>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="@alt"/>
          </xsl:attribute>
          <xsl:if test="@width">
            <xsl:attribute name="width">
              <xsl:value-of select="@width"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@height">
            <xsl:attribute name="height">
              <xsl:value-of select="@height"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:apply-templates/>
        </img>
      </xsl:when>
      <xsl:otherwise>
        <div>
          <xsl:attribute name="class">
					image
					<xsl:choose><xsl:when test="@align"><xsl:value-of select="@align"/></xsl:when><xsl:otherwise>
							center
						</xsl:otherwise></xsl:choose>
					<xsl:text> </xsl:text>
					<xsl:if test="@classes"><xsl:value-of select="@classes"/></xsl:if>
				</xsl:attribute>
          <xsl:if test="@width">
            <xsl:attribute name="style">width: <xsl:value-of select="@width"/>;</xsl:attribute>
          </xsl:if>
          <xsl:if test="@height">
            <xsl:attribute name="style">height: <xsl:value-of select="@height"/>;</xsl:attribute>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="substring(@uri, string-length( @uri ) - 3 ) = '.svg'">
              <object><xsl:attribute name="data"><xsl:value-of select="@uri"/></xsl:attribute>
							Your browser needs to support SVG to display this image.
						</object>
            </xsl:when>
            <xsl:when test="contains(@uri, 'youtube.com/embed')">
              <iframe frameborder="0" allowfullscreen="allowfullscreen"><xsl:attribute name="src"><xsl:value-of select="@uri"/></xsl:attribute>
							Your browser needs to support frames.
						</iframe>
            </xsl:when>
            <xsl:when test="substring(@uri, string-length( @uri ) - 3 ) = '.swf'">
              <object type="application/x-shockwave-flash"><xsl:attribute name="data"><xsl:value-of select="@uri"/></xsl:attribute><param name="movie"><xsl:attribute name="value"><xsl:value-of select="@uri"/></xsl:attribute></param>
							Your browser needs to support Flash contents to display this image.
						</object>
            </xsl:when>
            <xsl:otherwise>
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="@uri"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="@alt"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="@alt"/>
                </xsl:attribute>
                <xsl:attribute name="class">img-responsive</xsl:attribute>
                <xsl:apply-templates/>
              </img>
            </xsl:otherwise>
          </xsl:choose>
          <span class="image_title">
            <xsl:value-of select="@alt"/>
          </span>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
