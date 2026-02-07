<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:media="http://search.yahoo.com/mrss/">

  <xsl:template match="/">
    <html>
      <head>
        <title>RSS Feed</title>
        <style>
					body { font-family: Arial, sans-serif; margin: 12px; }
					h1 { color: #006600; }
					.item { margin-bottom: 30px; border-bottom: 1px solid #ccc; padding-bottom: 20px; }
					.item img { max-width: 300px; display: block; margin-top: 10px; }
					.pubDate { font-style: italic; color: #666; margin-top: 5px; }
					a {
					color: #006600;
					text-decoration: none;
					}
				</style>
      </head>
      <body>
        <h1><xsl:value-of select="rss/channel/title"/></h1>
        <xsl:for-each select="rss/channel/item">
          <div class="item">
            <h2><a href="{link}"><xsl:value-of select="title"/></a></h2>
						<p class="pubDate"><xsl:value-of select="pubDate"/></p>
						<p><xsl:value-of select="description"/></p>
            <xsl:if test="media:content">
              <img src="{media:content/@url}" alt="Image" />
            </xsl:if>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
