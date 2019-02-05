<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:tei="http://www.tei-c.org/ns/1.0"
      xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="tei:TEI">
    <html>
      <head>
        <link href="style1.css" rel="stylesheet" type="text/css" />
        <script src="http://code.jquery.com/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script src="main.js" type="text/javascript" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous" />
      </head>
      <body>

        <div class="dropdown">
          <a href="1RIS.html">
            <img src="menu.png" id="menu" alt="menu" class="dropbtn"/>
          </a>
          <div class="dropdown-content">
            <a href="1RIS.html">Home</a>
            <a href="c7694-064.html">Fievre d'amour</a>
            <a href="c7694-092.html">Donna in posa</a>
            <a href="c7694-175.html">Dono della morte</a>
          </div>
        </div>

        <xsl:variable name="id" select="@xml:id" />
        <h2><xsl:value-of select="//tei:titleStmt/tei:title" /></h2>


        <div class="right">   <!--div di destra che contiene il testo-->

          <div id="tools">
            <button id="butInfo" type="button" >Info</button>
            <button id="butCont" type="button" >Contenuti</button>
          </div>

          <div class="container">
          <div id="infoF">
            <h3>Informazioni sull'opera d'arte</h3>
            <p>Titolo: <xsl:value-of select="//tei:bibl/tei:title" /></p>
            <p>Autore: <xsl:value-of select="//tei:support/tei:p/tei:persName" /></p>
            <xsl:for-each select="//tei:textClass/tei:keywords/tei:term">
              <xsl:if test="position() > 2">
               <p>Descrizione: <xsl:value-of select="." /></p>
              </xsl:if>
            </xsl:for-each>
            <h3>Informazioni identificative della cartolina</h3>
            <p>Editore:
              <xsl:choose>
                <xsl:when test="//tei:bibl/tei:publisher/tei:persName">
                    <xsl:value-of select="//tei:bibl/tei:publisher/tei:persName" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//tei:bibl/tei:publisher/tei:orgName" />
                </xsl:otherwise>
              </xsl:choose>
            </p>
            <p>Luogo di pubblicazione: <xsl:value-of select="//tei:bibl/tei:pubPlace" /></p>
            <p>Data di pubblicazione: <xsl:value-of select="//tei:bibl/tei:date" /></p>
            <p>Dimensioni: <xsl:value-of select="//tei:support/tei:dimensions/tei:height" />x<xsl:value-of select="//tei:support/tei:dimensions/tei:width" /><xsl:value-of select="//tei:support/tei:dimensions/@unit" /></p>

            <h3>Informazioni generali</h3>
            <p>
              <xsl:value-of select="//tei:support/tei:p" />
            </p>
            <i>Cartolina conservata al <xsl:value-of select="//tei:msIdentifier/tei:repository" />, <xsl:value-of select="//tei:msIdentifier/tei:settlement" /></i>
          </div>

          <div id="contenutiF">

            <h3>Descrizione contenuti immagine:</h3>
            <xsl:for-each select="//tei:figDesc">
              <p>
                <xsl:value-of select="." />
              </p>
            </xsl:for-each>

          </div>


          <div id="infoR">

            <h3>Informazioni mittente</h3>
            <p>Nome: <xsl:value-of select="//tei:correspAction[@type='sent']/tei:persName" /></p>
            <p>Luogo: <xsl:value-of select="//tei:correspAction[@type='sent']/tei:placeName" /></p>
            <p>Data: <xsl:value-of select="//tei:correspAction[@type='sent']/tei:date[@type='writing']" /></p>
            <h3>Informazioni destinatario</h3>
            <p>Nome: <xsl:value-of select="//tei:correspAction[@type='received']/tei:persName" /></p>
            <p>Luogo: <xsl:value-of select="//tei:correspAction[@type='received']/tei:placeName" /></p>
            <p>Data: <xsl:value-of select="//tei:correspAction[@type='received']/tei:date[@type='postmark']" /></p>
            <h3>Informazioni corrispondenza</h3>
            <p><xsl:value-of select="//tei:support/tei:stamp[@type='postage']" /></p>
            <xsl:for-each select="//tei:support/tei:stamp[@type='postmark']">
            <p>  <xsl:value-of select="." /></p>
            </xsl:for-each>

          </div>

          <div id="contenutiR">

              <p><xsl:value-of select="//tei:opener/tei:dateline/tei:s" /></p>
              <p>
                <xsl:for-each select="//tei:div[@type='postcard-body']/tei:p/tei:s//child::text()" >
                             <xsl:value-of select="." />
                             <br />
                </xsl:for-each>
              </p>

                <xsl:for-each select="//tei:salute/tei:s" >
                  <xsl:for-each select="text()|*">
                    <xsl:choose>
                      <xsl:when test="self::tei:choice">
                        <xsl:value-of select="tei:abbr" />
                      </xsl:when>

                      <xsl:when test="self::tei:persName">
                        <xsl:value-of select="." />
                      </xsl:when>

                      <xsl:when test="self::text()">
                        <xsl:value-of select="." />
                      </xsl:when>

                      <xsl:when test="self::tei:lb">
                        <br />
                      </xsl:when>

                    </xsl:choose>
                  </xsl:for-each>
                </xsl:for-each>


              <p><xsl:value-of select="//tei:closer/tei:signed" /></p>

              <br />
              <i><xsl:value-of select="//tei:front/tei:div[@type='print']/tei:p" /></i>



               <p>-------------------------------------------------------</p>

               <p><xsl:value-of select="//tei:back//tei:num" /></p>

              <p>
                <xsl:value-of select="//tei:stamp[@type='postage']/tei:mentioned" />
                <br />
                <xsl:value-of select="//tei:stamp[@type='postage']/tei:note" />
              </p>

              <p>
                <xsl:for-each select="//tei:stamp[@type='postmark']/tei:mentioned" >
                              <xsl:value-of select="." />
                              <br />
                </xsl:for-each>
              </p>

              <p>
                <xsl:for-each select="//tei:div[@type='address-destination']/tei:ab/tei:address/tei:addrLine" >
                  <xsl:for-each select="text()|*">
                    <xsl:choose>
                      <xsl:when test="self::tei:choice">
                        <xsl:value-of select="tei:abbr" />
                      </xsl:when>

                      <xsl:when test="self::text()|self::*">
                        <xsl:value-of select="." />
                      </xsl:when>
                    </xsl:choose>
                  </xsl:for-each>
                  <br />
                </xsl:for-each>
              </p>

              <p><xsl:value-of select="//tei:back/tei:div/tei:ab[@type='print']/tei:num" /></p>
          </div>
        </div>
        </div>


        <div class="left">  <!--div di sinistra che contiene la cartolina-->

          <div id="tools">
            <select>
              <option id="fronte" selected="selected" value="{$id}F">Fronte</option>
              <option id="retro" value="{$id}R">Retro</option>
            </select>

            <button id="butRuota" type="button" ><i class="fas fa-redo"></i></button>

          </div>

          <div id="CimgC">
            <div id="imgC">
              <img id="foto" src="{$id}F.jpg" alt="cartolina" class="ruota0"></img>
            </div>
          </div>

        </div>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
