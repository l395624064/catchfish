package client.src.view.loadview {
import client.src.manager.GameEvent;
import client.src.manager.GameEventDisPatch;

import laya.events.Event;
import laya.net.Loader;
import laya.utils.Ease;
import laya.utils.Handler;
import laya.utils.Tween;

import ui.LoadingUI;

public class Loadview extends LoadingUI{
    private static var _instance:Loadview;

    private var Bar_MIN:int=0;
    private var Bar_MAX:int=360;

    public function Loadview() {
    }
    public static function get instance():Loadview
    {
        return _instance||=new Loadview();
    }

    public function openPanel():void
    {
        this.btn_start.visible=false;
        this.bars.width=Bar_MIN;

        var resArr:Array=[
                //ani
            {url:"res/atlas/fish/effect/flash.atlas",           type:Loader.ATLAS},
            {url:"res/atlas/fish/money/coin.atlas",             type:Loader.ATLAS},
            {url:"res/atlas/fish/money/silver.atlas",           type:Loader.ATLAS},
            {url:"res/atlas/fish/seaweed/seaweed1.atlas",       type:Loader.ATLAS},
            {url:"res/atlas/fish/seaweed/seaweed2.atlas",       type:Loader.ATLAS},
            {url:"res/atlas/fish/seaweed/seaweed3.atlas",       type:Loader.ATLAS},
            {url:"res/atlas/fish/seaweed/seaweed4.atlas",       type:Loader.ATLAS},
            {url:"res/atlas/fish/tools/boom.atlas",             type:Loader.ATLAS},
                //view
            {url:"res/atlas/fish/img.atlas",                        type:Loader.ATLAS},
            {url:"res/atlas/fish/tip.atlas",                        type:Loader.ATLAS},
            {url:"res/atlas/fish/tools.atlas",                      type:Loader.ATLAS},
            {url:"res/atlas/comp.atlas",                            type:Loader.ATLAS},
                //img
            {url:"fish/img/img1.png",                               type:Loader.IMAGE},
            {url:"fish/img/img2.jpg",                               type:Loader.IMAGE},

                //xml
            {url:"res/xml/bullet.xml",                     type:Loader.XML},
            {url:"res/xml/fish.xml",                       type:Loader.XML}
        ];

        //fish res
        for(var i:int=1;i<13;i++){
            var dead:Object={url:"res/atlas/fish/fishimg/fish"+i+"/dead.atlas",       type:Loader.ATLAS};
            var live:Object={url:"res/atlas/fish/fishimg/fish"+i+"/live.atlas",       type:Loader.ATLAS};
            resArr.push(dead);
            resArr.push(live);
        }

        //cannon res
        for(var i:int=1;i<8;i++){
            var cannon:Object={url:"res/atlas/fish/cannon/cannon"+i+".atlas",       type:Loader.ATLAS};
            resArr.push(cannon);
        }

        //bullet res
        for(var i:int=1;i<10;i++){
            var bullet:Object={url:"res/atlas/fish/bullet/bullet"+i+".atlas",       type:Loader.ATLAS};
            resArr.push(bullet);
        }

        console.log("-resArr:",resArr);
        Laya.loader.load(resArr,Handler.create(this,loadCom),Handler.create(this,loadPro,null,false));
    }



    private function loadPro(value:Number):void
    {
        this.bars.width=value*Bar_MAX;
    }

    private function loadCom():void
    {
        this.btn_start.visible=true;
        btn_start.once(Event.MOUSE_DOWN,this,function () {
            closePanel();
        });
    }

    private function closePanel():void
    {
        Tween.to(this,{alpha:0},300,Ease.backOut,Handler.create(this,function () {
            GameEventDisPatch.instance.event(GameEvent.GAME_START);
        }));
    }
}
}
