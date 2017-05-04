// ****************************************************
// Main search form object
// ****************************************************
var SEARCHFORM = (function () {
    var instance;

    //*************************************************
    // Private variables and functions
    //*************************************************
    var pathname = $(location).attr('pathname');	// Get pathname from current location
    var expandAdvOptions = false;
    var startYear;
    var stringYear;
    var endYear;
    var sec1Value;
    var sec2Value;
    var sec3Value;
    var dtypeValue;
    var trtypeValue;
    var disctypeValue;
    var browseindexWindow;

    // Database values
    var CPX = 1;			// Compendex mask
    var INS = 2;			// Inspec mask
    var NTIS = 4;			// NTIS mask
    var USPTO = 8;			// USPTO mask
    var CRC = 16;			// CRC mask - not used?
    var C84 = 32;			// Compendex backfile mask
    var PCH = 64;			// PaperChem mask
    var CHM = 128;			// Chimica mask
    var CBN = 256;			// CBNB mask
    var ELT = 1024;			// EncompassLIT mask
    var EPT = 2048;			// EncompassPAT mask
    var IBF = 4096;			// Inspec backfile mask
    var GEO = 8192;			// GEOBASE mask
    var EUP = 16384;		// European patents mask
    var UPA = 32768;		// US patents mask
    var UPA_EUP = UPA + EUP;
    var CBF = 262144;		// Compendex backfile standalone mask
    var IBS = 1048576;		// Inspec backfile standalone mask
    var UPT = 524288;		// UPT mask
    var GRF = 2097152;		// GeoRef mask

    /**************************************************************
     * Get the list of available start years by datbase mask
     *
     * @param selectedDatabaseMask
     */
    function generateStartYears(selectedDatabaseMask) {
        var stringYear = $("input[name='stringYear']");
        if (typeof stringYear == 'undefined') {
            console.warn("stringYear value could not be set!");
            return;
        }

        var sy = calStartYear(selectedDatabaseMask, stringYear.val());
        var ey = calEndYear(selectedDatabaseMask);
        var dy = calDisplayYear(selectedDatabaseMask, stringYear.val());

        var years = new Array();
        var idx = 0;
        for (var j = sy; j <= ey; j++) {
            if (j == dy) years[idx++] = {"label": j, "value": j, "selected": true};
            else years[idx++] = {"label": j, "value": j};
        }
        return years
    }

    /**************************************************************
     * Get the list of available end years by database mask
     *
     * @param selectedDatabaseMask
     */
    function generateEndYears(selectedDatabaseMask) {
        var stringYear = $("input[name='stringYear']");
        if (typeof stringYear == 'undefined') {
            console.warn("stringYear value could not be set!");
            return;
        }

        var sy = calStartYear(selectedDatabaseMask, stringYear.val());
        var ey = calEndYear(selectedDatabaseMask);

        var years = new Array();
        var idx = 0;
        for (var j = ey; j >= sy; j--) {
            if (j == ey) years[idx++] = {"label": j, "value": j, "selected": true};
            else years[idx++] = {"label": j, "value": j};
        }
        return years

    }

    // default end year
    function calEndYear(selectedDatabaseMask) {
        if (selectedDatabaseMask == IBS) return 1968;
        else if (selectedDatabaseMask == CBF || selectedDatabaseMask == CBF + IBS) return 1969;
        else return 2016;
    }

    // default start year
    //
    function calStartYear(selectedDatabaseMask, sYear) {

        // 1969 is arbitrary, but in case all else fails?
        // but we will never be able to get above this default value
        // since we will only overwrite this value if we find one less than
        var dYear = 1973;

        // jam 12/20/1004 - This is not an else if!
        // compare the start year for each db
        // pick up the earliest start year possible
        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & UPA) == UPA)) {
            var upaStartYear = sYear.substr(sYear.indexOf("UST") + 3, 4);
            dYear = (dYear > upaStartYear) ? upaStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & EUP) == EUP)) {
            var eupStartYear = sYear.substr(sYear.indexOf("EST") + 3, 4);
            dYear = (dYear > eupStartYear) ? eupStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && (selectedDatabaseMask == UPA_EUP)) {
            var useupStartYear = sYear.substr(sYear.indexOf("UST") + 3, 4);
            dYear = (dYear > useupStartYear) ? useupStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & CBF) == CBF)) {
            var cbfStartYear = sYear.substr(sYear.indexOf("YST") + 3, 4);
            dYear = (dYear > cbfStartYear) ? cbfStartYear : dYear;
        }
        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & CPX) == CPX)) {
            var cpxStartYear = sYear.substr(sYear.indexOf("CST") + 3, 4);
            dYear = (dYear > cpxStartYear) ? cpxStartYear : dYear;
        }
        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & INS) == INS)) {
            var insStartYear = sYear.substr(sYear.indexOf("IST") + 3, 4);
            dYear = (dYear > insStartYear) ? insStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & IBS) == IBS)) {
            var ibsStartYear = sYear.substr(sYear.indexOf("FST") + 3, 4);
            dYear = (dYear > ibsStartYear) ? ibsStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & NTIS) == NTIS)) {
            var ntiStartYear = sYear.substr(sYear.indexOf("NST") + 3, 4);
            dYear = (dYear > ntiStartYear) ? ntiStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & GEO) == GEO)) {
            var geoStartYear = sYear.substr(sYear.indexOf("GST") + 3, 4);
            dYear = (dYear > geoStartYear) ? geoStartYear : dYear;
        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & PCH) == PCH)) {
            var pchStartYear = sYear.substr(sYear.indexOf("AST") + 3, 4);
            dYear = (dYear > pchStartYear) ? pchStartYear : dYear;
        }

        if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & CHM) == CHM)) {
            var chmStartYear = sYear.substr(sYear.indexOf("HST") + 3, 4);
            dYear = (dYear > chmStartYear) ? chmStartYear : dYear;
        }

        if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & CBN) == CBN)) {
            var cbnStartYear = sYear.substr(sYear.indexOf("BST") + 3, 4);
            dYear = (dYear > cbnStartYear) ? cbnStartYear : dYear;
        }

        if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & ELT) == ELT)) {
            var eltStartYear = sYear.substr(sYear.indexOf("LST") + 3, 4);
            dYear = (dYear > eltStartYear) ? eltStartYear : dYear;

        }

        if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & EPT) == EPT)) {
            var eptStartYear = sYear.substr(sYear.indexOf("MST") + 3, 4);
            dYear = (dYear > eptStartYear) ? eptStartYear : dYear;

        }

        if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & GRF) == GRF)) {
            var geoStartYear = sYear.substr(sYear.indexOf("XST") + 3, 4);
            dYear = (dYear > geoStartYear) ? geoStartYear : dYear;
        }
        return dYear;
    }

    // customized selected display year
    //
    function calDisplayYear(selectedDatabaseMask, sYear) {

        // 2006 since displayed start year could be a very recent value
        // (i.e. An account could have 2000-2006 as their default range)
        // We set this as high as possible and then compare to
        // all possible values and take minimum
        var dYear = calEndYear(selectedDatabaseMask);

        // same as above - not an else if
        // choose theleast of the three when picking selected start year
        if (sYear.length > 4) {
            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & CPX) == CPX)) {
                var cpxStartYear = sYear.substr(sYear.indexOf("CSY") + 3, 4);
                dYear = (dYear > cpxStartYear) ? cpxStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & INS) == INS)) {
                var insStartYear = sYear.substr(sYear.indexOf("ISY") + 3, 4);
                dYear = (dYear > insStartYear) ? insStartYear : dYear;
            }
            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & IBS) == IBS)) {
                var ibsStartYear = sYear.substr(sYear.indexOf("FSY") + 3, 4);
                dYear = (dYear > ibsStartYear) ? ibsStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & CBF) == CBF)) {
                var cbfStartYear = sYear.substr(sYear.indexOf("YSY") + 3, 4);
                dYear = (dYear > cbfStartYear) ? cbfStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & NTIS) == NTIS)) {
                var ntiStartYear = sYear.substr(sYear.indexOf("NSY") + 3, 4);
                dYear = (dYear > ntiStartYear) ? ntiStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & GEO) == GEO)) {
                var geoStartYear = sYear.substr(sYear.indexOf("GSY") + 3, 4);
                dYear = (dYear > geoStartYear) ? geoStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & PCH) == PCH)) {
                var pchStartYear = sYear.substr(sYear.indexOf("ASY") + 3, 4);
                dYear = (dYear > pchStartYear) ? pchStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0)
                && ((selectedDatabaseMask & EUP) == EUP)) {
                var eupStartYear = sYear.substr(sYear.indexOf("ESY") + 3, 4);
                dYear = (dYear > eupStartYear) ? eupStartYear : dYear;
            }

            if ((selectedDatabaseMask != 0)
                && ((selectedDatabaseMask & UPA) == UPA)) {
                var uspStartYear = sYear.substr(sYear.indexOf("USY") + 3, 4);
                dYear = (dYear > uspStartYear) ? uspStartYear : dYear;
            }

            if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & CHM) == CHM)) {
                var chmStartYear = sYear.substr(sYear.indexOf("HSY") + 3, 4);
                dYear = (dYear > chmStartYear) ? chmStartYear : dYear;
            }
            if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & CBN) == CBN)) {
                var cbnStartYear = sYear.substr(sYear.indexOf("BSY") + 3, 4);
                dYear = (dYear > cbnStartYear) ? cbnStartYear : dYear;
            }
            if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & ELT) == ELT)) {
                var eltStartYear = sYear.substr(sYear.indexOf("LSY") + 3, 4);
                dYear = (dYear > eltStartYear) ? eltStartYear : dYear;
            }
            if (selectedDatabaseMask != 0 && ((selectedDatabaseMask & EPT) == EPT)) {
                var eptStartYear = sYear.substr(sYear.indexOf("MSY") + 3, 4);
                dYear = (dYear > eptStartYear) ? eptStartYear : dYear;
            }
            if ((selectedDatabaseMask != 0) && ((selectedDatabaseMask & GRF) == GRF)) {
                var geoStartYear = sYear.substr(sYear.indexOf("XSY") + 3, 4);
                dYear = (dYear > geoStartYear) ? geoStartYear : dYear;
            }
        } else {
            dYear = sYear;
        }
        return dYear;
    }

    /***************************************************************
     * Builds and returns an array of Field objects that represent
     * the section dropdown (Search In)
     * @param selectedDatabaseMask
     * @returns {Array}
     */
    function generateSection(selectedDatabaseMask) {
        var searchin = new Array();
        var index = 0;

        //All fields
        searchin[index++] = {"value": "NO-LIMIT", "label": "All fields"};
        //KY
        searchin[index++] = {"value": "KY", "label": "Subject/Title/Abstract"};
        //AB
        searchin[index++] = {"value": "AB", "label": "Abstract"};
        //BN - for Referex - ISBN for GeoRef is added later as to preserve ordering
        //searchin[index++] = {"value":"BN", "label":"ISBN"};

        //AU
        if ((selectedDatabaseMask & CBN) != CBN) {
            if ((selectedDatabaseMask & UPA) != UPA
                && (selectedDatabaseMask & EPT) != EPT
                && (selectedDatabaseMask & EUP) != EUP) {
                searchin[index++] = {"value": "AU", "label": "Author"};
            } else if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
                || selectedDatabaseMask == EPT || selectedDatabaseMask == UPA_EUP
                || selectedDatabaseMask == UPA + EPT
                || selectedDatabaseMask == EPT + EUP
                || selectedDatabaseMask == UPA_EUP + EPT) {
                searchin[index++] = {"value": "AU", "label": "Inventor"};
            } else {
                searchin[index++] = {"value": "AU", "label": "Author/Inventor"};
            }
        }

        //AF
        if (((selectedDatabaseMask & CBN) != CBN)
            && ((selectedDatabaseMask & IBS) != IBS)) {
            if ((selectedDatabaseMask & UPA) != UPA
                && (selectedDatabaseMask & EPT) != EPT
                && (selectedDatabaseMask & EUP) != EUP) {
                searchin[index++] = {"value": "AF", "label": "Author affiliation"};
            } else if ((selectedDatabaseMask == UPA)
                || (selectedDatabaseMask == EUP) || (selectedDatabaseMask == EPT)
                || (selectedDatabaseMask == EPT + UPA)
                || (selectedDatabaseMask == EPT + EUP)
                || (selectedDatabaseMask == UPA_EUP)
                || (selectedDatabaseMask == EPT + UPA_EUP)) {
                searchin[index++] = {"value": "AF", "label": "Assignee"};
            } else {
                searchin[index++] = {"value": "AF", "label": "Author affiliation/Assignee"};
            }
        }

        // TI
        if (selectedDatabaseMask == EPT) {
            searchin[index++] = {"value": "TI", "label": "Patent title"};
        } else {
            searchin[index++] = {"value": "TI", "label": "Title"};
        }

        // CL
        if ((selectedDatabaseMask == CPX) || (selectedDatabaseMask == CBF)
            || (selectedDatabaseMask == CPX + C84)) {

            searchin[index++] = {"value": "CL", "label": "Ei Classification code"};
        } else if ((selectedDatabaseMask == INS) || (selectedDatabaseMask == GEO)
            || (selectedDatabaseMask == IBS) || (selectedDatabaseMask == INS + IBF)
            || (selectedDatabaseMask == INS + GEO)
            || (selectedDatabaseMask == INS + IBF + GEO)) {
            searchin[index++] = {"value": "CL", "label": "Classification code"};
        }

        //CN
        if ((selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & CRC) != CRC && (selectedDatabaseMask & ELT) != ELT
            && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & PCH) != PCH
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & UPT) != UPT
            && (selectedDatabaseMask & USPTO) != USPTO
            && (selectedDatabaseMask & IBS) != IBS) {
            searchin[index++] = {"value": "CN", "label": "CODEN"};
        }

        //CF
        if ((selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & CRC) != CRC && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & PCH) != PCH
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & UPT) != UPT
            && (selectedDatabaseMask & USPTO) != USPTO) {
            searchin[index++] = {"value": "CF", "label": "Conference information"};
        }

        //CC
        if (selectedDatabaseMask == CPX || selectedDatabaseMask == CPX + C84) {
            searchin[index++] = {"value": "CC", "label": "Conference code"};
        }

        //BN - for GeoRef
        if (selectedDatabaseMask == GRF) {
            searchin[index++] = {"value": "BN", "label": "ISBN"};
        }

        //SN
        if ((selectedDatabaseMask & CBF) != CBF && (selectedDatabaseMask & CBN) != CBN
            && (selectedDatabaseMask & CHM) != CHM && (selectedDatabaseMask & CRC) != CRC
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & PCH) != PCH
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & UPT) != UPT
            && (selectedDatabaseMask & USPTO) != USPTO
            && (selectedDatabaseMask & IBS) != IBS) {
            searchin[index++] = {"value": "SN", "label": "ISSN"};
        }

        //MH
        if (selectedDatabaseMask == CPX || selectedDatabaseMask == CBF
            || selectedDatabaseMask == (CPX + C84)) {
            searchin[index++] = {"value": "MH", "label": "Ei main heading"};
        }

        //PN
        if ((selectedDatabaseMask & GEO) != GEO
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CHM) != CHM && (selectedDatabaseMask & CBN) != CBN) {
            searchin[index++] = {"value": "PN", "label": "Publisher"};
        }

        //ST
        if ((selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & EPT) != EPT) {
            searchin[index++] = {"value": "ST", "label": "Source title"};
        }

        // Inspec unique fields
        //PM
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & CPX) != CPX
            && (selectedDatabaseMask & C84) != C84 && (selectedDatabaseMask & CRC) != CRC
            && (selectedDatabaseMask & CBF) != CBF && (selectedDatabaseMask & CBN) != CBN
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & USPTO) != USPTO) {
            searchin[index++] = {"value": "PM", "label": "Patent number"};
        }

        //PA
        if (selectedDatabaseMask == INS || selectedDatabaseMask == (INS + IBF)) {
            searchin[index++] = {"value": "PA", "label": "Filing date"};
        }

        //PI
        if (selectedDatabaseMask == INS || selectedDatabaseMask == (INS + IBF)) {
            searchin[index++] = {"value": "PI", "label": "Patent issue date"};
        }

        //PU
        if (selectedDatabaseMask == INS || selectedDatabaseMask == (INS + IBF)) {
            searchin[index++] = {"value": "PU", "label": "Country of application"};
        }

        //MI
        if (selectedDatabaseMask == INS || selectedDatabaseMask == (INS + IBF)) {
            searchin[index++] = {"value": "MI", "label": "Material Identity Number"};
        }

        //CV
        if (selectedDatabaseMask == CPX || selectedDatabaseMask == CBF
            || selectedDatabaseMask == (CPX + C84)) {
            searchin[index++] = {"value": "CV", "label": "Ei controlled term"};
        } else if (selectedDatabaseMask == INS || selectedDatabaseMask == IBS
            || selectedDatabaseMask == (INS + IBF)) {
            searchin[index++] = {"value": "CV", "label": "Inspec controlled term"};
        } else if (selectedDatabaseMask == NTIS) {
            searchin[index++] = {"value": "CV", "label": "NTIS controlled term"};
        } else if ((selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM) {
            searchin[index++] = {"value": "CV", "label": "Controlled term"};
        }

        //NTIS unique fields
        //CT
        if (selectedDatabaseMask == NTIS) {
            searchin[index++] = {"value": "CT", "label": "Contract number"};
        }

        //CO
        if ((selectedDatabaseMask & CBN) != CBN
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & IBS) != IBS) {
            searchin[index++] = {"value": "CO", "label": "Country of origin"};
        }

        //AG
        if (selectedDatabaseMask == NTIS) {
            searchin[index++] = {"value": "AG", "label": "Monitoring agency"};
        }

        //PD
        if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
            || selectedDatabaseMask == UPA_EUP) {
            searchin[index++] = {"value": "PD", "label": "Publication date"};
        }

        //AN
        if (selectedDatabaseMask == NTIS) {
            searchin[index++] = {"value": "AN", "label": "NTIS accession number"};
        }

        //PAM
        if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
            || selectedDatabaseMask == UPA_EUP) {
            searchin[index++] = {"value": "PAM", "label": "Application number"};
        }

        //RN
        if (selectedDatabaseMask == NTIS) {
            searchin[index++] = {"value": "RN", "label": "Report number"};
        }

        // Patent fields
        //PRN
        if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
            || selectedDatabaseMask == UPA_EUP) {
            searchin[index++] = {"value": "PRN", "label": "Priority number"};
        }

        //PID
        if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
            || selectedDatabaseMask == UPA_EUP || selectedDatabaseMask == EPT
            || selectedDatabaseMask == INS || selectedDatabaseMask == EPT + INS
            || selectedDatabaseMask == INS + UPA
            || selectedDatabaseMask == INS + EUP
            || selectedDatabaseMask == INS + UPA_EUP
            || selectedDatabaseMask == EPT + INS + UPA
            || selectedDatabaseMask == EPT + INS + EUP
            || selectedDatabaseMask == EPT + INS + UPA_EUP
            || selectedDatabaseMask == EPT + UPA
            || selectedDatabaseMask == EPT + EUP
            || selectedDatabaseMask == EPT + UPA_EUP) {
            searchin[index++] = {"value": "PID", "label": "Int. patent classification"};
        }

        //PUC
        if (selectedDatabaseMask == EUP) {
            searchin[index++] = {"value": "PEC", "label": "ECLA code"};
        } else if (selectedDatabaseMask == UPA) {
            searchin[index++] = {"value": "PUC", "label": "US classification"};
        }

        //CR
        if (selectedDatabaseMask == ELT || selectedDatabaseMask == EPT
            || selectedDatabaseMask == EPT + ELT) {
            searchin[index++] = {"value": "CR", "label": "CAS registry number"};
        }

        //PC
        if (selectedDatabaseMask == EPT) {
            searchin[index++] = {"value": "PC", "label": "Patent country"};
        }

        return searchin;
    }

    /***************************************************************
     * Generate the Doctype dropdown
     *
     * @param selectedDatabaseMask
     * @returns {Array}
     */
    function generateDoctypes(selectedDatabaseMask) {
        var doctypes = new Array();
        var index = 0;

        // NO-LIMIT
        if ((selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CHM) != CHM) {
            doctypes[index++] = {"value": "NO-LIMIT", "label": "All document types"};
        } else if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
            || selectedDatabaseMask == UPA_EUP) {
            doctypes[index++] = {"value": "NO-LIMIT", "label": "All patents"};
        } else {
            doctypes[index++] = {"value": "NO-LIMIT", "label": "Document type not available"};
        }

        if ((selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & EPT) != EPT &&
            //(selectedDatabaseMask & ELT) != ELT &&
            (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM) {
            doctypes[index++] = {"value": "JA", "label": "Journal article"};
        }

        if ((selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & EPT) != EPT && (selectedDatabaseMask & ELT) != ELT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "CA", "label": "Conference article"};
        } else if (selectedDatabaseMask == ELT) {
            doctypes[index++] = {"value": "CA", "label": "Conference"};
        }

        if ((selectedDatabaseMask & GEO) != GEO
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & ELT) != ELT
            && (selectedDatabaseMask & EPT) != EPT && (selectedDatabaseMask & CBN) != CBN
            && (selectedDatabaseMask & CHM) != CHM && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "CP", "label": "Conference proceeding"};
        }

        if ((selectedDatabaseMask & GEO) != GEO
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & EPT) != EPT &&
            //(selectedDatabaseMask & ELT) != ELT &&
            (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "MC", "label": "Monograph chapter"};
        }
        if ((selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "MR", "label": "Monograph review"};
        }

        //RC
        if ((selectedDatabaseMask & GEO) != GEO
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & EPT) != EPT &&
            //(selectedDatabaseMask & ELT) != ELT &&
            (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "RC", "label": "Report chapter"};
        }

        //RR
        if ((selectedDatabaseMask & GEO) != GEO
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & EPT) != EPT &&
            //(selectedDatabaseMask & ELT) != ELT &&
            (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "RR", "label": "Report review"};
        }

        //DS
        if ((selectedDatabaseMask & GEO) != GEO
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & EPT) != EPT && (selectedDatabaseMask & CBN) != CBN
            && (selectedDatabaseMask & CHM) != CHM && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "DS", "label": "Dissertation"};
        }

        if (selectedDatabaseMask == INS || selectedDatabaseMask == IBS) {
            doctypes[index++] = {"value": "UP", "label": "Unpublished paper"};
        }
        if (selectedDatabaseMask == CPX) {
            doctypes[index++] = {"value": "PA", "label": "Patents (before 1970)"};
        } else if (selectedDatabaseMask == CBF || selectedDatabaseMask == PCH) {
            doctypes[index++] = {"value": "PA", "label": "Patents"};
        } else if (selectedDatabaseMask == INS || selectedDatabaseMask == IBS) {
            doctypes[index++] = {"value": "PA", "label": "Patents (before 1977)"};
        }

        if (selectedDatabaseMask == UPA) {
            doctypes[index++] = {"value": "UA", "label": "US Applications"};
            doctypes[index++] = {"value": "UG", "label": "US Granted"};
        } else if (selectedDatabaseMask == EUP) {
            doctypes[index++] = {"value": "EA", "label": "European Applications"};
            doctypes[index++] = {"value": "EG", "label": "European Granted"};
        } else if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & CPX) != CPX && (selectedDatabaseMask & INS) != INS
            && (selectedDatabaseMask & IBS) != IBS && (selectedDatabaseMask & NTIS) != NTIS
            && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH) {
            doctypes[index++] = {"value": "UA", "label": "US Applications"};
            doctypes[index++] = {"value": "UG", "label": "US Granted"};
            doctypes[index++] = {"value": "EA", "label": "European Applications"};
            doctypes[index++] = {"value": "EG", "label": "European Granted"};
        }

        if (selectedDatabaseMask == PCH) {
            doctypes[index++] = {"value": "(CA or CP)", "label": "Conferences"};
            doctypes[index++] = {"value": "MC or MR or RC or RR or DS or UP", "label": "Other documents"};
        }

        if (selectedDatabaseMask == CBN) {
            doctypes[index++] = {"value": "Journal", "label": "Journal article"};
            doctypes[index++] = {"value": "Advertizement", "label": "Advertisement"};
            doctypes[index++] = {"value": "Book", "label": "Book"};
            doctypes[index++] = {"value": "Directory", "label": "Directory"};
            doctypes[index++] = {"value": "Company", "label": "Company Report"};
            doctypes[index++] = {"value": "Stockbroker", "label": "Stockbroker Report"};
            doctypes[index++] = {"value": "Market", "label": "Market Research Report"};
            doctypes[index++] = {"value": "Press", "label": "Press Release"};
        }

        if (selectedDatabaseMask == ELT) {
            doctypes[index++] = {"value": "AB", "label": "Abstract"};
        }

        // jam - added MAP exclusively for GeoRef
        // tmh - added for Georef In Process
        if (selectedDatabaseMask == GRF) {
            doctypes[index++] = {"value": "MP", "label": "Map"};
            doctypes[index++] = {"value": "GI", "label": "In Process"};
        }

        // added for AIP
        if (selectedDatabaseMask == CPX) {
            doctypes[index++] = {"value": "IP", "label": "Article in Press"};
        }

        return doctypes;

    }

    /***************************************************************
     * Generate the Treatment types dropdown
     *
     * @param selectedDatabaseMask
     * @returns {Array}
     */
    function generateTreattypes(selectedDatabaseMask) {
        var treattypes = new Array();
        var index = 0;
        // NO-LIMIT
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "NO-LIMIT", "label": "All treatment types"};
        } else {
            treattypes[index++] = {"value": "NO-LIMIT", "label": "Treatment type not available"};
        }

        //APP
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "APP", "label": "Applications"};
        }

        //BIO
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & INS) != INS
            && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "BIO", "label": "Biographical"};
        }

        if (selectedDatabaseMask == INS) {
            treattypes[index++] = {"value": "BIB", "label": "Bibliography"};
        }

        //ECO
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "ECO", "label": "Economic"};
        }

        //EXP
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "EXP", "label": "Experimental"};
        }

        //GEN
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "GEN", "label": "General review"};
        }

        //Cpx fields
        //HIS
        if (selectedDatabaseMask == CPX) {
            treattypes[index++] = {"value": "HIS", "label": "Historical"};
        }
        //LIT
        if (selectedDatabaseMask == CPX) {
            treattypes[index++] = {"value": "LIT", "label": "Literature review"};
        }
        //MAN
        if (selectedDatabaseMask == CPX) {
            treattypes[index++] = {"value": "MAN", "label": "Management aspects"};
        }
        //NUM
        if (selectedDatabaseMask == CPX) {
            treattypes[index++] = {"value": "NUM", "label": "Numerical"};
        }
        //Inspec fields
        //NEW
        if (selectedDatabaseMask == INS) {
            treattypes[index++] = {"value": "NEW", "label": "New development"};
        }
        if (selectedDatabaseMask == INS) {
            treattypes[index++] = {"value": "PRA", "label": "Practical"};
        }
        if (selectedDatabaseMask == INS) {
            treattypes[index++] = {"value": "PRO", "label": "Product review"};
        }

        //THR
        if ((selectedDatabaseMask & GEO) != GEO && (selectedDatabaseMask & GRF) != GRF
            && (selectedDatabaseMask & UPA) != UPA
            && (selectedDatabaseMask & EUP) != EUP
            && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBF) != CBF
            && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & CBN) != CBN && (selectedDatabaseMask & CHM) != CHM
            && (selectedDatabaseMask & PCH) != PCH && (selectedDatabaseMask & IBS) != IBS) {
            treattypes[index++] = {"value": "THR", "label": "Theoretical"};
        }

        return treattypes;
    }

    /***************************************************************
     * Generate the Languages dropdown
     *
     * @param selectedDatabaseMask
     * @returns {Array}
     */
    function generateLanguages(selectedDatabaseMask) {
        var languages = new Array();
        var index = 0;

        languages[index++] = {"value": "NO-LIMIT", "label": "All languages"};
        languages[index++] = {"value": "English", "label": "English"};
        languages[index++] = {"value": "Chinese", "label": "Chinese"};
        languages[index++] = {"value": "French", "label": "French"};
        languages[index++] = {"value": "German", "label": "German"};
        if ((selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & EPT) != EPT
            && (selectedDatabaseMask & PCH) != PCH) {
            languages[index++] = {"value": "Italian", "label": "Italian"};
        }
        languages[index++] = {"value": "Japanese", "label": "Japanese"};
        languages[index++] = {"value": "Russian", "label": "Russian"};
        languages[index++] = {"value": "Spanish", "label": "Spanish"};

        return languages;
    }

    /***************************************************************
     * Generate the Discipline dropdown
     *
     * @param selectedDatabaseMask
     * @returns {Array}
     */
    function generateDisciplines(selectedDatabaseMask) {
        var disciplines = new Array();
        var index = 0;
        var isDisciplines = 0;
        // NOT 2 is INS
        if (selectedDatabaseMask == INS || selectedDatabaseMask == IBS) {
            isDisciplines = 1;
            disciplines[index++] = {"value": "NO-LIMIT", "label": "All disciplines"};
        } else {
            disciplines[index++] = {"value": "NO-LIMIT", "label": "Discipline type not available"};
        }
        // A for INS
        if (isDisciplines == 1) {
            disciplines[index++] = {"value": "A", "label": "Physics"};
            disciplines[index++] = {"value": "B", "label": "Electrical/Electronic engineering"};
            disciplines[index++] = {"value": "C", "label": "Computers/Control engineering"};
            disciplines[index++] = {"value": "D", "label": "Information technology"};
            disciplines[index++] = {"value": "E", "label": "Manufacturing and production engineering"};

        }
        return disciplines;
    }

    /***************************************************************
     * Update the Browse Index links
     *
     * @param selectedDatabaseMask
     * @returns {Array}
     */
    function updateBrowseIndexes(selectedDatabaseMask) {
        // Hide all to start
        $(".browseindexli").hide();
        var noitems = $("#browseindexes_list #bi_none");
        noitems.hide();

        // If no mask, show "No items" text
        if (selectedDatabaseMask == 0) {
            noitems.show();
            return;
        }

        // Show "no items" element with certain combos - quick only
        if (getSearchType() === 'Quick') {
            if ((selectedDatabaseMask & CBN) == CBN && (selectedDatabaseMask & UPA) == UPA) {
                noitems.show();
                return;
            }
            if ((selectedDatabaseMask & CBN) == CBN && (selectedDatabaseMask & EUP) == EUP) {
                noitems.show();
                return;
            }
            // AU
            if ((selectedDatabaseMask & CBN) != CBN) {
                if ((selectedDatabaseMask & UPA) != UPA
                    && (selectedDatabaseMask & EUP) != EUP
                    && (selectedDatabaseMask & EPT) != EPT) {
                    $("#bi_aus").show();
                } else if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
                    || selectedDatabaseMask == UPA_EUP || selectedDatabaseMask == EPT) {
                    $("#bi_inv").show();
                } else {
                    $("#bi_ausinv").show();
                }
            }

            // AF
            if ((selectedDatabaseMask & CBN) != CBN
                && (selectedDatabaseMask & IBS) != IBS) {
                if ((selectedDatabaseMask & UPA) != UPA
                    && (selectedDatabaseMask & EUP) != EUP
                    && (selectedDatabaseMask & EPT) != EPT
                    && (selectedDatabaseMask & IBS) != IBS) {
                    $("#bi_af").show();
                } else if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
                    || selectedDatabaseMask == EPT || selectedDatabaseMask == UPA_EUP) {
                    $("#bi_asg").show();
                } else {
                    $("#bi_afasg").show();
                }
            }

            // CT
            if ((selectedDatabaseMask & UPA) != UPA
                && (selectedDatabaseMask & EUP) != EUP
                && (selectedDatabaseMask & IBS) != IBS) {
                $("#bi_cvs").show();
            }

            // ST
            if ((selectedDatabaseMask & UPA) != UPA
                && (selectedDatabaseMask & EUP) != EUP
                && (selectedDatabaseMask & EPT) != EPT && (selectedDatabaseMask & NTIS) != NTIS) {
                $("#bi_st").show();
            }

            // PN
            if ((selectedDatabaseMask & GEO) != GEO
                && (selectedDatabaseMask & UPA) != UPA
                && (selectedDatabaseMask & EUP) != EUP
                && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBN) != CBN
                && (selectedDatabaseMask & CHM) != CHM && (selectedDatabaseMask & EPT) != EPT) {
                $("#bi_pn").show();
            }

            // PC
            if ((selectedDatabaseMask & INS) != INS && (selectedDatabaseMask & IBS) != IBS
                && (selectedDatabaseMask & CPX) != CPX && (selectedDatabaseMask & GEO) != GEO
                && (selectedDatabaseMask & GRF) != GRF && (selectedDatabaseMask & PCH) != PCH
                && (selectedDatabaseMask & UPA) != UPA
                && (selectedDatabaseMask & EUP) != EUP
                && (selectedDatabaseMask & NTIS) != NTIS && (selectedDatabaseMask & CBN) != CBN
                && (selectedDatabaseMask & ELT) != ELT && (selectedDatabaseMask & CHM) != CHM
                && (selectedDatabaseMask & IBS) != IBS) {
                $("#bi_pc").show();
            }

            if (selectedDatabaseMask == INS) {
                $("#bi_pid").show();
            }
        } else {
            //AUS
            if (selectedDatabaseMask != CBN) {
                if ((selectedDatabaseMask & UPA) != UPA && (selectedDatabaseMask & EUP) != EUP
                    && (selectedDatabaseMask & EPT) != EPT) {
                    $("#bi_aus").show();
                } else if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
                    || selectedDatabaseMask == UPA_EUP || selectedDatabaseMask == EPT
                    || selectedDatabaseMask == (UPA_EUP + EPT)) {
                    $("#bi_inv").show();
                } else {
                    $("#bi_ausinv").show();
                }
            }

            //AF
            if (selectedDatabaseMask != CBN && (selectedDatabaseMask & IBS) != IBS) {
                if ((selectedDatabaseMask & UPA) != UPA && (selectedDatabaseMask & EUP) != EUP
                    && (selectedDatabaseMask & EPT) != EPT) {
                    $("#bi_af").show();
                } else if (selectedDatabaseMask == UPA || selectedDatabaseMask == EUP
                    || selectedDatabaseMask == UPA_EUP || selectedDatabaseMask == EPT
                    || selectedDatabaseMask == (EPT + UPA_EUP)) {
                    $("#bi_asg").show();
                } else {
                    $("#bi_afasg").show();
                }
            }

            //CT
            if (((selectedDatabaseMask & CPX) == CPX)
                || ((selectedDatabaseMask & INS) == INS)
                || ((selectedDatabaseMask & CBF) == CBF)
                || ((selectedDatabaseMask & GEO) == GEO)
                || ((selectedDatabaseMask & GRF) == GRF)
                || ((selectedDatabaseMask & NTIS) == NTIS)
                || ((selectedDatabaseMask & CHM) == CHM)
                || ((selectedDatabaseMask & CBN) == CBN)
                || ((selectedDatabaseMask & PCH) == PCH)
                || ((selectedDatabaseMask & ELT) == ELT)
                || ((selectedDatabaseMask & EPT) == EPT)) {
                $("#bi_cvs").show();
            }

            //LA
            if (((selectedDatabaseMask & CPX) == CPX) || ((selectedDatabaseMask & CBF) == CBF)
                || ((selectedDatabaseMask & INS) == INS)
                || ((selectedDatabaseMask & GEO) == GEO)
                || ((selectedDatabaseMask & GRF) == GRF)
                || ((selectedDatabaseMask & NTIS) == NTIS)
                || ((selectedDatabaseMask & PCH) == PCH)) {
                $("#bi_la").show();
            }

            //ST
            if (((selectedDatabaseMask & CPX) == CPX) || ((selectedDatabaseMask & CBF) == CBF)
                || ((selectedDatabaseMask & GEO) == GEO)
                || ((selectedDatabaseMask & GRF) == GRF)
                || ((selectedDatabaseMask & INS) == INS)
                || ((selectedDatabaseMask & IBS) == IBS)
                || ((selectedDatabaseMask & CHM) == CHM)
                || ((selectedDatabaseMask & CBN) == CBN)
                || ((selectedDatabaseMask & ELT) == ELT)
                || ((selectedDatabaseMask & PCH) == PCH)) {
                $("#bi_st").show();
            }

            //DT
            if (((selectedDatabaseMask & CPX) == CPX) || ((selectedDatabaseMask & GEO) == GEO)
                || ((selectedDatabaseMask & GRF) == GRF)
                || ((selectedDatabaseMask & CBF) == CBF)
                || ((selectedDatabaseMask & INS) == INS)
                || ((selectedDatabaseMask & PCH) == PCH)) {
                $("#bi_dt").show();
            }

            //PB
            if (((selectedDatabaseMask & CPX) == CPX) || ((selectedDatabaseMask & CBF) == CBF)
                || ((selectedDatabaseMask & INS) == INS)
                || ((selectedDatabaseMask & IBS) == IBS)
                || ((selectedDatabaseMask & ELT) == ELT)
                || ((selectedDatabaseMask & GRF) == GRF)
                || ((selectedDatabaseMask & PCH) == PCH)) {
                $("#bi_pn").show();
            }

            //TR
            if (((selectedDatabaseMask & CPX) == CPX)
                || ((selectedDatabaseMask & INS) == INS)) {
                $("#bi_tr").show();
            }

            //PC
            if (((selectedDatabaseMask & EPT) == EPT)) {
                $("#bi_pc").show();
            }

            //DI
            if (((selectedDatabaseMask & INS) == INS)) {
                $("#bi_di").show();
            }

            //IPC
            if (((selectedDatabaseMask & INS) == INS)) {
                $("#bi_pid").show();
            }
        }

    }

    // Initialize the current form
    function init(o) {
        instance = this;		// Set instance to this.  WILL NOT WORK if called as a global function instead of as a method!

        if (typeof o != 'undefined') {
            if (o.hasOwnProperty('expandAdvOptions')) instance.expandAdvOptions = o.expandAdvOptions;
        }

        updateBrowseIndexes(getDatabaseMask());
        updateSearchTabLinks(getDatabaseMask());
        enableSearchButton(null);
        showAdvOptions(instance.expandAdvOptions);

        // Initialize handlers for DOM elements
        // Handle search submit
        //
        $("#searchform").submit(submitSearch);

        // Handle DB change
        //
        $(".databasechkbox").click(update);

        // Handle form reset
        //
        $(".formreset").click(reset);

        // Handle search word text box update
        //
        $(".searchword").blur(function (event) {
            if (browseindexWindow && !browseindexWindow.closed) {
                if (getSearchType() === 'Quick') browseindexWindow.updatechecks();
                else browseindexWindow.expertchecks();
            }
            //if (typeof AUTOSUGGEST != 'undefined' && AUTOSUGGEST != null) AUTOSUGGEST.dynamic(event);
            console.log("searchword1: " + $("#srchWrd1").val());
        });


        // Select the year range radio button when year selects are used
        $("#startyrrange").change(function (event) {
            $("#yearrangechx").prop("checked", true);
        });
        $("#endyearrange").change(function (event) {
            $("#yearrangechx").prop("checked", true);
        });

        // Select the last update radio button when update select is used
        $("#limittoupdates").change(function (event) {
            $("#rdupdt").prop("checked", true);
            checkLastUpdates();
        });
        $("#rdupdt").click(function (event) {
            $("#rdupdt").prop("checked", true);
            checkLastUpdates();
        });

        // Expand/collapse advanced options
        $("#advancedOptionstoggle, #advancedOptionstoggleAnchor").click(function (ev) {
            ev.preventDefault();
            $("#advancedOptionstoggleAnchor").attr("title", $("#advancedOptionshidden").is(":visible") ? "Show adavanced options" : "Hide adavanced options");
            $.cookie("ev_advopts", !$("#advancedOptionshidden").is(":visible"), {path: '/'});
            $("#advancedOptionshidden").slideToggle("slow");
            $("#advancedOptionstoggleAnchor").toggleClass("historyplus");
            $("#advancedOptionstoggleAnchor").toggleClass("historyminus");
            $("#advancedOptionstoggleAnchor img.sprite").toggleClass("sprite-login_collapse sprite-login_expand");
            return false;
        });

        // Close browse index window when page is unloaded
        $(window).unload(function () {
            if (browseindexWindow) browseindexWindow.close();
        });

        // Disable / enable search button
        //
        $(".searchword").on("input change", enableSearchButton);

        // Handle browse index links
        //
        $("#addsearchllink").click(addSearchField);

        //check cookie and check the expandoptions preference. if cookie exists then use its value for this session
        if (($.cookie("ev_advopts") && $.cookie("ev_advopts") == "true") || (!($.cookie("ev_advopts")) && expandAdvOptions)) {
            showAdvOptions(true);
        }
        $("#searchcontents").show();
        $("#srchWrd1").focus();
    }

    //
    // Reset the current form
    function reset(event) {
        if (typeof event != 'undefined') {
            var href = $(event.target).attr('href');
            if (href) {
                window.location.replace(href);
                return;
            }
        }
        window.location.reload();
    }

    //
    // Update the current form due to state change
    function update(event) {
        var selectedDatabaseMask = getDatabaseMask();
        if (typeof event != "undefined") {
            var eventtarget = $(event.target);
            // Clear checkboxes appropriately - clicking 'alldb'
            // clears all others, clicking any other clears 'alldb'
            if (eventtarget.attr('type') == 'checkbox') {
                if (eventtarget.attr('name') == 'alldb') {
                    $("input[name='database']").removeAttr('checked');
                } else {
                    $("input[name='alldb']").removeAttr('checked');
                }

                // Offer to save DB state if feature is enabled (@see SaveDB.js)
                selectedDatabaseMask = getDatabaseMask();
                if ($("#saveDBIcon") && $("#saveDBIcon").length > 0) {
                    if (selectedDatabaseMask != dbSave.mask && selectedDatabaseMask > 0) enableSaveDB();
                    else disableSaveDB();
                }

            }
        }

        // Update search form options
        if (getSearchType() === 'Quick') {
            updateOptions($(".section"), generateSection(selectedDatabaseMask));
            updateOptions($("select[name=doctype]"), generateDoctypes(selectedDatabaseMask));
            updateOptions($("select[name=treatmentType]"), generateTreattypes(selectedDatabaseMask));
            updateOptions($("select[name=disciplinetype]"), generateDisciplines(selectedDatabaseMask));
            updateOptions($("select[name=language]"), generateLanguages(selectedDatabaseMask));
        }
        updateOptions($("select[name=startYear]"), generateStartYears(selectedDatabaseMask));
        updateOptions($("select[name=endYear]"), generateEndYears(selectedDatabaseMask));

        // Update the browse index links
        updateBrowseIndexes(selectedDatabaseMask);

        // Ensure last updates can remain checked
        checkLastUpdates();

        // Update the search links to retain the selected DB
        if (typeof updateSearchTabLinks != 'undefined') {
            updateSearchTabLinks(getDatabaseMask());
        }

        // Update search codes if necessary
        if (getSearchType() === "Expert") {
            if (typeof searchCodes === "object") {
                searchCodes.refresh(".databasechkbox:checked", ["#searchCodesCol1", "#searchCodesCol2"]);
            }
        }
    }

    //
    // Update options from an array of json elements
    function updateOptions(option_elems, option_json_arr) {
        if (!option_elems || option_elems.length == 0) {
            console.warn("No option elements passed!");
            return;
        }
        if (!option_json_arr || option_json_arr.length == 0) {
            console.warn("No option objects passed!");
            return;
        }
        $.each(option_elems, function (i, option) {
            $(option).empty();
            $.each(option_json_arr, function (j, o) {
                if (o.selected) {
                    $(option).append($("<option>").text(o.label).attr('value', o.value).attr('selected', 'selected'));
                } else {
                    $(option).append($("<option>").text(o.label).attr('value', o.value));
                }
            })
        })
    }

    //
    // Ensure last update is selectable with current database combo
    function checkLastUpdates() {
        var seldbmask = getDatabaseMask();
        if ($("#rdupdt").prop("checked")) {
            if (seldbmask == instance.CBF) {
                alert("Last updates selection does not apply to Ei Backfile.");
                $("#yearrangechx").prop("checked", true).focus();
                return false;
            } else if (seldbmask == instance.IBS) {
                alert("Last updates selection does not apply to Inspec Archive.");
                $("#yearrangechx").prop("checked", true).focus();
                return false;
            } else if (seldbmask == (instance.IBS + instance.CBF)) {
                alert("Last updates selection does not apply to Ei Backfile and Inspec Archive.");
                $("#yearrangechx").prop("checked", true).focus();
                return false;
            }
        }
        return true;
    }

    //
    // Add a new search field (limit 12)
    function addSearchField(event, searchtext, connector, section) {
        // Get the current number of search fields on the page
        // REMEMBER this includes the element inside of .addsearchfieldcopy!!
        var numfields = $('.searchword').length;
        if (!searchtext || typeof searchtext == 'undefined')
            searchtext = '';
        if (!connector || typeof connector == 'undefined')
            connector = '';
        if (!section || typeof section == 'undefined')
            section = '';

        // Display error message when we reach limit
        if (numfields == 10) {
            showSearchFieldError();
            return false;
        }

        var nextNumfields = Number(numfields) + 1;
        var addsearchfieldcopy = $('.addsearchfieldcopy').clone(true);
        addsearchfieldcopy.toggleClass('addsearchfieldcopy addsearchfielddiv').show();
        addsearchfieldcopy.find(".searchwordcopy").toggleClass("searchwordcopy searchword").val(searchtext);
        addsearchfieldcopy.find(".section option[value='" + section + "']").attr("selected", "true");
        addsearchfieldcopy.find(".boolean option[value='" + connector + "']").attr("selected", "true");
        addsearchfieldcopy.find(".boolean").attr("title", "boolean operator for combining textbox " + numfields + " and textbox " + nextNumfields);
        $("#searchfields").append(addsearchfieldcopy);
        $(addsearchfieldcopy).on("input change", enableSearchButton);
        $("#resetsearch_tool").show();

        // Re-init jquery handlers.
        $(".removesearchlink").click(removeSearchField);

        if (typeof AUTOSUGGEST != 'undefined' && AUTOSUGGEST != null
            && AUTOSUGGEST.enabled) {
            AUTOSUGGEST.checkACFields();
        }
        return false;
    }

    /***************************************************************************
     * Remove a search field line
     *
     * @param rowNum
     */
    function removeSearchField(event) {
        if (typeof event == 'undefined') {
            console.log("No event attached to remove search field!");
        }
        hideSearchFieldError();
        $(event.target).parents(".addsearchfielddiv").remove();

        // If there are 3 .searchword elements left
        // then we're back to the original fields, hide reset!
        var numfields = $('.searchword').length;
        if (numfields == 3) {
            $("#resetsearch_tool").hide();
        }
    }

    /*********************************************************
     * Show the error message for trying to exceed 12 fields
     */
    function showSearchFieldError() {
        $("#addsearcherror").show();
        $("#addsearchllink").hide();
        $("#addsearchllinkgray").show();
    }

    /*********************************************************
     * Hide the error message
     */
    function hideSearchFieldError() {
        $("#addsearcherror").hide();
        $("#addsearchllink").show();
        $("#addsearchllinkgray").hide();
    }


    //
    // Get the current database mask from the search form
    function getDatabaseMask(event) {
        var selectedDatabaseMask = 0;
        var selectedDatabases = $(".databasechkbox:checked");
        if (typeof selectedDatabases == 'undefined' || selectedDatabases.length == 0) {
            console.warn("No databases are selected");
        } else {
            selectedDatabases.each(function (idx) {
                selectedDatabaseMask += eval($(this).val());
            });
        }
        return selectedDatabaseMask;
    }


    //
    // Submit a search - validate form fields and submit!
    // TODO: change all alert boxes to error messages
    function submitSearch(event) {
        var searchwords = $(".searchword");
        var searchword = $("#srchWrd1");

        if (typeof event != 'undefined') event.stopImmediatePropagation();

        // Clear existing error message
        $("#errormessage").empty();

        // Set the search type
        $("input[name='searchtype']").val(getSearchType());

        // Validate search form


        // Verify at least one search term present
        var allEmpty = false;
        if (searchwords.val().length == 0) {
            allEmpty = true;
            searchwords.each(function () {
                if ($(this).val().length > 0) {
                    allEmpty = false;
                }
            });
        }
        if (allEmpty) {
            window.alert("Enter at least one term to search.");
            if (typeof event != 'undefined') event.preventDefault();
            return false;
        }
        if (typeof searchword == 'undefined' || searchword.val().length == 0) {
            window.alert("Please enter search term in first text box.");
            if (typeof event != 'undefined') event.preventDefault();
            return false;
        }

        // Ensure start year less than or equal to end year
        var yearrangechx = $("#yearrangechx");
        var startyear = $("#startyrrange option:selected");
        var endyear = $("#endyearrange option:selected");
        if (yearrangechx.prop("checked") == true) {
            if (startyear != null && startyear.length > 0 && endyear != null && endyear.length > 0) {
                if (parseInt(startyear.val()) > parseInt(endyear.val())) {
                    window.alert("Start year should be less than or equal to End year");
                    if (typeof event != 'undefined') event.preventDefault();
                    return false;
                }
            }
        }

        // Replace special characters
        searchwords.each(function () {
            var swapCodes = new Array(8211, 8212, 8216, 8217, 8220, 8221);
            var swapStrings = new Array("-", "-", "'", "'", "\"", "\"");
            var textNodeValue = $(this).val();
            //add for remove newline character by hmo-1/15/2015
            textNodeValue = textNodeValue.replace(/(\r\n|\n|\r)/gm, " ");
            for (var j = 0; j < swapCodes.length; j++) {
                var swapper = new RegExp("\\u" + swapCodes[j].toString(16), "g");
                textNodeValue = textNodeValue.replace(swapper, swapStrings[j]);
            }
            $(this).val(textNodeValue);
        });
        return true;
    }

    //
    // Get the current search type ('Quick', 'Expert', or 'Thes')
    function getSearchType() {
        if ('/search/quick.url' === $(location).attr('pathname')) return 'Quick';
        else if ('/search/expert.url' === $(location).attr('pathname')) return 'Expert';
        else if ('/search/thesHome.url' === $(location).attr('pathname')) return 'Thes';
    }

    // Enable / disable the search form submit button
    //
    function enableSearchButton(event) {
        var allEmpty = false;
        if ($(".searchword").val().length == 0) {
            allEmpty = true;
            $(".searchword").each(function () {
                if ($(this).val().length > 0) {
                    allEmpty = false;
                }
            });
        }
        $(".searchbtn").attr("disabled", allEmpty);
    }

    // Show / Hide advanced options
    function showAdvOptions(show) {
        if (typeof show == 'undefined' || show == null) show = true;
        instance.expandAdvOptions = show;
        if (!$("#advancedOptions").length) {
            return;
        }
        if (show) {
            //if its already visible don't try to show it again.
            if ($("#advancedOptionshidden").is(":visible")) {
                return;
            }
            $.cookie("ev_advopts", "true", {path: '/'});
            $("#advancedOptionstoggleAnchor").attr("title", "Hide adavanced options");
            $("#advancedOptionstoggleAnchor").addClass("historyminus");
            $("#advancedOptionstoggleAnchor").removeClass("historyplus");
            $("#advancedOptionshidden").show("slidedown");
            $("#advancedOptionstoggleAnchor img.sprite").toggleClass("sprite-login_collapse sprite-login_expand");
        } else {
            //if its already hidden don't try to hide it again.
            if (!$("#advancedOptionshidden").is(":visible")) {
                return;
            }
            $.cookie("ev_advopts", "false", {path: '/'});
            $("#advancedOptionstoggleAnchor").attr("title", "Show adavanced options");
            $("#advancedOptionstoggleAnchor").removeClass("historyminus");
            $("#advancedOptionstoggleAnchor").addClass("historyplus");
            $("#advancedOptionshidden").slideToggle("slow");
            $("#advancedOptionstoggleAnchor img.sprite").toggleClass("sprite-login_collapse sprite-login_expand");
        }
    }

    /***************************************************************
     * Handle the user DB selection from my preferences
     *
     * @param userMask
     */
    function handleUPDBChanges(userMask) {
        // Dont make any changes if user deselects everything from my prefs db list
        if (userMask > 0) {
            $("input[name='alldb']").removeAttr('checked');
            $('input[name=database]').each(function () {
                var current = $(this);
                var dbVal = current.val();
                if ((userMask & dbVal) == dbVal) {
                    current.attr('checked', true);
                } else {
                    current.attr('checked', false);
                }
            });
            var selMask = getDatabaseMask();
            if (getSearchType == "Quick") {
                // Set some values into global variables.
                if (document.quicksearch.section1.value != 'NO-LIMIT') {
                    sec1Value = document.quicksearch.section1.value;
                }

                if (document.quicksearch.section2.value != 'NO-LIMIT') {
                    sec2Value = document.quicksearch.section2.value;
                }

                if (document.quicksearch.section3.value != 'NO-LIMIT') {
                    sec3Value = document.quicksearch.section3.value;
                }

                // updateUI will be called for the first time from here (no longer called in body:onLoad event)
                // we need to intialize these global variables
                endYear = calEndYear(selMask);
                stringYear = document.quicksearch.stringYear.value;
                startYear = document.quicksearch.startYear[document.quicksearch.startYear.selectedIndex].value;
                if (document.quicksearch.doctype) {
                    dtypeValue = document.quicksearch.doctype[document.quicksearch.doctype.selectedIndex].value;
                }
                if (document.quicksearch.treatmentType) {
                    trtypeValue = document.quicksearch.treatmentType[document.quicksearch.treatmentType.selectedIndex].value;
                }
                if (document.quicksearch.disciplinetype) {
                    disctypeValue = document.quicksearch.disciplinetype[document.quicksearch.disciplinetype.selectedIndex].value;
                }
            }

            update();
        }
    }

    //*************************************************
    // Return JS object
    //*************************************************
    return {
        expandAdvOptions: expandAdvOptions,

        init: init,
        reset: reset,
        update: update,
        getDatabaseMask: getDatabaseMask,
        getSearchType: getSearchType,
        addSearchField: addSearchField,
        removeSearchField: removeSearchField,
        submitSearch: submitSearch,
        enableSearchButton: enableSearchButton,
        showAdvOptions: showAdvOptions,
        handleUPDBChanges: handleUPDBChanges,
        // Database values
        CPX: CPX,
        INS: INS,
        CPX_INS: CPX + INS,
        NTIS: NTIS,
        USPTO: USPTO,
        CRC: CRC,
        C84: C84,
        PCH: PCH,
        CHM: CHM,
        CBN: CBN,
        ELT: ELT,
        EPT: EPT,
        IBF: IBF,
        GEO: GEO,
        EUP: EUP,
        UPA: UPA,
        UPA_EUP: UPA + EUP,
        CBF: CBF,
        IBS: IBS,
        UPT: UPT,
        IBS: IBS,
        GRF: GRF

    }

})();

