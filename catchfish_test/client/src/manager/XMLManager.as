package client.src.manager {
import client.src.Data.BulletVO;
import client.src.Data.DataProxy;
import client.src.Data.FishVO;

import laya.utils.WeakObject;

public class XMLManager {
    private static var _instance:XMLManager;
    public function XMLManager() {
    }

    public static function get instance():XMLManager
    {
        return _instance||=new XMLManager();
    }

    public function init():void
    {
        initBulletData();
        initFishData();
    }

    private function initBulletData():void
    {
        var xmldom:XmlDom=Laya.loader.getRes("res/xml/bullet.xml");
        var xmlArr:Array=xmldom.firstChild.childNodes;
        var bulletVo:BulletVO;
        for(var i:int=0;i<xmlArr.length;i++){
            /*
            bulletVo=new BulletVO();
            var obj:Object=xmlArr[i].attributes;
            bulletVo.type=obj.type.value;
            bulletVo.speed=obj.speed.value;
            bulletVo.boomRadius=obj.boomRadius.value;
            bulletVo.powerRadius=obj.powerRadius.value;
            bulletVo.power=obj.power.value;
            */
            var node:XmlDom=xmlArr[i];
            bulletVo=new BulletVO();
            bulletVo.type=parseInt(node.getAttribute("type"));
            bulletVo.speed=parseInt(node.getAttribute("speed"))
            bulletVo.power=parseInt(node.getAttribute("power"));
            bulletVo.boomRadius=parseInt(node.getAttribute("boomRadius"));
            bulletVo.powerRadius=parseInt(node.getAttribute("powerRadius"));

            DataProxy.instance.bulletDic.set(bulletVo.type,bulletVo);
        }
    }

    private function initFishData():void
    {
        var xmldom:XmlDom=Laya.loader.getRes("res/xml/fish.xml");
        var xmlArr:Array=xmldom.firstChild.childNodes;
        var fishVo:FishVO;

        for(var i:int=0;i<xmlArr.length;i++){
            var nodeD:XmlDom=xmlArr[i];
            if(nodeD.nodeName=="fish"){
                var nodeArr:Array=nodeD.childNodes;
                fishVo=new FishVO();
                for(var k:int=0;k<nodeArr.length;k++){
                    var sunnode:XmlDom=nodeArr[k];
                    if (sunnode.nodeName == "name") {
                        fishVo.name = sunnode.firstChild.nodeValue;
                    }else if (sunnode.nodeName == "id") {
                        fishVo.id = parseInt(sunnode.firstChild.nodeValue);
                    }else if (sunnode.nodeName == "liveUrl") {
                        fishVo.liveUrl = sunnode.firstChild.nodeValue;
                    }else if (sunnode.nodeName == "deadUrl") {
                        fishVo.deadUrl = sunnode.firstChild.nodeValue;
                    }else if (sunnode.nodeName == "grade") {
                        fishVo.grade = parseInt(sunnode.firstChild.nodeValue);
                    }else if (sunnode.nodeName == "blood_min") {
                        fishVo.blood_min = parseInt(sunnode.firstChild.nodeValue);
                    }else if (sunnode.nodeName == "blood_Max") {
                        fishVo.blood_Max = parseInt(sunnode.firstChild.nodeValue);
                    }else if (sunnode.nodeName == "score") {
                        fishVo.score = parseInt(sunnode.firstChild.nodeValue);
                    }else if (sunnode.nodeName == "speed") {
                        fishVo.speed = parseInt(sunnode.firstChild.nodeValue);
                    }else if (sunnode.nodeName == "hitValue"){
                        fishVo.hitValue = parseInt(sunnode.firstChild.nodeValue);
                    }
                }
                DataProxy.instance.fishDic.set(fishVo.id,fishVo);
            }
        }
        //console.log("-fishDic:",DataProxy.instance.fishDic);
        //console.log("-bulletDic:",DataProxy.instance.bulletDic);
    }


}
}
