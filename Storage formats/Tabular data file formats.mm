<map version="freeplane 1.5.9">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Storage&#xa;formats&#xa;of&#xa;tabular&#xa;data" FOLDED="false" ID="ID_192112974" CREATED="1536914601321" MODIFIED="1536934394754" VGAP_QUANTITY="20.0 pt"><hook NAME="MapStyle" zoom="1.61">
    <properties show_icon_for_attributes="true" fit_to_viewport="false;" show_note_icons="true"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" COLOR="#000000" STYLE="fork">
<font NAME="Lato" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="16"/>
<edge WIDTH="3"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" STYLE="fork">
<font SIZE="16"/>
<edge WIDTH="2"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" STYLE="bubble">
<font SIZE="14"/>
<edge WIDTH="thin"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="HEADINGS"/>
<edge WIDTH="thin"/>
<node TEXT="Text" POSITION="right" ID="ID_1620824997" CREATED="1536914654995" MODIFIED="1536919246572" VGAP_QUANTITY="20.0 pt" HGAP_QUANTITY="31.249999485909953 pt">
<cloud COLOR="#e5ffe5" SHAPE="ROUND_RECT"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <i>import with </i>
    </p>
    <p>
      <i>generic </i>
    </p>
    <p>
      <i>text parsing </i>
    </p>
    <p>
      <i>functions</i>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="CSV" ID="ID_500396503" CREATED="1536914683822" MODIFIED="1536916400176">
<node TEXT="separators" ID="ID_1395374900" CREATED="1536914698801" MODIFIED="1536915050710">
<node TEXT=", (comma)" ID="ID_1676513227" CREATED="1536914979482" MODIFIED="1536915255299"/>
<node TEXT="; (semi-colon)" ID="ID_1505498195" CREATED="1536914982785" MODIFIED="1536915390257"/>
<node TEXT="\t (tab)" ID="ID_583275309" CREATED="1536914985236" MODIFIED="1536915402714"/>
</node>
<node TEXT="decimal point" ID="ID_1856861267" CREATED="1536915259536" MODIFIED="1536915297364">
<node TEXT=". (US)" ID="ID_408368640" CREATED="1536915305320" MODIFIED="1536915318763"/>
<node TEXT=", (FR)" ID="ID_231252972" CREATED="1536915308799" MODIFIED="1536917252658">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#999999" WIDTH="2" TRANSPARENCY="200" FONT_SIZE="12" FONT_FAMILY="SansSerif" DESTINATION="ID_1505498195" MIDDLE_LABEL="&#x26a0;" STARTINCLINATION="32;3;" ENDINCLINATION="32;11;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
</node>
</node>
<node TEXT="Fixed width" ID="ID_317716505" CREATED="1536914686262" MODIFIED="1536914693694">
<node TEXT="no separator" ID="ID_360661645" CREATED="1536915069450" MODIFIED="1536915408059">
<font ITALIC="true"/>
</node>
</node>
<node TEXT="Others" LOCALIZED_STYLE_REF="default" ID="ID_920282692" CREATED="1536916298432" MODIFIED="1536917010305">
<node TEXT="JSON" ID="ID_1571826603" CREATED="1536916976103" MODIFIED="1536917025761" STYLE="bubble"/>
<node TEXT="HTML" ID="ID_1822647020" CREATED="1536916980142" MODIFIED="1536917025762" STYLE="bubble"/>
<node TEXT="..." ID="ID_1319792793" CREATED="1536916982121" MODIFIED="1536917156890"/>
</node>
</node>
<node TEXT="SQL Database" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" POSITION="right" ID="ID_507388349" CREATED="1536916576961" MODIFIED="1536919249181" HGAP_QUANTITY="26.7499996200204 pt"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <i>import via </i>
    </p>
    <p>
      <i>database </i>
    </p>
    <p>
      <i>connector</i>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="easier access&#xa;via web API &#x2192; text" ID="ID_1109523775" CREATED="1536918886460" MODIFIED="1536919266186">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#999999" WIDTH="2" TRANSPARENCY="200" DASH="3 3" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_1620824997" STARTINCLINATION="-2;-34;" ENDINCLINATION="3;86;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<edge WIDTH="thin"/>
</node>
</node>
<node TEXT="Binary" POSITION="right" ID="ID_538704980" CREATED="1536914639892" MODIFIED="1536919256172" VGAP_QUANTITY="20.0 pt" HGAP_QUANTITY="25.999999642372142 pt" VSHIFT_QUANTITY="-1.4999999552965178 pt">
<cloud COLOR="#ffe5fb" SHAPE="ROUND_RECT"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      <i>import with </i>
    </p>
    <p>
      <i>format-specific </i>
    </p>
    <p>
      <i>functions</i>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="Excel spreadsheet" ID="ID_1895008607" CREATED="1536914666305" MODIFIED="1536916433000">
<node TEXT=".xls" ID="ID_969237647" CREATED="1536915081080" MODIFIED="1536915084617"/>
<node TEXT=".xlsx" ID="ID_903662783" CREATED="1536915085204" MODIFIED="1536915088751"/>
</node>
<node TEXT="Others" LOCALIZED_STYLE_REF="default" ID="ID_38694403" CREATED="1536916796010" MODIFIED="1536917142192">
<node TEXT="LibreOffice Calc" ID="ID_780329127" CREATED="1536917017273" MODIFIED="1536917203954" STYLE="bubble">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#999999" WIDTH="2" TRANSPARENCY="200" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_903662783" STARTINCLINATION="26;1;" ENDINCLINATION="10;35;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
</node>
<node TEXT="HDF5" ID="ID_1283514636" CREATED="1536917119020" MODIFIED="1536917149057" STYLE="bubble"/>
<node TEXT="..." ID="ID_584722641" CREATED="1536917150266" MODIFIED="1536917153462"/>
</node>
</node>
</node>
</map>
