import 'package:shared_preferences/shared_preferences.dart';
class SP {
  Map<String, String> _spType = {
    'userInfo': 'Map',
    'a': 'String',
    'authorization': 'String'
  };
  /*
   * 存储数据
   */
  Future saveData(key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
    print('存储$key为:$value');
  }
  /*
   * 读取数据
   */
  Future getData(key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String value = preferences.get(key);
    return value;
  }

  /*
   * 删除数据
   */
  Future removeData(key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
    print('删除$key成功');
  }

}