<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tei="http://www.tei-c.org/ns/1.0"
      xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="tei:teiCorpus">
    <html>
      <head>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script src="http://code.jquery.com/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script src="mainJQ.js" type="text/javascript" />
      </head>
      <body>
        <img src="info.png" id="i" alt="info" />
        <h2>CARTOLINE DELLA GRANDE GUERRA</h2>
        <div id="testoInfo">
          <xsl:for-each select="tei:teiHeader[@xml:id='list']//tei:titleStmt/tei:respStmt">
            <xsl:if test="position() > 1">
             <p><xsl:value-of select="." /></p>
            </xsl:if>
          </xsl:for-each>
            <p><xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:editionStmt/tei:edition" /></p>
            <xsl:for-each select="tei:teiHeader[@xml:id='list']//tei:editionStmt/tei:respStmt">
              <xsl:if test="position() > 1">
               <p><xsl:value-of select="." /></p>
              </xsl:if>
            </xsl:for-each>
            <p>Pubblicato da:<xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:publicationStmt/tei:publisher" /></p>
            <p>Distribuito da: <xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:publicationStmt/tei:distributor/tei:choice/tei:expan" /></p>
            <i><xsl:value-of select="tei:teiHeader[@xml:id='list']//tei:publicationStmt/tei:availability" /></i>
        </div>
        <div class="home">
          <xsl:for-each select="tei:TEI">
            <xsl:variable name="id" select="@xml:id" />
              <a href="{$id}.html"> <!--e' il link che contiene l'immagine e il titolo cliccabili-->
                <img src="{$id}.jpg" alt="{$id}" />
                <p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" /></p>
              </a>
          </xsl:for-each>
        </div>
        <footer>
          <h3> Progetto realizzato per il corso di Codifica di Testi, a. a. 2018/2019 da:</h3>
          <h3>
            <xsl:for-each select="tei:teiHeader[@xml:id='list']//tei:titleStmt//tei:persName">
              <xsl:value-of select="." />
              <br />
            </xsl:for-each>
          </h3>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
