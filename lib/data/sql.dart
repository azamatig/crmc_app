String crmDB = """
  CREATE TABLE CRMDB (
    id INTEGER PRIMARY KEY,
    login TEXT,
    password TEXT,
    userId TEXT
  )
  """;

String contacts = """
  CREATE TABLE CONTACTS (
    id INTEGER PRIMARY KEY,
    upperName TEXT,
    partyType TEXT,
    nationalIdentifier TEXT
  )
  """;

String contracts = """
  CREATE TABLE CONTRACTS (
    id INTEGER PRIMARY KEY,
    mainContract TEXT,
    amountAndCurrency TEXT,
    number TEXT,
    apartmentCode TEXT
  )
  """;
