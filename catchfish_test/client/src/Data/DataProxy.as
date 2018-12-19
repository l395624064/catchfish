package client.src.Data {
import laya.utils.WeakObject;

public class DataProxy {
    private static var _instance:DataProxy;
    public function DataProxy() {
    }

    public static function get instance():DataProxy
    {
        return _instance||=new DataProxy();
    }

    private var _fishDic:WeakObject=new WeakObject();
    public function get fishDic():WeakObject
    {
        return _fishDic;
    }
    public function set fishDic(value:WeakObject):void
    {
        _fishDic=value;
    }
    public function checkFishDataByType(typeId:int):FishVO
    {
        var _fishvo:FishVO=_fishDic.get(typeId);
        return _fishvo;
    }

    private var _bulletDic:WeakObject=new WeakObject();
    public function get bulletDic():WeakObject
    {
        return _bulletDic;
    }
    public function set bulletDic(value:WeakObject):void
    {
        _bulletDic=value;
    }
    public function checkBulletDataById(id:int):BulletVO
    {
        var _bulletvo:BulletVO=_bulletDic.get(id);
        return _bulletvo;
    }


}
}
