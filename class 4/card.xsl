<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- root template -->
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>Catalog Cards</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; background:#f6f6f6; }
          .grid { display:flex; flex-wrap:wrap; gap:16px; }
          .card {
            background:white; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.08);
            width:240px; overflow:hidden; display:flex; flex-direction:column;
          }
          .card img { width:100%; height:140px; object-fit:cover; display:block; }
          .card-body { padding:12px; flex:1; display:flex; flex-direction:column; }
          .title { font-size:16px; font-weight:700; margin-bottom:6px; }
          .desc { font-size:13px; color:#555; margin-bottom:12px; flex:1; }
          .footer { display:flex; justify-content:space-between; align-items:center; padding:0 12px 12px; }
          .price { font-weight:700; color:#1a73e8; }
          .btn { background:#1a73e8; color:white; padding:6px 10px; border-radius:6px; text-decoration:none; font-size:13px; }
        </style>
      </head>
      <body>
        <h2>Catalog</h2>
        <div class="grid">
          <!-- loop through each item -->
          <xsl:for-each select="catalog/item">
            <div class="card">
              <xsl:choose>
                <xsl:when test="string-length(image) &gt; 0">
                  <img>
                    <xsl:attribute name="src">
                      <xsl:value-of select="image"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                      <xsl:value-of select="title"/>
                    </xsl:attribute>
                  </img>
                </xsl:when>
                <xsl:otherwise>
                  <!-- fallback image -->
                  <img src="https://via.placeholder.com/160" alt="{title}"/>
                </xsl:otherwise>
              </xsl:choose>

              <div class="card-body">
                <div class="title"><xsl:value-of select="title"/></div>
                <div class="desc"><xsl:value-of select="desc"/></div>
              </div>

              <div class="footer">
                <div class="price">Rs <xsl:value-of select="price"/></div>
                <a class="btn" href="#">Buy</a>
              </div>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>