package client.src.view.gamemain {
import client.src.element.seaweed.SeaweedFactory;

import ui.GameViewUI;

public class Gamemain extends GameViewUI{
    private static var _instance:Gamemain;
    public function Gamemain() {
    }
    public static function get instance():Gamemain
    {
        return _instance||=new Gamemain();
    }

    public function openPanel():void
    {
        initData();
        initView();
        initEvent();

    }

    private function initData():void
    {

    }
    private function initView():void
    {
        SeaweedFactory.instance.creatSeaweed(bottomCon,15);

    }
    private function initEvent():void
    {

    }

}
}
