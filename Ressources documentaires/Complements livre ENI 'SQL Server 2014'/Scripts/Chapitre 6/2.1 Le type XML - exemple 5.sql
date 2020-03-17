
CREATE XML SCHEMA COLLECTION schemaDistance AS
N'<?xml version="1.0" encoding="UTF-16"?>'+
'<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">'+
'<xs:simpleType name="Unite">'+
'	<xs:union>'+
'		<xs:simpleType>'+
'			<xs:list>'+
'				<xs:simpleType>'+
'					<xs:restriction base="xs:string">'+
'						<xs:enumeration value="cm"/>'+
'						<xs:enumeration value="m"/>'+
'						<xs:enumeration value="km"/>'+
'					</xs:restriction>'+
'				</xs:simpleType>'+
'			</xs:list>'+
'		</xs:simpleType>'+
'		<xs:simpleType>'+
'			<xs:list>'+
'				<xs:simpleType>'+
'					<xs:restriction base="xs:string">'+
'						<xs:enumeration value="inch"/>'+
'						<xs:enumeration value="foot"/>'+
'						<xs:enumeration value="yard"/>'+
'					</xs:restriction>'+
'				</xs:simpleType>'+
'			</xs:list>'+
'		</xs:simpleType>'+
'	</xs:union>'+
'</xs:simpleType>'+
'</xs:schema>';