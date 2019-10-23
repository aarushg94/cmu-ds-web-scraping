<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%= request.getAttribute("doctype") %>
<%--
  Created by IntelliJ IDEA.
  User: Aarush
  Date: 9/15/2019
  Time: 2:14 AM
  To change this template use File | Settings | File Templates.

  * This page renders the name of the country, flag of that country and and the
  * description of the flag via web scraping cia.gov website.

--%>
<html>
<head>
    <title>The World Factbook</title>
</head>
<body>
<div style="padding-left: 50px;padding-right: 50px;padding-top: 20px;">
    <form name="hashForm" action="getFlagInformation" method="GET">
        <div>
            <div>
                <%
                    if (request.getAttribute("countryName") == null) {
                %>
                <h3>Country name not found</h3>
                <% } else {
                %>
                <h3><b>The flag of <%=request.getAttribute("countryName")%>
                </b></h3>
                <% }
                    if (request.getAttribute("countryFlag") == null) {
                %>
                <h3>Country Flag not found</h3>
                <%
                } else {%>
                <img src=<%=request.getAttribute("countryFlag")%> style="max-width:90%;height:auto;">
                <p></p>
                Credit www.cia.gov/library/publications
                <p>
                <p></p>
                <%
                    }
                    if (request.getAttribute("countryDescription") == null) {
                %>
                Country Description not found
                <%
                } else {%>
                <b>About this flag: </b><%=request.getAttribute("countryDescription")%>
                <%
                    }
                %>
            </div>
        </div>
        <p></p>
        <b>Choose Another Country</b>
        <p></p>
        <div>
            <div>
                <select name="flagCode">
                    <option value='AF'>Afghanistan</option>
                    <option value='AX'>Akrotiri</option>
                    <option value='AL'>Albania</option>
                    <option value='AG'>Algeria</option>
                    <option value='AQ'>American Samoa</option>
                    <option value='AN'>Andorra</option>
                    <option value='AO'>Angola</option>
                    <option value='AV'>Anguilla</option>
                    <option value='AC'>Antigua and Barbuda</option>
                    <option value='AR'>Argentina</option>
                    <option value='AM'>Armenia</option>
                    <option value='AA'>Aruba</option>
                    <option value='AT'>Ashmore and Cartier Islands</option>
                    <option value='AS'>Australia</option>
                    <option value='AU'>Austria</option>
                    <option value='AJ'>Azerbaijan</option>
                    <option value='BF'>Bahamas, The</option>
                    <option value='BA'>Bahrain</option>
                    <option value='BG'>Bangladesh</option>
                    <option value='BB'>Barbados</option>
                    <option value='BO'>Belarus</option>
                    <option value='BE'>Belgium</option>
                    <option value='BH'>Belize</option>
                    <option value='BN'>Benin</option>
                    <option value='BD'>Bermuda</option>
                    <option value='BT'>Bhutan</option>
                    <option value='BL'>Bolivia</option>
                    <option value='BK'>Bosnia and Herzegovina</option>
                    <option value='BC'>Botswana</option>
                    <option value='BV'>Bouvet Island</option>
                    <option value='BR'>Brazil</option>
                    <option value='IO'>British Indian Ocean Territory</option>
                    <option value='VI'>British Virgin Islands</option>
                    <option value='BX'>Brunei</option>
                    <option value='BU'>Bulgaria</option>
                    <option value='UV'>Burkina Faso</option>
                    <option value='BM'>Burma</option>
                    <option value='BY'>Burundi</option>
                    <option value='CV'>Cabo Verde</option>
                    <option value='CB'>Cambodia</option>
                    <option value='CM'>Cameroon</option>
                    <option value='CA'>Canada</option>
                    <option value='CJ'>Cayman Islands</option>
                    <option value='CT'>Central African Republic</option>
                    <option value='CD'>Chad</option>
                    <option value='CI'>Chile</option>
                    <option value='CH'>China</option>
                    <option value='KT'>Christmas Island</option>
                    <option value='IP'>Clipperton Island</option>
                    <option value='CK'>Cocos (Keeling) Islands</option>
                    <option value='CO'>Colombia</option>
                    <option value='CN'>Comoros</option>
                    <option value='CG'>Congo, Democratic Republic of the</option>
                    <option value='CF'>Congo, Republic of the</option>
                    <option value='CW'>Cook Islands</option>
                    <option value='CR'>Coral Sea Islands</option>
                    <option value='CS'>Costa Rica</option>
                    <option value='IV'>Cote d'Ivoire</option>
                    <option value='HR'>Croatia</option>
                    <option value='CU'>Cuba</option>
                    <option value='UC'>Curacao</option>
                    <option value='CY'>Cyprus</option>
                    <option value='EZ'>Czechia</option>
                    <option value='DA'>Denmark</option>
                    <option value='DX'>Dhekelia</option>
                    <option value='DJ'>Djibouti</option>
                    <option value='DO'>Dominica</option>
                    <option value='DR'>Dominican Republic</option>
                    <option value='EC'>Ecuador</option>
                    <option value='EG'>Egypt</option>
                    <option value='ES'>El Salvador</option>
                    <option value='EK'>Equatorial Guinea</option>
                    <option value='ER'>Eritrea</option>
                    <option value='EN'>Estonia</option>
                    <option value='WZ'>Eswatini</option>
                    <option value='ET'>Ethiopia</option>
                    <option value='EE'>European Union</option>
                    <option value='FK'>Falkland Islands (Islas Malvinas)</option>
                    <option value='FO'>Faroe Islands</option>
                    <option value='FJ'>Fiji</option>
                    <option value='FI'>Finland</option>
                    <option value='FR'>France</option>
                    <option value='FP'>French Polynesia</option>
                    <option value='FS'>French Southern and Antarctic Lands</option>
                    <option value='GB'>Gabon</option>
                    <option value='GA'>Gambia, The</option>
                    <option value='GG'>Georgia</option>
                    <option value='GM'>Germany</option>
                    <option value='GH'>Ghana</option>
                    <option value='GI'>Gibraltar</option>
                    <option value='GR'>Greece</option>
                    <option value='GL'>Greenland</option>
                    <option value='GJ'>Grenada</option>
                    <option value='GQ'>Guam</option>
                    <option value='GT'>Guatemala</option>
                    <option value='GK'>Guernsey</option>
                    <option value='GV'>Guinea</option>
                    <option value='PU'>Guinea-Bissau</option>
                    <option value='GY'>Guyana</option>
                    <option value='HA'>Haiti</option>
                    <option value='HM'>Heard Island and McDonald Islands</option>
                    <option value='VT'>Holy See (Vatican City)</option>
                    <option value='HO'>Honduras</option>
                    <option value='HK'>Hong Kong</option>
                    <option value='HU'>Hungary</option>
                    <option value='IC'>Iceland</option>
                    <option value='IN'>India</option>
                    <option value='ID'>Indonesia</option>
                    <option value='IR'>Iran</option>
                    <option value='IZ'>Iraq</option>
                    <option value='EI'>Ireland</option>
                    <option value='IM'>Isle of Man</option>
                    <option value='IS'>Israel</option>
                    <option value='IT'>Italy</option>
                    <option value='JM'>Jamaica</option>
                    <option value='JN'>Jan Mayen</option>
                    <option value='JA'>Japan</option>
                    <option value='JE'>Jersey</option>
                    <option value='JO'>Jordan</option>
                    <option value='KZ'>Kazakhstan</option>
                    <option value='KE'>Kenya</option>
                    <option value='KR'>Kiribati</option>
                    <option value='KN'>Korea, North</option>
                    <option value='KS'>Korea, South</option>
                    <option value='KV'>Kosovo</option>
                    <option value='KU'>Kuwait</option>
                    <option value='KG'>Kyrgyzstan</option>
                    <option value='LA'>Laos</option>
                    <option value='LG'>Latvia</option>
                    <option value='LE'>Lebanon</option>
                    <option value='LT'>Lesotho</option>
                    <option value='LI'>Liberia</option>
                    <option value='LY'>Libya</option>
                    <option value='LS'>Liechtenstein</option>
                    <option value='LH'>Lithuania</option>
                    <option value='LU'>Luxembourg</option>
                    <option value='MC'>Macau</option>
                    <option value='MA'>Madagascar</option>
                    <option value='MI'>Malawi</option>
                    <option value='MY'>Malaysia</option>
                    <option value='MV'>Maldives</option>
                    <option value='ML'>Mali</option>
                    <option value='MT'>Malta</option>
                    <option value='RM'>Marshall Islands</option>
                    <option value='MR'>Mauritania</option>
                    <option value='MP'>Mauritius</option>
                    <option value='MX'>Mexico</option>
                    <option value='FM'>Micronesia, Federated States of</option>
                    <option value='MD'>Moldova</option>
                    <option value='MN'>Monaco</option>
                    <option value='MG'>Mongolia</option>
                    <option value='MJ'>Montenegro</option>
                    <option value='MH'>Montserrat</option>
                    <option value='MO'>Morocco</option>
                    <option value='MZ'>Mozambique</option>
                    <option value='WA'>Namibia</option>
                    <option value='NR'>Nauru</option>
                    <option value='BQ'>Navassa Island</option>
                    <option value='NP'>Nepal</option>
                    <option value='NL'>Netherlands</option>
                    <option value='NC'>New Caledonia</option>
                    <option value='NZ'>New Zealand</option>
                    <option value='NU'>Nicaragua</option>
                    <option value='NG'>Niger</option>
                    <option value='NI'>Nigeria</option>
                    <option value='NE'>Niue</option>
                    <option value='NF'>Norfolk Island</option>
                    <option value='MK'>North Macedonia</option>
                    <option value='CQ'>Northern Mariana Islands</option>
                    <option value='NO'>Norway</option>
                    <option value='MU'>Oman</option>
                    <option value='PK'>Pakistan</option>
                    <option value='PS'>Palau</option>
                    <option value='PM'>Panama</option>
                    <option value='PP'>Papua New Guinea</option>
                    <option value='PA'>Paraguay</option>
                    <option value='PE'>Peru</option>
                    <option value='RP'>Philippines</option>
                    <option value='PC'>Pitcairn Islands</option>
                    <option value='PL'>Poland</option>
                    <option value='PO'>Portugal</option>
                    <option value='RQ'>Puerto Rico</option>
                    <option value='QA'>Qatar</option>
                    <option value='RO'>Romania</option>
                    <option value='RS'>Russia</option>
                    <option value='RW'>Rwanda</option>
                    <option value='TB'>Saint Barthelemy</option>
                    <option value='SH'>Saint Helena, Ascension, and Tristan da Cunha</option>
                    <option value='SC'>Saint Kitts and Nevis</option>
                    <option value='ST'>Saint Lucia</option>
                    <option value='RN'>Saint Martin</option>
                    <option value='SB'>Saint Pierre and Miquelon</option>
                    <option value='VC'>Saint Vincent and the Grenadines</option>
                    <option value='WS'>Samoa</option>
                    <option value='SM'>San Marino</option>
                    <option value='TP'>Sao Tome and Principe</option>
                    <option value='SA'>Saudi Arabia</option>
                    <option value='SG'>Senegal</option>
                    <option value='RI'>Serbia</option>
                    <option value='SE'>Seychelles</option>
                    <option value='SL'>Sierra Leone</option>
                    <option value='SN'>Singapore</option>
                    <option value='NN'>Sint Maarten</option>
                    <option value='LO'>Slovakia</option>
                    <option value='SI'>Slovenia</option>
                    <option value='BP'>Solomon Islands</option>
                    <option value='SO'>Somalia</option>
                    <option value='SF'>South Africa</option>
                    <option value='SX'>South Georgia and South Sandwich Islands</option>
                    <option value='OD'>South Sudan</option>
                    <option value='SP'>Spain</option>
                    <option value='CE'>Sri Lanka</option>
                    <option value='SU'>Sudan</option>
                    <option value='NS'>Suriid</option>
                    <option value='SV'>Svalbard</option>
                    <option value='SW'>Sweden</option>
                    <option value='SZ'>Switzerland</option>
                    <option value='SY'>Syria</option>
                    <option value='TW'>Taiwan</option>
                    <option value='TI'>Tajikistan</option>
                    <option value='TZ'>Tanzania</option>
                    <option value='TH'>Thailand</option>
                    <option value='TT'>Timor-Leste</option>
                    <option value='TO'>Togo</option>
                    <option value='TL'>Tokelau</option>
                    <option value='TN'>Tonga</option>
                    <option value='TD'>Trinidad and Tobago</option>
                    <option value='TS'>Tunisia</option>
                    <option value='TU'>Turkey</option>
                    <option value='TX'>Turkmenistan</option>
                    <option value='TK'>Turks and Caicos Islands</option>
                    <option value='TV'>Tuvalu</option>
                    <option value='UG'>Uganda</option>
                    <option value='UP'>Ukraine</option>
                    <option value='AE'>United Arab Emirates</option>
                    <option value='UK'>United Kingdom</option>
                    <option value='US'>United States</option>
                    <option value='UM'>United States Pacific Island Wildlife Refuges</option>
                    <option value='UY'>Uruguay</option>
                    <option value='UZ'>Uzbekistan</option>
                    <option value='NH'>Vanuatu</option>
                    <option value='VE'>Venezuela</option>
                    <option value='VM'>Vietnam</option>
                    <option value='VQ'>Virgin Islands</option>
                    <option value='WQ'>Wake Island</option>
                    <option value='WF'>Wallis and Futuna</option>
                    <option value='YM'>Yemen</option>
                    <option value='ZA'>Zambia</option>
                    <option value='ZI'>Zimbabwe</option>
                </select>
            </div>
        </div>
        <p></p>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>