<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

    <html>
        <head>
            <title>Xml Table</title>
        </head>
        <body>
            <table border='2' cellpadding='10' cellspacing='5'>
            <tr>
                <th>name</th>
                <th>email</th>
                <th>age</th>
                <th>image</th>
            </tr>

            <xsl:for-each select="aptech/student">
                <tr>
                    <td><xsl:value-of select='name'/></td>
                    <td><xsl:value-of select='email'/></td>
                    <td><xsl:value-of select='age'/></td>
                    <td><img src='{image}' width='100' height='100' alt='phone image'></img></td>
                </tr>
            </xsl:for-each>
            </table>    
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>