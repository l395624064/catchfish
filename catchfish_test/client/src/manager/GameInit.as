package client.src.manager {
import client.src.control.GlobalControl;

public class GameInit {
    private static var _instance:GameInit;
    public function GameInit() {
    }
    public static function get instance():GameInit
    {
        return _instance||=new GameInit();
    }


    public function init():void
    {
        //initView();
        initModel();
        initControl();
    }

    public function initView():void
    {

    }

    public function initModel():void
    {

    }
    public function initControl():void
    {
        GlobalControl.instance;
    }

}
}
