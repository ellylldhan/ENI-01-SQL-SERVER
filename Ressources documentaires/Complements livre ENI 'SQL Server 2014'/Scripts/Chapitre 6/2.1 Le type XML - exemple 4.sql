
CREATE XML SCHEMA COLLECTION schemaClientEtendu AS
N'<?xml version="1.0" encoding="UTF-16"?>'+
'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">'+
'<xs:complexType name="Client">'+
'<xs:sequence>'+
'<xs:element name="Nom"/>'+
'<xs:element name="Prenom"/>'+
'<xs:element name="Adresse"/>'+
'<xs:element name="CodePostal"/>'+
'<xs:element name="Ville"/>'+
'<xs:any namespace="##other" processContents="skip" minOccurs="0" maxOccurs="unbounded"/>'+
'</xs:sequence>'+
'</xs:complexType>'+
'</xs:schema>';