
part of asn1lib;

class ASN1OctetString extends ASN1Object {

  String stringValue;

  ASN1OctetString(this.stringValue) {
    _tag = OCTET_STRING_TYPE;
  }

  ASN1OctetString.withTag(int tag,this.stringValue) {
    _tag = tag;
  }


  ASN1OctetString.fromBytes(Uint8List bytes) {
    _encodedBytes = bytes;
    _initFromBytes();

    stringValue = decodeOctetString( valueBytes() );
  }


  encode() {
    var valBytes = stringValue.codeUnits;
    valueByteLength  = valBytes.length;
    super.encode();
    this.encodedBytes.setRange(valueStartPosition, valBytes.length, valBytes);
  }



  static String decodeOctetString(Uint8List bytes) => new String.fromCharCodes(bytes);

  String toString() => "OctetString(${stringValue})";

}
