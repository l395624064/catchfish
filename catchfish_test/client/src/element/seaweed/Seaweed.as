package client.src.element.seaweed {
import laya.display.Animation;
import laya.display.Sprite;

public class Seaweed extends Sprite {

    private var _animationBody:Animation;
    private var _interval:Number=100;

    public function Seaweed() {
        super();
        _animationBody||=new Animation();
        _animationBody.interval=_interval;
        _animationBody.play(Math.ceil(Math.random()*10),true,"seaweed"+Math.ceil(Math.random()*4));
        this.addChild(_animationBody);
    }


}
}
