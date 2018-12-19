package client.src.control {
import client.src.manager.AnimationCache;
import client.src.manager.GameEvent;
import client.src.manager.GameEventDisPatch;
import client.src.manager.GameInit;
import client.src.manager.XMLManager;
import client.src.view.gamemain.Gamemain;
import client.src.view.loadview.Loadview;

import laya.net.Loader;

import laya.utils.Handler;

public class GlobalControl {
    private static var _instance:GlobalControl;
    public function GlobalControl() {
        GameEventDisPatch.instance.on(GameEvent.GAME_LOAD,this,gameload);
        GameEventDisPatch.instance.on(GameEvent.GAME_START,this,gamestart);
        GameEventDisPatch.instance.on(GameEvent.GAME_PAUSE,this,gamepause);
    }
    public static function get instance():GlobalControl
    {
        return _instance||=new GlobalControl();
    }

    public function gameload():void
    {
        var loadviewRes:Array=[
            {url:"res/atlas/fish/load.atlas",       type:Loader.ATLAS},
            {url:"fish/img/img3.png",               type:Loader.IMAGE},
            {url:"fish/img/img4.jpg",               type:Loader.IMAGE}
        ];
        Laya.loader.load(loadviewRes,Handler.create(this,function () {
            GameInit.instance.init();

            Laya.stage.addChild(Loadview.instance);
            Loadview.instance.openPanel();
        }));
    }

    public function gamestart():void
    {
        AnimationCache.instance.init();
        XMLManager.instance.init();

        Laya.stage.addChild(Gamemain.instance);
        Gamemain.instance.openPanel();
    }
    public function gamepause():void
    {

    }


}
}
