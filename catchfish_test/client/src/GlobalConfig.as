package client.src {
public class GlobalConfig {

    public static var _GlobalWidth:int=1282;
    public static var _GlobalHeight:int=709;

    public static var _safeWidth:int=200;
    public static var _safeHeight:int=100;

    public static var _fixbroad:Number=30;//边距

    public static var _fightInterval:Number=300;

    private static var _lvnum:Number=1;//关卡
    public static var _lvAddValue:Number=0;

    public static var _maxFishNum:Number=30;

    public static function get lvnum():Number
    {
        return _lvnum;
    }
    public static function set lvnum(value:Number):void
    {
        _lvnum=value;
        _lvnum=Math.min(_lvnum,40);
        _lvAddValue=1+_lvnum*0.05;
    }

    public static var _coinNum:Number=100;
    public static var _shootPower:Number = 1;//子弹威力
    public static var _baseCannonType:Number=7;
    public function GlobalConfig() {
    }
}
}
