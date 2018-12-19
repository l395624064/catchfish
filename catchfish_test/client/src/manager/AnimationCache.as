package client.src.manager {
import laya.display.Animation;

public class AnimationCache {
    private static var _instance:AnimationCache;
    public function AnimationCache() {
    }
    public static function get instance():AnimationCache
    {
        return _instance||=new AnimationCache();
    }


    public function init():void
    {
        seaweedCache();
    }

    private function seaweedCache():void
    {
        Animation.createFrames("res/atlas/fish/seaweed/seaweed1.atlas","seaweed1");
        Animation.createFrames("res/atlas/fish/seaweed/seaweed2.atlas","seaweed2");
        Animation.createFrames("res/atlas/fish/seaweed/seaweed3.atlas","seaweed3");
        Animation.createFrames("res/atlas/fish/seaweed/seaweed4.atlas","seaweed4");
    }
}
}
