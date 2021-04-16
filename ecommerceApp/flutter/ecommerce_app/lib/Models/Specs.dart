class Specs {
  String? simCard;
  String? screen;
  String? ram;
  String? internalMemoy;
  String? rearCamera;
  String? selfiCamera;
  String? color;

  Specs.fromJson(Map<String, dynamic> jsonResp) {
    simCard = jsonResp.containsKey("SIMCard") ? jsonResp['SIMCard'] : null;
    screen = jsonResp.containsKey("screen") ? jsonResp['Screen'] : null;
    ram = jsonResp.containsKey("Ram") ? jsonResp["Ram"] : null;
    internalMemoy = jsonResp.containsKey("InternalMemory")
        ? jsonResp["InternalMemory"]
        : null;
    rearCamera =
        jsonResp.containsKey("RearCamera") ? jsonResp["RearCamera"] : null;
    selfiCamera =
        jsonResp.containsKey("SelfieCamera") ? jsonResp["SelfieCamera"] : null;
    color = jsonResp.containsKey("Color") ? jsonResp["Color"] : null;
  }
}
