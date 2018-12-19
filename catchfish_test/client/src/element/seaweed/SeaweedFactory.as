package client.src.element.seaweed {
import client.src.GlobalConfig;
import client.src.GlobalConfig;

import laya.display.Sprite;
import laya.maths.Point;

public class SeaweedFactory {
    private static var _instance:SeaweedFactory;
    public function SeaweedFactory() {
    }
    public static function get instance():SeaweedFactory
    {
        return _instance||=new SeaweedFactory();
    }


    /*
    * @param container:父容器
    * @param num:数量
    * */
    public function creatSeaweed(container:Sprite,num:Number):void
    {
        //num=Math.min(12,num);

        for(var i:int=0;i<num;i++){
            var seaweed:Seaweed=new Seaweed();
            container.addChild(seaweed);

            var sizeR:Number=Math.random()*0.6+0.4;
            seaweed.size(sizeR,sizeR);

            var rotaR:Number=Math.floor(Math.random()*360);
            seaweed.rotation=rotaR;

            var aniSize:Number=120;
            var indexX:int=Math.floor((GlobalConfig._GlobalWidth-GlobalConfig._fixbroad)/aniSize);
            var indexY:int=Math.floor((GlobalConfig._GlobalHeight-GlobalConfig._fixbroad)/aniSize);
            var posX:Number=GlobalConfig._fixbroad+Math.round(Math.random()*indexX)*aniSize;
            var posY:Number=GlobalConfig._fixbroad+Math.round(Math.random()*indexY)*aniSize;
            seaweed.pos(posX,posY);
        }

    }
}
}
